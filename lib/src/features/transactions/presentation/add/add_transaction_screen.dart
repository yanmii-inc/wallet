import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/components/textfield.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/add/add_transaction_controller.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();

  AddTransactionController get _controller =>
      ref.read(addTransactionControllerProvider.notifier);

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
                ? () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  }
                : null,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(child: CommonTextfield(label: 'Tanggal'.hardcoded)),
                  Gap.w12,
                  SizedBox(
                    width: 100,
                    child: CommonTextfield(label: 'Jam'.hardcoded),
                  ),
                ],
              ),
              Gap.h16,
              CommonTextfield(
                label: 'Dompet'.hardcoded,
                suffixIcon: const Icon(Icons.arrow_drop_down),
                onChanged: (wallet) => _controller.updateWallet(wallet),
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
                onChanged: (value) =>
                    _controller.updateAmount(int.parse(value)),
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
                onChanged: (value) => _controller.updateName(value),
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
                onChanged: (value) => _controller.updateCategory(value),
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
                onChanged: (value) => _controller.updateDescription(value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, perform your actions here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Form is valid'),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
