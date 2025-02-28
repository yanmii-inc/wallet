import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:yanmii_wallet/src/common/domain/entities/transaction_entity.dart';
import 'package:yanmii_wallet/src/features/report/presentation/transaction_history_controller.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/list/transactions_list_section.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

enum TransactionHistoryType {
  title,
  category,
}

class TransactionHistoryScreen extends ConsumerStatefulWidget {
  const TransactionHistoryScreen({
    required this.startDate,
    required this.type,
    this.title,
    this.categoryId,
    super.key,
  });
  final String? title;
  final int? categoryId;
  final DateTime startDate;
  final TransactionHistoryType type;

  @override
  ConsumerState<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState
    extends ConsumerState<TransactionHistoryScreen> {
  @override
  void initState() {
    super.initState();

    if (widget.type == TransactionHistoryType.title && widget.title != null) {
      ref
          .read(transactionHistoryControllerProvider.notifier)
          .getTransactionsByTitle(widget.title!, widget.startDate);
    } else if (widget.type == TransactionHistoryType.category &&
        widget.categoryId != null) {
      ref
          .read(transactionHistoryControllerProvider.notifier)
          .getTransactionsByCategory(widget.categoryId!, widget.startDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final transactions =
        ref.watch(transactionHistoryControllerProvider).transactions;
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'.hardcoded),
      ),
      body: transactions.when(
        data: (transactions) {
          if (transactions.isEmpty) {
            return const Center(child: Text('No transactions found'));
          }

          return GroupedListView<TransactionEntity, DateTime>(
            elements: transactions,
            groupBy: (transaction) =>
                DateUtils.dateOnly(DateTime.parse(transaction.date)),
            order: GroupedListOrder.DESC,
            useStickyGroupSeparators: true,
            groupSeparatorBuilder: (DateTime date) => Container(
              padding: const EdgeInsets.all(16),
              color: Theme.of(context).colorScheme.surface,
              child: Text(
                DateFormat('EEEE, MMMM d, y').format(date),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            separator: Divider(
              thickness: 4,
              color: Theme.of(context).colorScheme.surface,
            ),
            itemBuilder: (context, transaction) =>
                TransactionItemTile(item: transaction),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text(error.toString())),
      ),
    );
  }
}
