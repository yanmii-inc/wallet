import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/domain/entities/monthly_balance_entity.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/per_title_recap/per_title_recap_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/theme_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/num_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/widget_extension.dart';

class PerTitleRecapView extends ConsumerStatefulWidget {
  const PerTitleRecapView({
    required this.monthlyBalance,
    super.key,
  });
  final MonthlyBalanceEntity monthlyBalance;

  @override
  ConsumerState<PerTitleRecapView> createState() => _DailyBreakdownViewState();
}

class _DailyBreakdownViewState extends ConsumerState<PerTitleRecapView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(perTitleRecapControllerProvider.notifier)
          .getTitleTransactions(widget.monthlyBalance.startDate);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final titleReports =
        ref.watch(perTitleRecapControllerProvider).titleReports;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: titleReports.when(
        data: (transactions) {
          return ListView.separated(
            itemCount: transactions.length,
            separatorBuilder: (context, index) => Divider(
              thickness: 4,
              color: context.theme.colorScheme.surface,
            ),
            itemBuilder: (context, index) {
              final e = transactions[index];
              return InkWell(
                onTap: () {
                  context.pushNamed(
                    '${Routes.transactionHistory.name}byTitle',
                    pathParameters: {
                      'title': e.name,
                      'date': widget.monthlyBalance.startDate.toIso8601String(),
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      e.name,
                      style: context.theme.textTheme.labelMedium,
                    ).expand,
                    Text(
                      e.amount.toDecimal(context),
                      style: context.theme.textTheme.labelMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
          );
        },
        error: (error, stackTrace) => const Center(child: Text('Error')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
