import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/components/textfield.dart';
import 'package:yanmii_wallet/src/common/data/models/type.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/add/category_suggestion.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/add/name_suggestion.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/edit/edit_transaction_controller.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/list/wallet_picker.dart';
import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/text_styles.dart';
import 'package:yanmii_wallet/src/utils/extensions/datetime_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/num_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

class EditTransactionScreen extends ConsumerStatefulWidget {
  const EditTransactionScreen({
    required this.id,
    super.key,
  });
  final int id;

  @override
  ConsumerState<EditTransactionScreen> createState() =>
      _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<EditTransactionScreen> {
  final _dateTextController = TextEditingController();
  final _timeTextController = TextEditingController();
  final _walletTextController = TextEditingController();
  final _destWalletTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _amountTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();
  final _categoryTextController = TextEditingController();

  EditTransactionController get _controller =>
      ref.read(editTransactionControllerProvider(widget.id).notifier);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(editTransactionControllerProvider(widget.id).notifier)
          .getTransactionById(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editTransactionControllerProvider(widget.id));

    ref.listen(editTransactionControllerProvider(widget.id), (previous, next) {
      if (next.transaction != null && previous?.transaction == null) {
        final transaction = next.transaction!;
        final dateTime = transaction.date.toDateTime ?? DateTime.now();

        _dateTextController.text = dateTime.toDayDdMmYyyy;
        _timeTextController.text = dateTime.toHhMm;

        if (transaction.wallet != null) {
          _walletTextController.text = transaction.wallet!.name;
        }
        if (transaction.destWallet != null) {
          _destWalletTextController.text = transaction.destWallet!.name;
        }

        _nameTextController.text = transaction.name;
        _amountTextController.text = transaction.amount.toDecimal(context);
        _categoryTextController.text = transaction.category!.label;
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

      if (next.category != previous?.category && mounted) {
        _categoryTextController.text = next.category!.label;
      }
    });

    final walletOptions = ref
            .watch(editTransactionControllerProvider(widget.id))
            .walletOptions
            .value ??
        [];
    final wallet =
        ref.watch(editTransactionControllerProvider(widget.id)).wallet;
    final destWallet =
        ref.watch(editTransactionControllerProvider(widget.id)).destWallet;
    final selectedWallets = [
      if (wallet != null) wallet,
      if (destWallet != null) destWallet,
    ];
    final isIncome = state.type == TransactionType.income;
    final suggestedNames = state.suggestedNames.value ?? [];
    final suggestedCategoryOptions = state.suggestedCategoryOptions.value;

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
            Text(
              '${state.type.name} Details'.toUpperCase(),
              style: context.titleMedium,
            ),
            Gap.h32,
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
              label: 'Dompet ${isIncome ? 'tujuan' : 'asal'}'.hardcoded,
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
            if (state.type == TransactionType.transfer) ...[
              CommonTextfield(
                label: 'Dompet tujuan'.hardcoded,
                controller: _destWalletTextController,
                suffixIcon: const Icon(Icons.arrow_drop_down),
                onTap: () => _showWalletPicker(
                  walletOptions: walletOptions,
                  selectedWallets: selectedWallets,
                  onSelected: (wallet) {
                    ref
                        .read(
                          editTransactionControllerProvider(widget.id).notifier,
                        )
                        .setDestWallet(wallet);
                    _destWalletTextController.text = wallet.name;
                  },
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a wallet';
                  }
                  return null;
                },
              ),
              Gap.h16,
            ],
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
            if (state.type != TransactionType.transfer) ...[
              CommonTextfield(
                label: 'Judul'.hardcoded,
                onChanged: (value) {
                  _controller.setName(value);

                  if (value.length >= 3) {
                    _controller
                      ..searchName(value)
                      ..suggestCategory(value);
                  } else {
                    _controller.clearNameSuggestion();
                  }
                },
                controller: _nameTextController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              NameSuggestion(
                suggestedNames,
                onPressed: (name) {
                  _controller
                    ..setName(name)
                    ..clearNameSuggestion();

                  if (suggestedCategoryOptions != null &&
                      suggestedCategoryOptions.isNotEmpty) {
                    _controller
                        .setCategory(suggestedCategoryOptions.first.label);
                  }
                },
              ),
              Gap.h16,
              CommonTextfield(
                controller: _categoryTextController,
                label: 'Category'.hardcoded,
                suffixIcon: const Icon(Icons.search),
                onChanged: (value) {
                  _controller.setCategory(value);
                  if (value.length >= 2) {
                    _controller.searchCategory(value);
                  } else {
                    _controller.clearCategorySuggestion();
                  }
                },
                onTap: () {
                  _controller.suggestCategory(_categoryTextController.text);
                },
              ),
              CategorySuggestion(
                state.suggestedCategoryOptions.value ?? [],
                onPressed: (category) {
                  _controller.setCategory(category.label);
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
