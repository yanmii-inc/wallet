import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/features/report/presentation/realtime_view.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/monthly_setting_controller.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/monthly_view.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/monthly_view_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/text_styles.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/theme_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/widget_extension.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Report'),
        actions: [
          if (_viewMode == ViewMode.monthly)
            IconButton(
              onPressed: () {
                ref.read(monthlySettingControllerProvider.notifier).init();
                showAdaptiveDialog<void>(
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
                setState(() {
                  _viewMode = value.first;
                });
              },
            ),
          ),
          Expanded(
            child: switch (_viewMode) {
              ViewMode.realtime => const RealTimeView(),
              ViewMode.monthly => const MonthlyView(),
              ViewMode.custom => const CustomView(),
            },
          ),
        ],
      ),
    );
  }
}

class CustomView extends StatelessWidget {
  const CustomView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Custom View'));
  }
}
