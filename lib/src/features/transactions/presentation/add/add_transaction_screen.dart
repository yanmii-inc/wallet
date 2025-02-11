import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/components/textfield.dart';
import 'package:yanmii_wallet/src/common/data/models/type.dart';
import 'package:yanmii_wallet/src/common/domain/entities/category_entity.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/add/add_transaction_controller.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/widgets/wallet_picker.dart';
import 'package:yanmii_wallet/src/utils/extensions/datetime_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({
    required this.type,
    super.key,
  });

  final TransactionType type;

  @override
  ConsumerState<AddTransactionScreen> createState() =>
      _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  final _dateTextController = TextEditingController();
  final _timeTextController = TextEditingController();
  final _walletTextController = TextEditingController();

  AddTransactionController get _controller =>
      ref.read(addTransactionControllerProvider.notifier);

  @override
  void initState() {
    super.initState();
    _dateTextController.text = DateTime.now().toDayDdMmYyyy;
    _timeTextController.text = DateTime.now().toHhMm;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller
        ..setDate(DateTime.now())
        ..setTime(TimeOfDay.now())
        ..setType(widget.type);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addTransactionControllerProvider);

    ref.listen(addTransactionControllerProvider, (previous, next) {
      if (next.submissionStatus == FormzSubmissionStatus.success &&
          previous?.submissionStatus == FormzSubmissionStatus.inProgress) {
        context.pop();
      }

      if (next.wallet != null) {
        _walletTextController.text = next.wallet!.name;
      }
    });

    final categoryOptions =
        ref.watch(addTransactionControllerProvider).categoryOptions;
    final categories = categoryOptions.value ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction'.hardcoded),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: state.isFormValid ? () => _controller.save() : null,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            SegmentedButton(
              segments: TransactionType.values
                  .map(
                    (e) => ButtonSegment(
                      value: e,
                      label: Text(e.name.hardcoded),
                    ),
                  )
                  .toList(),
              selected: {state.type},
              onSelectionChanged: (value) => _controller.setType(value.first),
            ),
            Gap.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: CommonTextfield(
                    controller: _dateTextController,
                    label: 'Tanggal'.hardcoded,
                    onTap: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030),
                      );
                      if (pickedDate != null) {
                        _controller.setDate(pickedDate);
                        if (mounted) {
                          _dateTextController.text = pickedDate.toDayDdMmYyyy;
                        }
                      }
                    },
                  ),
                ),
                Gap.w12,
                SizedBox(
                  width: 150,
                  child: CommonTextfield(
                    controller: _timeTextController,
                    label: 'Jam'.hardcoded,
                    onTap: () async {
                      final pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.input,
                      );
                      if (pickedTime != null) {
                        _timeTextController.text =
                            '${pickedTime.hour}:${pickedTime.minute}';
                        _controller.setTime(pickedTime);
                      }
                    },
                  ),
                ),
              ],
            ),
            Gap.h16,
            CommonTextfield(
              label: 'Dompet'.hardcoded,
              controller: _walletTextController,
              suffixIcon: const Icon(Icons.arrow_drop_down),
              onTap: () async {
                final wallet = await showModalBottomSheet<WalletEntity?>(
                  context: context,
                  builder: (BuildContext context) => const WalletPicker(),
                );

                if (wallet != null) {
                  _walletTextController.text = wallet.name;
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Gap.h16,
            CommonTextfield(
              label: 'Jumlah'.hardcoded,
              inputType: TextInputType.number,
              inputFormatters: [
                CurrencyTextInputFormatter.currency(
                  locale: 'id_ID',
                  symbol: '',
                  decimalDigits: 0,
                )
              ],
              onChanged: (value) => _controller.setAmount(int.parse(value)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Gap.h16,
            CommonTextfield(
              label: 'Judul'.hardcoded,
              onChanged: (value) => _controller.setName(value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Gap.h16,
            Autocomplete<CategoryEntity>(
              optionsBuilder: (value) {
                return categories.where(
                  (category) => category.label
                      .toLowerCase()
                      .contains(value.text.toLowerCase()),
                );
              },
              fieldViewBuilder:
                  (context, controller, focusNode, onFieldSubmitted) {
                controller.addListener(() {
                  final text = controller.text;
                  if (!categories.any((element) => element.label == text)) {
                    _controller.setCategory(CategoryEntity(label: text));
                  }
                });
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  onSubmitted: (value) {
                    onFieldSubmitted.call();
                  },
                );
              },
              displayStringForOption: (option) => option.label,
              onSelected: (value) => _controller.setCategory(value),
            ),
            Gap.h16,
            CommonTextfield(
              label: 'Keterangan',
              onChanged: (value) => _controller.setDescription(value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
