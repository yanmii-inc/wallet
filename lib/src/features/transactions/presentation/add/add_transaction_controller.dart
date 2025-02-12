import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:yanmii_wallet/src/common/data/models/type.dart';
import 'package:yanmii_wallet/src/common/domain/entities/category_entity.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';
import 'package:yanmii_wallet/src/features/transactions/application/category_service.dart';
import 'package:yanmii_wallet/src/features/transactions/application/transactions_service.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/add/add_transaction_state.dart';
import 'package:yanmii_wallet/src/features/wallet/application/wallet_service.dart';

class AddTransactionController extends StateNotifier<AddTransactionState> {
  AddTransactionController(this.ref) : super(const AddTransactionState());

  final Ref ref;
  TransactionsService get _transactionService =>
      ref.read(transactionsServiceProvider.notifier);

  void _validate() {
    final isValid = state.date != null &&
        state.wallet != null &&
        state.name.isNotEmpty &&
        state.amount > 0;
    state = state.copyWith(isFormValid: isValid);
  }

  void setDate(DateTime value) {
    state = state.copyWith(date: value);
    _validate();
  }

  void setTime(TimeOfDay value) {
    final currentDate = state.date ?? DateTime.now();
    final setdDateTime = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
      value.hour,
      value.minute,
    );
    state = state.copyWith(date: setdDateTime);
    _validate();
  }

  void setWallet(WalletEntity value) {
    state = state.copyWith(wallet: value);
    _validate();
  }

  void setName(String value) {
    state = state.copyWith(name: value);
    _validate();
  }

  void setAmount(int value) {
    state = state.copyWith(amount: value);
    _validate();
  }

  void setCategory(CategoryEntity value) {
    state = state.copyWith(category: value);
    _validate();
  }

  void setDescription(String value) {
    state = state.copyWith(description: value);
    _validate();
  }

  Future<void> save() async {
    state = state.copyWith(submissionStatus: FormzSubmissionStatus.inProgress);
    ref.listen(transactionsServiceProvider, (prev, next) {
      if (prev?.value != next.value) {
        state = state.copyWith(submissionStatus: FormzSubmissionStatus.success);
      }
    });

    if (state.wallet == null) {
      throw Exception('Wallet not selected');
    }

    await _transactionService.saveTransaction(
      amount: state.amount.toString(),
      title: state.name,
      date: state.date ?? DateTime.now(),
      description: state.description,
      wallet: state.wallet!,
      category: state.category,
      type: state.type,
    );
  }

  void setType(TransactionType type) {
    state = state.copyWith(type: type);
  }

  Future<void> init() async {
    await ref.read(walletServiceProvider.notifier).getWallets();
    await ref.read(categoryServiceProvider.notifier).getCategoryList();

    final walletOptions = ref.watch(walletServiceProvider);
    state = state.copyWith(
      walletOptions: walletOptions,
      wallet: walletOptions.value?.first,
      categoryOptions: ref.watch(categoryServiceProvider),
    );
  }
}

final addTransactionControllerProvider = StateNotifierProvider.autoDispose<
    AddTransactionController, AddTransactionState>(
  (ref) => AddTransactionController(ref)..init(),
);
