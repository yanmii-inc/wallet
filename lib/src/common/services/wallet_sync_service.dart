import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yanmii_wallet/src/common/data/models/local/wallet.dart';
import 'package:yanmii_wallet/src/common/data/repositories/wallet_repository.dart';
import 'package:yanmii_wallet/src/common/services/auth_service.dart';

class WalletSyncService {
  WalletSyncService(this.ref);

  final Ref ref;

  Future<void> syncWallets() async {
    final authService = ref.read(authServiceProvider);
    final walletRepo = ref.read(walletRepositoryProvider);
    final client = Supabase.instance.client;

    if (!authService.isAuthenticated || authService.currentUser?.uid == null) {
      log('Skipping wallet sync: Not authenticated or no user ID');
      return;
    }

    // Get all local wallets
    final localResult = await walletRepo.getWallets();
    final localWallets = localResult.when(
      success: (wallets) => wallets,
      failure: (e, st) => <Wallet>[],
    );

    // Get all cloud wallets
    final cloudResult = await client
        .from('wallets')
        .select()
        .eq('user_id', authService.currentUser!.uid);
    final cloudWallets =
        (cloudResult as List).map((json) => json['name']).toSet();

    // Upload missing wallets
    for (final wallet in localWallets) {
      if (!cloudWallets.contains(wallet.name)) {
        log('Uploading wallet ${wallet.name} to Supabase');
        final walletData = <String, dynamic>{
          ...wallet.toJson(),
          'user_id': authService.currentUser!.uid,
        }..remove('id');
        await client.from('wallets').insert(walletData);
      }
    }
    log('Wallet sync completed');
  }

  Future<void> syncWalletById(int walletId) async {
    final authService = ref.read(authServiceProvider);
    final walletRepo = ref.read(walletRepositoryProvider);
    final client = Supabase.instance.client;

    if (!authService.isAuthenticated || authService.currentUser?.uid == null) {
      log('Skipping wallet sync: Not authenticated or no user ID');
      return;
    }

    // Get local wallet
    final localResult = await walletRepo.getWallets();
    final localWallet = localResult.when(
      success: (wallets) => wallets.firstWhereOrNull((w) => w.id == walletId),
      failure: (e, st) => null,
    );
    if (localWallet == null) {
      log('No local wallet found for id $walletId');
      return;
    }

    // Check if wallet exists in Supabase
    final cloudResult = await client
        .from('wallets')
        .select()
        .eq('user_id', authService.currentUser!.uid)
        .eq('name', localWallet.name)
        .maybeSingle();

    if (cloudResult == null) {
      // Upload wallet to Supabase
      log('Uploading wallet ${localWallet.name} to Supabase');
      final walletData = <String, dynamic>{
        ...localWallet.toJson(),
        'user_id': authService.currentUser!.uid,
      };
      walletData.remove('id');
      await client.from('wallets').insert(walletData);
    } else {
      log('Wallet already exists in Supabase: ${localWallet.name}');
    }
  }
}

final walletSyncServiceProvider =
    Provider<WalletSyncService>(WalletSyncService.new);
