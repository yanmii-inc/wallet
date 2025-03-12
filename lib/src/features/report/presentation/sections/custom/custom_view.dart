import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/components/button.dart';
import 'package:yanmii_wallet/src/common/components/textfield.dart';
import 'package:yanmii_wallet/src/features/report/domain/entities/custom_balance_entity.dart';
import 'package:yanmii_wallet/src/features/report/presentation/sections/custom/custom_view_controller.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/theme_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/datetime_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/num_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/widget_extension.dart';

class CustomView extends ConsumerStatefulWidget {
  const CustomView({super.key});

  @override
  ConsumerState<CustomView> createState() => _CustomViewState();
}

class _CustomViewState extends ConsumerState<CustomView> {
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _titleController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(customControllerProvider.notifier).getCustomRecaps();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final months = ref.watch(customControllerProvider).months;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddBottomSheet,
        child: const Icon(Icons.add),
      ),
      body: months.when(
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

  Future<void> _showAddBottomSheet() async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (context) => SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap.h16,
                CommonTextfield(
                  label: 'Tanggal Mulai'.hardcoded,
                  controller: _startDateController,
                  suffixIcon: const Icon(Icons.calendar_month),
                  onChanged: (value) {},
                  onTap: () {
                    _showDatePicker(context).then((value) {
                      if (value != null) {
                        _startDate = value;
                        _startDateController.text = value.toDdMmYyyy;
                      }
                    });
                  },
                ),
                Gap.h16,
                CommonTextfield(
                  label: 'Tanggal Akhir'.hardcoded,
                  controller: _endDateController,
                  suffixIcon: const Icon(Icons.calendar_month),
                  onChanged: (value) {},
                  onTap: () {
                    _showDatePicker(context).then((value) {
                      if (value != null) {
                        _endDate = value;
                        _endDateController.text = value.toDdMmYyyy;
                      }
                    });
                  },
                ),
                Gap.h16,
                CommonTextfield(
                  label: 'Judul'.hardcoded,
                  controller: _titleController,
                  onChanged: (value) {},
                ),
                Gap.h16,
                SizedBox(
                  width: double.infinity,
                  child: CommonButton(
                    'Simpan'.hardcoded,
                    onPressed: () {
                      if (_startDate != null && _endDate != null) {
                        ref
                            .read(customControllerProvider.notifier)
                            .addCustomRecap(
                              _titleController.text,
                              _startDate!,
                              _endDate!,
                            );
                      }
                    },
                  ),
                ),
                Gap.h16,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _showDatePicker(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    return date;
  }
}

class _MonthItem extends ConsumerWidget {
  const _MonthItem(this.customBalance);
  final CustomBalanceEntity customBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = '${customBalance.balance >= 0 ? '+' : ''}'
        '${customBalance.balance.toIdr}';
    return ListTile(
      onTap: () {
        context.pushNamed(Routes.detailedReport.name, extra: {
          'start_date': customBalance.startDate,
          'end_date': customBalance.endDate,
        },);
      },
      title: Column(
        children: [
          Gap.h16,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${customBalance.startDate.toDdMmYyyy} - '
                '${customBalance.endDate.toDdMmYyyy}',
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
                customBalance.totalExpense.toIdr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Income'.hardcoded),
              Text(
                customBalance.totalIncome.toIdr,
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
                  color: customBalance.balance >= 0 ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
