import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/wallet/presentation/wallet_controller.dart';

/// [WalletScreen] is a screen for Wallet
class WalletScreen extends ConsumerWidget {
  /// Create [WalletScreen] object with a key
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallets = ref.watch(walletControllerProvider).wallets;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: wallets.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(data[index].name),
            );
          },
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
