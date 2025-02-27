import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/domain/entities/monthly_balance_entity.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/theme_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/datetime_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/num_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

class SummaryView extends ConsumerWidget {
  const SummaryView({
    required this.monthlyBalance,
    super.key,
  });

  final MonthlyBalanceEntity monthlyBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = '${monthlyBalance.monthlyBalance >= 0 ? '+' : ''}'
        '${monthlyBalance.monthlyBalance.toIdr}';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Gap.h16,
          Text(
            '${monthlyBalance.startDate.toDdMmYyyy} - '
            '${monthlyBalance.endDate.toDdMmYyyy}',
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
                monthlyBalance.totalExpense.toIdr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Income'.hardcoded),
              Text(
                monthlyBalance.totalIncome.toIdr,
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
                  color: monthlyBalance.monthlyBalance >= 0
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ],
          ),
          if (monthlyBalance.showRunningBalance)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Running Balance:'.hardcoded),
                Text(
                  monthlyBalance.runningBalance.toIdr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
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
