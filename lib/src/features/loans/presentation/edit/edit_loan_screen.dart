import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/components/textfield.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/edit/edit_loan_controller.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/list/wallet_picker.dart';
import 'package:yanmii_wallet/src/utils/extensions/datetime_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/num_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

class EditLoanScreen extends ConsumerStatefulWidget {
  const EditLoanScreen({
    required this.id,
    super.key,
  });
  final int id;

  @override
  ConsumerState<EditLoanScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<EditLoanScreen> {
  final _dateTextController = TextEditingController();
  final _timeTextController = TextEditingController();
  final _walletTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _amountTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();

  EditLoanController get _controller =>
      ref.read(editTransactionControllerProvider(widget.id).notifier);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(editTransactionControllerProvider(widget.id).notifier)
          .getLoanById(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editTransactionControllerProvider(widget.id));

    ref.listen(editTransactionControllerProvider(widget.id), (previous, next) {
      if (next.loan != null && previous?.loan == null) {
        final transaction = next.loan!;
        final dateTime = transaction.date;
        _controller
          ..setDate(dateTime)
          ..setTime(TimeOfDay.fromDateTime(dateTime))
          ..setName(transaction.name)
          ..setAmount(transaction.amount)
          ..setDescription(transaction.description ?? '');

        _dateTextController.text = dateTime.toDayDdMmYyyy;
        _timeTextController.text = dateTime.toHhMm;

        if (transaction.wallet != null) {
          _walletTextController.text = transaction.wallet!.name;
        }

        _nameTextController.text = transaction.name;
        _amountTextController.text = transaction.amount.toDecimal(context);
        _descriptionTextController.text = transaction.description ?? '';
      }

      if (next.submissionStatus == FormzSubmissionStatus.success &&
          previous?.submissionStatus == FormzSubmissionStatus.inProgress &&
          next.date != null) {
        context.pop();
      }

      if (next.name != previous?.name && mounted) {
        _nameTextController.text = next.name;
      }
    });

    final walletOptions = ref
            .watch(editTransactionControllerProvider(widget.id))
            .walletOptions
            .value ??
        [];
    final wallet =
        ref.watch(editTransactionControllerProvider(widget.id)).wallet;
    final selectedWallets = [if (wallet != null) wallet];

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Transaction'.hardcoded),
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
              label: 'Judul'.hardcoded,
              onChanged: (value) {
                _controller.setName(value);
              },
              controller: _nameTextController,
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
              controller: _amountTextController,
              inputFormatters: [
                CurrencyTextInputFormatter.currency(
                  locale: context.locale.toLanguageTag(),
                  symbol: '',
                  decimalDigits: 0,
                ),
              ],
              onChanged: (value) {
                if (value.isNotEmpty) {
                  final numberFormat = NumberFormat.decimalPattern(
                    context.locale.toLanguageTag(),
                  );
                  final rawValue = numberFormat.parse(value).round();
                  _controller.setAmount(rawValue);
                } else {
                  _controller.setAmount(0);
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some amount';
                }
                return null;
              },
            ),
            Gap.h16,
            CommonTextfield(
              label: 'Dompet'.hardcoded,
              controller: _walletTextController,
              suffixIcon: const Icon(Icons.arrow_drop_down),
              onTap: () => _showWalletPicker(
                walletOptions: walletOptions,
                selectedWallets: selectedWallets,
                onSelected: (wallet) {
                  ref
                      .read(
                        editTransactionControllerProvider(widget.id).notifier,
                      )
                      .setWallet(wallet);
                  _walletTextController.text = wallet.name;
                },
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Gap.h16,
            CommonTextfield(
              label: 'Keterangan',
              controller: _descriptionTextController,
              onChanged: (value) => _controller.setDescription(value),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showWalletPicker({
    required List<WalletEntity> walletOptions,
    required ValueChanged<WalletEntity> onSelected,
    List<WalletEntity>? selectedWallets,
  }) {
    showModalBottomSheet<WalletEntity?>(
      context: context,
      builder: (BuildContext context) => WalletPicker(
        selectedWallets: selectedWallets,
        options: walletOptions,
        onSelected: onSelected,
      ),
    );
  }
}
