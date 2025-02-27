import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/features/report/domain/entities/report_entity.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/datailed_view_controller.dart';
import 'package:yanmii_wallet/src/utils/color_utils.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/theme_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/datetime_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/num_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/widget_extension.dart';

class DetailedView extends ConsumerStatefulWidget {
  const DetailedView(this.startDateTime, {super.key});

  final DateTime startDateTime;

  @override
  ConsumerState<DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends ConsumerState<DetailedView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(detailedControllerProvider.notifier)
          .getRealTimeReport(widget.startDateTime);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final reports = ref.watch(detailedControllerProvider).categories;
    final startDateTime =
        ref.watch(detailedControllerProvider).startDateTime ?? DateTime.now();
    final startDate = startDateTime.toDdMmYyyy;
    final endDate = startDateTime.add(const Duration(days: 30)).toDdMmYyyy;
    return reports.when(
      data: (transactions) {
        if (transactions.isEmpty) {
          return const Center(child: Text('No transactions found.'));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Gap.h16,
              Text('$startDate - $endDate'.hardcoded),
              Gap.h16,
              SfCircularChart(
                series: [
                  PieSeries<MapEntry<String, double>, String>(
                    name: 'Pengeluaran '.hardcoded,
                    dataSource: transactions
                        .map((e) => MapEntry(e.name, e.count.toDouble()))
                        .toList(),
                    xValueMapper: (MapEntry<String, double> data, _) =>
                        data.key,
                    dataLabelMapper: (datum, index) => datum.key,
                    pointColorMapper: (datum, index) =>
                        ColorUtils.getColorFromName(datum.key),
                    yValueMapper: (MapEntry<String, double> data, value) =>
                        data.value,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      color: Colors.red,
                      labelPosition: ChartDataLabelPosition.outside,
                      connectorLineSettings: ConnectorLineSettings(
                        type: ConnectorType.curve,
                        length: '10%',
                      ),
                    ),
                  ),
                ],
              ),
              _LegendList(transactions: transactions),
            ],
          ),
        );
      },
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _LegendList extends StatelessWidget {
  const _LegendList({required this.transactions});
  final List<ReportEntity> transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 4,
        children: transactions
            .map(
              (e) => Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 52,
                        decoration: BoxDecoration(
                          color: ColorUtils.getColorFromName(e.name),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        child: Text(
                          '${e.percentage}%',
                          textAlign: TextAlign.center,
                          style: context.theme.textTheme.labelMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Gap.w8,
                      Text(
                        e.name,
                        style: context.theme.textTheme.labelMedium,
                      ),
                    ],
                  ).expand,
                  Text(
                    e.count.toDecimal(context),
                    style: context.theme.textTheme.labelMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
