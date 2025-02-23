import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; //
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/components/textfield.dart';
import 'package:yanmii_wallet/src/common/domain/entities/monthly_balance_entity.dart';
import 'package:yanmii_wallet/src/features/report/domain/entities/report_entity.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/detailed_view.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/datailed_view_controller.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/monthly_setting_controller.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/monthly_view_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
import 'package:yanmii_wallet/src/utils/color_utils.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/text_styles.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/theme_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/datetime_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/num_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/widget_extension.dart';
import 'package:yanmii_wallet/src/utils/helpers/shared_preference_helper.dart';

part 'sections/monthly_view.dart';
part 'sections/monthly_setting_dialog.dart';

class ReportScreen extends ConsumerStatefulWidget {
  const ReportScreen({super.key});

  @override
  ConsumerState<ReportScreen> createState() => _ReportScreenState();
}

enum ViewMode {
  realtime,
  monthly,
  custom,
}

class _ReportScreenState extends ConsumerState<ReportScreen> {
  ViewMode _viewMode = ViewMode.realtime;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(monthlyControllerProvider.notifier).getMonthlyRecap();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Report'),
        actions: [
          if (_viewMode == ViewMode.monthly)
            IconButton(
              onPressed: () async {
                await ref
                    .read(monthlySettingControllerProvider.notifier)
                    .init();
                await showAdaptiveDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => const ReportSettingsDialog(),
                );
              },
              icon: const Icon(Icons.settings),
            ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: SegmentedButton<ViewMode>(
              showSelectedIcon: false,
              segments: ViewMode.values
                  .map((e) => ButtonSegment(value: e, label: Text(e.name)))
                  .toList(),
              selected: {_viewMode},
              onSelectionChanged: (value) {
                switch (value.first) {
                  case ViewMode.realtime:
                    ref
                        .read(detailedControllerProvider.notifier)
                        .getRealTimeReport(DateTime.now());
                  case ViewMode.monthly:
                    ref
                        .read(monthlyControllerProvider.notifier)
                        .getMonthlyRecap();
                  case ViewMode.custom:
                }
                setState(() {
                  _viewMode = value.first;
                });
              },
            ),
          ),
          switch (_viewMode) {
            ViewMode.realtime => DetailedView(DateTime.now()),
            // TODO: Handle this case.
            ViewMode.monthly => const _MonthlyView(),
            // TODO: Handle this case.
            ViewMode.custom => DetailedView(DateTime.now()),
          },
        ],
      ),
    );
  }
}

class _CustomView extends StatelessWidget {
  const _CustomView();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Custom View'));
  }
}
