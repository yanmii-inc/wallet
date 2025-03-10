import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/summary_view_controller.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/theme_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/datetime_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/num_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

class SummaryView extends ConsumerWidget {
  const SummaryView({
    required this.startDate,
    required this.endDate,
    super.key,
  });

  final DateTime startDate;
  final DateTime endDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthlyBalance =
        ref.watch(summaryViewControllerProvider).monthlyBalance;
    final totalExpense = ref.watch(summaryViewControllerProvider).totalExpense;
    final totalIncome = ref.watch(summaryViewControllerProvider).totalIncome;

    final balance = '${(monthlyBalance.value ?? 0) >= 0 ? '+' : ''}'
        '${monthlyBalance.value?.toIdr}';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Gap.h16,
          Text(
            '${startDate.toDdMmYyyy} - '
            '${endDate.toDdMmYyyy}',
            style: context.textTheme.titleSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Gap.h8,
          Divider(color: context.theme.colorScheme.surfaceContainer),
          Gap.h8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Expense '.hardcoded),
              Text(
                totalExpense.value?.toIdr ?? '0',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Income'.hardcoded),
              Text(
                totalIncome.value?.toIdr ?? '0',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Monthly Balance'.hardcoded),
              Text(
                balance,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: (monthlyBalance.value ?? 0) >= 0
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ],
          ),
          Gap.h16,
        ],
      ),
    );
  }
}
