import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/per_category_recap/per_category_recap_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/theme_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/num_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/widget_extension.dart';

class PerCategoryRecapView extends ConsumerStatefulWidget {
  const PerCategoryRecapView({
    required this.startDate,
    super.key,
  });
  final DateTime startDate;

  @override
  ConsumerState<PerCategoryRecapView> createState() => _PerCategoryViewState();
}

class _PerCategoryViewState extends ConsumerState<PerCategoryRecapView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(perCategoryRecapControllerProvider.notifier)
          .getCategoryTransactions(widget.startDate);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryReports =
        ref.watch(perCategoryRecapControllerProvider).categoryReports;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: categoryReports.when(
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
                  log('onTap ${e.name} ${widget.startDate}');
                  context.pushNamed(
                    '${Routes.transactionHistory.name}byCategory',
                    pathParameters: {
                      'category_id': e.id.toString(),
                      'date': widget.startDate.toIso8601String(),
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
                      e.count.toDecimal(context),
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
