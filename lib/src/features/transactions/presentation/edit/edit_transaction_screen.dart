import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/components/textfield.dart';
import 'package:yanmii_wallet/src/common/data/models/type.dart';
import 'package:yanmii_wallet/src/common/domain/entities/category_entity.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/edit/edit_transaction_controller.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/list/wallet_picker.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/transactions_controller.dart';
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
  final _searchController = SearchController();

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
        _controller
          ..setDate(dateTime)
          ..setTime(TimeOfDay.fromDateTime(dateTime))
          ..setType(transaction.type)
          ..setCategory(transaction.category!)
          ..setName(transaction.name)
          ..setAmount(transaction.amount.toString())
          ..setType(transaction.type)
          ..setDescription(transaction.description ?? '');

        _dateTextController.text = dateTime.toDayDdMmYyyy;
        _timeTextController.text = dateTime.toHhMm;

        log('transaction.wallet ${transaction.wallet}');

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
    });

    final walletOptions = ref
            .watch(editTransactionControllerProvider(widget.id))
            .walletOptions
            .value ??
        [];
    final categoryOptions =
        ref.watch(editTransactionControllerProvider(widget.id)).categoryOptions;
    final categories = categoryOptions.value ?? [];
    final wallet =
        ref.watch(editTransactionControllerProvider(widget.id)).wallet;
    final destWallet =
        ref.watch(editTransactionControllerProvider(widget.id)).destWallet;
    final selectedWallets = [
      if (wallet != null) wallet,
      if (destWallet != null) destWallet,
    ];
    final isIncome = state.type == TransactionType.income;

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
              inputFormatters: [AppConstants.idrCurrencyFormatter],
              onChanged: (value) => _controller.setAmount(value),
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
                onChanged: (value) => _controller.setName(value),
                controller: _nameTextController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Gap.h16,
              SearchAnchor(
                searchController: _searchController,
                viewOnSubmitted: (value) {
                  _controller.setCategory(CategoryEntity(label: value));
                  _searchController.closeView(value);
                  _categoryTextController.text = value;
                },
                builder: (context, controller) {
                  return CommonTextfield(
                    controller: _categoryTextController,
                    label: 'Category'.hardcoded,
                    suffixIcon: const Icon(Icons.search),
                    onTap: () => controller.openView(),
                  );
                },
                suggestionsBuilder: (context, controller) {
                  final keyword = controller.text.toLowerCase();
                  return categories
                      .where(
                        (category) =>
                            category.label.toLowerCase().contains(keyword),
                      )
                      .map(
                        (category) => ListTile(
                          title: Text(category.label),
                          onTap: () {
                            _categoryTextController.text = category.label;
                            _controller.setCategory(category);
                            controller.closeView(category.label);
                          },
                        ),
                      );
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
