import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/transactions/application/transactions_service.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/list/transaction_item_tile.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/transactions_controller.dart';

class TransactionsListSection extends ConsumerStatefulWidget {
  const TransactionsListSection({super.key});

  @override
  ConsumerState<TransactionsListSection> createState() =>
      _TransactionsListSectionState();
}

class _TransactionsListSectionState
    extends ConsumerState<TransactionsListSection> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final transactions = ref.watch(transactionsControllerProvider).transactions;
    ref.listen(transactionsServiceProvider, (previous, next) {
      if (next.length != previous?.length) {
        ref.read(transactionsControllerProvider.notifier).getTransactions(
              ref.watch(transactionsControllerProvider).selectedDate,
            );
        _scrollToBottom();
      }
    });

    return transactions.when(
      data: (data) {
        if (data.isEmpty) {
          return const Center(child: Text('No data'));
        }

        return ListView.builder(
          key: const PageStorageKey('transactions_list'),
          controller: _scrollController,
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

  void _scrollToBottom() {
    if (_scrollController.hasClients && _scrollController.position.pixels > 0) {
      Future.delayed(const Duration(seconds: 1), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }
}
