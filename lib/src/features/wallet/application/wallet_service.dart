import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/mappers/transaction_mapper.dart';
import 'package:yanmii_wallet/src/common/data/models/local/wallet.dart';
import 'package:yanmii_wallet/src/common/data/repositories/wallet_repository.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';

class WalletService extends StateNotifier<AsyncValue<List<WalletEntity>>> {
  WalletService(this.ref) : super(const AsyncLoading());
  Ref ref;
  WalletRepository get _walletRepository => ref.read(walletRepositoryProvider);

  Future<void> getWallets() async {
    final result = await _walletRepository.getWallets();

    result.when(
      success: (data) {
        final mapper = ref.read(transactionMapperProvider);
        final walletEntities =
            data.map(mapper.mapWalletToWalletEntity).toList();
        state = AsyncValue.data(walletEntities);
      },
      failure: (error, stackTrace) => state = AsyncError(error, stackTrace),
    );
  }

  Future<void> addWallet(String? logo, String name, int balance) async {
    final wallet = Wallet(
      name: name,
      logo: logo,
      balance: balance,
    );
    final result = await _walletRepository.createWallet(wallet);

    result.when(
      success: (id) {
        final mapper = ref.read(transactionMapperProvider);

        final walletEntity =
            mapper.mapWalletToWalletEntity(wallet.copyWith(id: id));
        log('walletEntity $walletEntity');
        state = AsyncData([...state.value ?? [], walletEntity]);
      },
      failure: (error, stackTrace) => state = AsyncError(error, stackTrace),
    );
  }

  Future<void> editWallet(int id, String? logo, String name) async {
    final wallet = Wallet(
      id: id,
      name: name,
      logo: logo,
    );
    final result = await _walletRepository.updateWallet(wallet);

    result.when(
      success: (id) {
        final mapper = ref.read(transactionMapperProvider);

        state = AsyncData(
          [
            ...(state.value ?? []).map(
              (e) {
                if (e.id == id) {
                  return mapper.mapWalletToWalletEntity(wallet);
                } else {
                  return e;
                }
              },
            )
          ],
        );
      },
      failure: (error, stackTrace) => state = AsyncError(error, stackTrace),
    );
  }
}

final walletServiceProvider =
    StateNotifierProvider<WalletService, AsyncValue<List<WalletEntity>>>(
  WalletService.new,
);
