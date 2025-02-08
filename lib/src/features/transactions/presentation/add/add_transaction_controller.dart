import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/models/type.dart';
import 'package:yanmii_wallet/src/features/transactions/application/transactions_service.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/add/add_transaction_state.dart';

class AddTransactionController extends StateNotifier<AddTransactionState> {
  AddTransactionController(this.ref) : super(const AddTransactionState());

  final Ref ref;
  TransactionsService get _transactionService =>
      ref.watch(transactionsServiceProvider);

  void _validate() {
    final isValid = state.date != null &&
        state.wallet.isNotEmpty &&
        state.name.isNotEmpty &&
        state.amount > 0 &&
        state.category.isNotEmpty;
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

  void setWallet(String value) {
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

  void setCategory(String value) {
    state = state.copyWith(category: value);
    _validate();
  }

  void setDescription(String value) {
    state = state.copyWith(description: value);
    _validate();
  }

  Future<void> save(TransactionType type) async {
    await _transactionService.saveTransaction(
      amount: state.amount.toString(),
      date: state.date ?? DateTime.now(),
      description: state.description,
      walletId: state.wallet,
      categoryId: state.category,
      type: type,
    );
  }

  void setType(TransactionType type) {
    state = state.copyWith(type: type);
  }
}

final addTransactionControllerProvider =
    StateNotifierProvider<AddTransactionController, AddTransactionState>(
  AddTransactionController.new,
);
