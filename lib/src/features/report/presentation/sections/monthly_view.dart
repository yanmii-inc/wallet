import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/domain/entities/monthly_balance_entity.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/monthly_view_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/theme_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/datetime_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/num_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/widget_extension.dart';

class MonthlyView extends ConsumerStatefulWidget {
  const MonthlyView({super.key});

  @override
  ConsumerState<MonthlyView> createState() => _MonthlyViewState();
}

class _MonthlyViewState extends ConsumerState<MonthlyView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(monthlyControllerProvider.notifier).getMonthlyRecaps();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final months = ref.watch(monthlyControllerProvider).months;
    return months.when(
      data: (data) => ListView.separated(
        separatorBuilder: (context, index) => Container(
          height: 4,
          width: double.infinity,
          color: context.theme.colorScheme.surfaceContainer,
        ),
        shrinkWrap: true,
        itemBuilder: (context, index) => _MonthItem(data[index]),
        itemCount: data.length,
      ),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _MonthItem extends ConsumerWidget {
  const _MonthItem(this.monthlyBalance);
  final MonthlyBalanceEntity monthlyBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = '${monthlyBalance.monthlyBalance >= 0 ? '+' : ''}'
        '${monthlyBalance.monthlyBalance.toIdr}';
    return ListTile(
      onTap: () {
        context.pushNamed(
          Routes.detailedReport.name,
          extra: {
            'start_date': monthlyBalance.startDate,
            'end_date': monthlyBalance.endDate,
          },
        );
      },
      title: Column(
        children: [
          Gap.h16,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${monthlyBalance.startDate.toDdMmYyyy} - '
                '${monthlyBalance.endDate.toDdMmYyyy}',
                style: context.textTheme.titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ).expand,
              const Icon(Icons.arrow_right),
            ],
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
        ],
      ),
    );
  }
}
