
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
import 'package:yanmii_wallet/src/features/transactions/presentation/list/wallet_picker.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/transactions_controller.dart';
import 'package:yanmii_wallet/src/utils/extensions/datetime_extension.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({
    required this.type,
    required this.date,
    super.key,
  });

  final TransactionType type;
  final DateTime date;

  @override
  ConsumerState<AddTransactionScreen> createState() =>
      _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  final _dateTextController = TextEditingController();
  final _timeTextController = TextEditingController();
  final _walletTextController = TextEditingController();
  final _destWalletTextController = TextEditingController();
  final _categoryTextController = TextEditingController();
  final _searchController = SearchController();

  AddTransactionController get _controller =>
      ref.read(addTransactionControllerProvider.notifier);

  @override
  void initState() {
    super.initState();
    _dateTextController.text = widget.date.toDayDdMmYyyy;
    _timeTextController.text = widget.date.toHhMm;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller
        ..setDate(widget.date)
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
        ref
            .read(transactionsControllerProvider.notifier)
            .getTransactions(widget.date);
        context.pop();
      }

      if (next.wallet != null) {
        _walletTextController.text = next.wallet!.name;
      }

      if (next.destWallet != null) {
        _destWalletTextController.text = next.destWallet!.name;
      }
    });

    final walletOptions =
        ref.watch(addTransactionControllerProvider).walletOptions.value ?? [];
    final categoryOptions =
        ref.watch(addTransactionControllerProvider).categoryOptions;
    final categories = categoryOptions.value ?? [];
    final wallet = ref.watch(addTransactionControllerProvider).wallet;
    final destWallet = ref.watch(addTransactionControllerProvider).destWallet;
    final selectedWallets = [
      if (wallet != null) wallet,
      if (destWallet != null) destWallet,
    ];
    final isIncome = state.type == TransactionType.income;

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
              label: 'Dompet ${isIncome ? 'tujuan' : 'asal'}'.hardcoded,
              controller: _walletTextController,
              suffixIcon: const Icon(Icons.arrow_drop_down),
              onTap: () {
                showModalBottomSheet<WalletEntity?>(
                  context: context,
                  builder: (BuildContext context) => WalletPicker(
                    options: walletOptions,
                    selectedWallets: selectedWallets,
                    onSelected: (wallet) {
                      ref
                          .read(addTransactionControllerProvider.notifier)
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
            if (state.type == TransactionType.transfer) ...[
              CommonTextfield(
                label: 'Dompet tujuan'.hardcoded,
                controller: _destWalletTextController,
                suffixIcon: const Icon(Icons.arrow_drop_down),
                onTap: () {
                  showModalBottomSheet<WalletEntity?>(
                    context: context,
                    builder: (BuildContext context) => WalletPicker(
                      selectedWallets: selectedWallets,
                      options: walletOptions,
                      onSelected: (wallet) {
                        ref
                            .read(addTransactionControllerProvider.notifier)
                            .setDestWallet(wallet);
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
            ],
            CommonTextfield(
              label: 'Jumlah'.hardcoded,
              inputType: TextInputType.number,
              inputFormatters: [AppConstants.idrCurrencyFormatter],
              onChanged: (value) => _controller.setAmount(value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Gap.h16,
            if (state.type != TransactionType.transfer) ...[
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
                      .where((category) =>
                          category.label.toLowerCase().contains(keyword),)
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
          ],
        ),
      ),
    );
  }
}
