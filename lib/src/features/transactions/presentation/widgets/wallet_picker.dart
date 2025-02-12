import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/add/add_transaction_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';

class WalletPicker extends ConsumerWidget {
  const WalletPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = ref.watch(addTransactionControllerProvider).walletOptions;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: options.when(
          data: (wallets) {
            return GridView.builder(
              itemCount: wallets.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (BuildContext context, int index) {
                final wallet = wallets[index];
                return InkWell(
                  onTap: () {
                    ref
                        .read(addTransactionControllerProvider.notifier)
                        .setWallet(wallet);
                    context.pop(wallet);
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(wallet.name),
                    ),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
