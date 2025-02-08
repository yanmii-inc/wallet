import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/components/textfield.dart';
import 'package:yanmii_wallet/src/common/data/models/type.dart';
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

  final List<String> wallets = [
    'Wallet 1',
    'Wallet 2',
    'Wallet 3',
  ];

  @override
  void initState() {
    super.initState();
    _dateTextController.text = DateTime.now().toDayDdMmYyyy;
    _timeTextController.text = DateTime.now().toHhMm;
    _walletTextController.text = wallets.first;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.setType(widget.type);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addTransactionControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction'.hardcoded),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: state.isFormValid
                ? () => _controller.save(TransactionType.income)
                : null,
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
              onChanged: (wallet) => _controller.setWallet(wallet),
              onTap: () async {
                final wallet = await showModalBottomSheet<String>(
                  context: context,
                  builder: (BuildContext context) => WalletPicker(),
                );

                if (wallet != null) {
                  _controller.setWallet(wallet);
                  _walletTextController.text = wallet;
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
            CommonTextfield(
              label: 'Kategori'.hardcoded,
              onChanged: (value) => _controller.setCategory(value),
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
