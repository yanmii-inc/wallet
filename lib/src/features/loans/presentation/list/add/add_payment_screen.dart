import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/components/textfield.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/list/add/add_payment_controller.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/list/loan_payments_controller.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/list/wallet_picker.dart';
import 'package:yanmii_wallet/src/utils/extensions/datetime_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

class AddPaymebtScreen extends ConsumerStatefulWidget {
  const AddPaymebtScreen({
    required this.loanId,
    super.key,
  });

  final int loanId;

  @override
  ConsumerState<AddPaymebtScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddPaymebtScreen> {
  final _dateTextController = TextEditingController();
  final _timeTextController = TextEditingController();
  final _walletTextController = TextEditingController();
  final _amountFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _categoryTextFocusNode = FocusNode();
  final _dateTextFocusNode = FocusNode();
  final _timeTextFocusNode = FocusNode();
  final _walletTextFocusNode = FocusNode();

  AddPaymentController get _controller =>
      ref.read(addLoanPaymentControllerProvider(widget.loanId).notifier);

  @override
  void initState() {
    super.initState();
    _dateTextController.text = DateTime.now().toDayDdMmYyyy;
    _timeTextController.text = DateTime.now().toHhMm;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller
        ..setDate(DateTime.now())
        ..setTime(TimeOfDay.now());
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusManager.instance.addListener(_handleFocusChange);
    });
  }

  bool isRelevantTextInput(FocusNode? focus) {
    return focus == _dateTextFocusNode ||
        focus == _timeTextFocusNode ||
        focus == _walletTextFocusNode ||
        focus == _categoryTextFocusNode ||
        focus == _descriptionFocusNode ||
        focus == _amountFocusNode;
  }

  void _handleFocusChange() {
    final currentFocus = FocusManager.instance.primaryFocus;

    if (!isRelevantTextInput(currentFocus)) return;
  }

  @override
  void dispose() {
    _amountFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _categoryTextFocusNode.dispose();
    _dateTextFocusNode.dispose();
    _timeTextFocusNode.dispose();
    _walletTextFocusNode.dispose();

    _dateTextController.dispose();
    _walletTextController.dispose();
    FocusManager.instance.removeListener(_handleFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addLoanPaymentControllerProvider(widget.loanId));

    ref.listen(addLoanPaymentControllerProvider(widget.loanId),
        (previous, next) {
      if (next.submissionStatus == FormzSubmissionStatus.success &&
          previous?.submissionStatus == FormzSubmissionStatus.inProgress) {
        ref
            .read(loanPaymentsNotifier(widget.loanId).notifier)
            .fetchLoanPayments();
        context.pop();
      }

      if (next.wallet != null) {
        _walletTextController.text = next.wallet!.name;
      }
    });

    final walletOptions = ref
            .watch(addLoanPaymentControllerProvider(widget.loanId))
            .walletOptions
            .value ??
        [];
    final wallet =
        ref.watch(addLoanPaymentControllerProvider(widget.loanId)).wallet;
    final selectedWallets = [if (wallet != null) wallet];
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Payment'.hardcoded),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: state.isFormValid ? () => _controller.save() : null,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: CommonTextfield(
                      focusNode: _dateTextFocusNode,
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
                      focusNode: _timeTextFocusNode,
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
                label: 'Jumlah'.hardcoded,
                inputType: TextInputType.number,
                inputFormatters: [
                  CurrencyTextInputFormatter.currency(
                    locale: context.locale.toLanguageTag(),
                    symbol: '',
                    decimalDigits: 0,
                  ),
                ],
                focusNode: _amountFocusNode,
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
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Gap.h16,
              CommonTextfield(
                label: 'Dompet (Opsional)'.hardcoded,
                controller: _walletTextController,
                focusNode: _walletTextFocusNode,
                suffixIcon: const Icon(Icons.arrow_drop_down),
                onTap: () {
                  showModalBottomSheet<WalletEntity?>(
                    context: context,
                    builder: (BuildContext context) => WalletPicker(
                      options: walletOptions,
                      selectedWallets: selectedWallets,
                      onSelected: (wallet) {
                        ref
                            .read(
                                addLoanPaymentControllerProvider(widget.loanId)
                                    .notifier,)
                            .setWallet(wallet);
                      },
                    ),
                  );
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
                focusNode: _descriptionFocusNode,
                label: 'Keterangan (Opsional)'.hardcoded,
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
      ),
    );
  }
}
