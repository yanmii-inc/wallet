import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yanmii_wallet/src/common/data/models/local/category.dart';
import 'package:yanmii_wallet/src/common/data/repositories/category_repository.dart';
import 'package:yanmii_wallet/src/common/services/auth_service.dart';

class CategorySyncService extends StateNotifier<bool> {

  CategorySyncService(this.ref) : super(false);
  Future<void> syncCategoryById(int categoryId) async {
    final authService = ref.read(authServiceProvider);
    final categoryRepo = ref.read(categoryRepositoryProvider);
    final client = Supabase.instance.client;

    if (!authService.isAuthenticated || authService.currentUser?.uid == null) {
      log('Skipping category sync: Not authenticated or no user ID');
      return;
    }

    // Get local category
    final localResult = await categoryRepo.getCategories();
    final localCategory = localResult.when(
      success: (categories) =>
          categories.firstWhereOrNull((c) => c.id == categoryId),
      failure: (e, st) => null,
    );
    if (localCategory == null) {
      log('No local category found for id $categoryId');
      return;
    }

    // Check if category exists in Supabase
    final cloudResult = await client
        .from('categories')
        .select()
        .eq('user_id', authService.currentUser!.uid)
        .eq('label', localCategory.label)
        .maybeSingle();

    if (cloudResult == null) {
      // Upload category to Supabase
      log('Uploading category ${localCategory.label} to Supabase');
      final categoryData = {
        'label': localCategory.label,
        'user_id': authService.currentUser!.uid,
        if (localCategory.updatedAt != null)
          'updated_at': localCategory.updatedAt!.toIso8601String(),
      };
      await client.from('categories').insert(categoryData);
    } else {
      log('Category already exists in Supabase: ${localCategory.label}');
    }
  }

  final Ref ref;
  bool _isSyncing = false;

  Future<void> syncCategories() async {
    // Prevent multiple syncs from running simultaneously
    if (_isSyncing) {
      log('Sync already in progress, skipping');
      return;
    }

    final authService = ref.read(authServiceProvider);
    final categoryRepo = ref.read(categoryRepositoryProvider);
    final client = Supabase.instance.client;

    if (!authService.isAuthenticated || authService.currentUser?.uid == null) {
      log('Skipping category sync: Not authenticated or no user ID');
      return;
    }

    _isSyncing = true;

    state = true;
    log('Starting category sync for user: ${authService.currentUser?.uid}');

    try {
      // Get all local categories
      final localResult = await categoryRepo.getCategories();
      await localResult.when(
        success: (List<Category> localCategories) async {
          log('Found ${localCategories.length} local categories');

          try {
            // Get all cloud categories
            log('Fetching cloud categories...');
            final cloudResult = await client
                .from('categories')
                .select()
                .eq('user_id', authService.currentUser!.uid);

            final cloudCategories = (cloudResult as List).map((dynamic item) {
              final json = item as Map<String, dynamic>;
              final localJson = Map<String, dynamic>.from(json);
              if (localJson.containsKey('id')) {
                localJson['cloud_id'] = localJson['id'].toString();
                localJson.remove('id');
              }
              return Category.fromJson(localJson);
            }).toList();
            log('Found ${cloudCategories.length} cloud categories');

            // Check if any sync is needed

            // Find categories that need to be uploaded (new local)
            final newLocalCategories = localCategories.where((t) {
              if (t.cloudId != null) return false;
              return !cloudCategories.any((c) => c.label == t.label);
            }).toList();

            // Find categories that need to be updated (existing but changed)
            final categoriesToUpdate = localCategories.where((local) {
              if (local.cloudId == null) return false;
              final cloud = cloudCategories.firstWhere(
                (c) => c.cloudId == local.cloudId,
                orElse: () => local,
              );
              return cloud != local;
            }).toList();

            // Find new cloud categories to download
            final newCloudCategories = cloudCategories
                .where(
                  (c) => !localCategories
                      .any((l) => l.cloudId == c.cloudId || l.label == c.label),
                )
                .toList();

            if (newLocalCategories.isEmpty &&
                categoriesToUpdate.isEmpty &&
                newCloudCategories.isEmpty) {
              log('Categories already in sync');
              return;
            }

            // Batch upload new local categories
            if (newLocalCategories.isNotEmpty) {
              log('Uploading ${newLocalCategories.length} new categories');
              final batchUpload = newLocalCategories
                  .map((category) => {
                        'label': category.label,
                        'user_id': authService.currentUser!.uid,
                        if (category.updatedAt != null)
                          'updated_at': category.updatedAt!.toIso8601String(),
                      },)
                  .toList();

              final results =
                  await client.from('categories').insert(batchUpload).select();

              // Update local with cloud IDs
              for (var i = 0; i < results.length; i++) {
                final cloudId = results[i]['id'].toString();
                await categoryRepo.insert(
                  newLocalCategories[i].copyWith(cloudId: cloudId),
                );
              }
            }

            // Batch update existing categories
            if (categoriesToUpdate.isNotEmpty) {
              log('Updating ${categoriesToUpdate.length} categories');
              for (final local in categoriesToUpdate) {
                final supabaseData = {
                  'label': local.label,
                  if (local.updatedAt != null)
                    'updated_at': local.updatedAt!.toIso8601String(),
                };

                await client
                    .from('categories')
                    .update(supabaseData)
                    .eq('id', int.parse(local.cloudId!))
                    .select();
              }

              // Update local with cloud versions
              final cloudVersions = cloudCategories
                  .where((c) =>
                      categoriesToUpdate.any((l) => l.cloudId == c.cloudId),)
                  .toList();

              if (cloudVersions.isNotEmpty) {
                await categoryRepo.insertAll(cloudVersions);
              }
            }

            // Batch insert new cloud categories
            if (newCloudCategories.isNotEmpty) {
              log('Downloading ${newCloudCategories.length} new categories');
              await categoryRepo.insertAll(newCloudCategories);
            }

            log('Category sync completed successfully');
          } catch (e, st) {
            log('Error during cloud sync: $e\n$st');
          }
        },
        failure: (error, stackTrace) {
          log('Error getting local categories: $error\n$stackTrace');
        },
      );
    } catch (e, st) {
      log('Error during category sync: $e\n$st');
    } finally {
      state = false;
      _isSyncing = false;
    }
  }
}

final categorySyncServiceProvider =
    StateNotifierProvider<CategorySyncService, bool>(
        CategorySyncService.new,);
