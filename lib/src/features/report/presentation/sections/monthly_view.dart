part of '../report_screen.dart';

class _MonthlyView extends ConsumerWidget {
  const _MonthlyView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final months = ref.watch(monthlyControllerProvider).months;
    return Expanded(
      child: months.when(
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
      ),
    );
  }
}

class _MonthItem extends ConsumerWidget {
  const _MonthItem(this.month);
  final MonthlyBalanceEntity month;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () {
        ref
            .read(detailedControllerProvider.notifier)
            .getRealTimeReport(month.startDate);
        context.pushNamed(Routes.detailedReport.name, extra: month.startDate);
      },
      title: Column(
        children: [
          Gap.h16,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${month.startDate.toDdMmYyyy} - ${month.endDate.toDdMmYyyy}',
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
                month.totalExpense.toIdr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Income'.hardcoded),
              Text(
                month.totalIncome.toIdr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Monthly Balance'.hardcoded),
              Text(
                '${month.monthlyBalance >= 0 ? '+' : ''}${month.monthlyBalance.toIdr}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: month.monthlyBalance >= 0 ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          if (month.showRunningBalance)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Running Balance:'.hardcoded),
                Text(
                  month.runningBalance.toIdr,
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
