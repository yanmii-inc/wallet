import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/list/transaction_item_tile.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/transactions_controller.dart';

class TransactionsListSection extends ConsumerWidget {
  const TransactionsListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionsControllerProvider).transactions;

    return transactions.when(
      data: (data) {
        if (data.isEmpty) {
          return const Center(child: Text('No data'));
        }

        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final transactionId = data[index].id!;
            return TransactionItemTile(transactionId: transactionId);
          },
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
