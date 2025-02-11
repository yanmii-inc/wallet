import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/wallet/application/wallet_service.dart';
import 'package:yanmii_wallet/src/features/wallet/presentation/wallet_state.dart';

class WalletController extends StateNotifier<WalletState> {
  WalletController(this.ref) : super(const WalletState());
  final Ref ref;

  WalletService get _walletService => ref.read(walletServiceProvider.notifier);

  Future<void> getWallets() async {
    await _walletService.getWallets();
    state = state.copyWith(wallets: ref.watch(walletServiceProvider));
  }
}

final walletControllerProvider =
    StateNotifierProvider<WalletController, WalletState>(
  (ref) => WalletController(ref)..getWallets(),
);
