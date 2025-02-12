import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/mappers/transaction_mapper.dart';
import 'package:yanmii_wallet/src/common/data/models/local/category.dart';
import 'package:yanmii_wallet/src/common/data/repositories/category_repository.dart';
import 'package:yanmii_wallet/src/common/domain/entities/category_entity.dart';

class CategoryService extends StateNotifier<AsyncValue<List<CategoryEntity>>> {
  CategoryService(this.ref) : super(const AsyncLoading());
  Ref ref;

  CategoryRepository get _categoryRepository =>
      ref.watch(categoryRepositoryProvider);

  Future<void> saveCategory({
    required String name,
  }) async {
    final category = Category(label: name);
    final result = await _categoryRepository.createCategory(category);

    result.when(
      success: (data) {
        final mapper = ref.read(transactionMapperProvider);

        final categoryEntity =
            mapper.mapCategoryToCategoryEntity(category.copyWith(id: data));
        state = AsyncData([...state.value ?? [], categoryEntity]);
      },
      failure: (error, stackTrace) {
        state = AsyncError(error, stackTrace);
      },
    );
  }

  Future<void> getCategoryList() async {
    final mapper = ref.read(transactionMapperProvider);
    final result = await _categoryRepository.getCategories();

    result.when(
      success: (data) {
        final categories =
            data.map(mapper.mapCategoryToCategoryEntity).toList();

        state = AsyncData(categories);
      },
      failure: (error, stackTrace) {
        state = AsyncError(error, stackTrace);
      },
    );
  }
}

final categoryServiceProvider =
    StateNotifierProvider<CategoryService, AsyncValue<List<CategoryEntity>>>(
  CategoryService.new,
);
