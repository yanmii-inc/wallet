import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';
import 'package:yanmii_wallet/src/features/wallet/application/wallet_service.dart';
import 'package:yanmii_wallet/src/features/wallet/presentation/wallet_state.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

class WalletController extends StateNotifier<WalletState> {
  WalletController(this.ref) : super(const WalletState());
  final Ref ref;

  WalletService get _walletService => ref.read(walletServiceProvider.notifier);

  Future<void> getWallets() async {
    await _walletService.getWallets();
    state = state.copyWith(wallets: ref.watch(walletServiceProvider));
  }

  Future<void> addWallet(String? logo, String name, int balance) async {
    await _walletService.addWallet(logo, name, balance);
  }

  Future<void> editWallet(int id, String? logo, String name) async {
    await _walletService.editWallet(id, logo, name);
  }

  Future<int> checkTransaction(WalletEntity wallet) async {
    final count = await _walletService.checkTransaction(wallet.id);

    return count;
  }

  Future<void> deleteWallet(
    WalletEntity wallet, {
    DeletionActions? action,
  }) async {
    await _walletService.deleteWallet(wallet.id, action: action);
  }
}

enum DeletionActions {
  moveToAnotherWallet,
  softDelete,
  hardDelete,
  ;

  String get message {
    switch (this) {
      case DeletionActions.moveToAnotherWallet:
        return 'Pindah transaksi ke dompet lain?'.hardcoded;
      case DeletionActions.softDelete:
        return 'Pindah ke "dompet tak dikenal"?'.hardcoded;
      case DeletionActions.hardDelete:
        return 'Hapus transaksi secara permanen?'.hardcoded;
    }
  }
}

final walletControllerProvider =
    StateNotifierProvider<WalletController, WalletState>(
  (ref) => WalletController(ref)..getWallets(),
);
