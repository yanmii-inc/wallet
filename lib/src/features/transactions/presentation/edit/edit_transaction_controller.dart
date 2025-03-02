import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:yanmii_wallet/src/common/data/models/type.dart';
import 'package:yanmii_wallet/src/common/domain/entities/category_entity.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';
import 'package:yanmii_wallet/src/features/transactions/application/category_service.dart';
import 'package:yanmii_wallet/src/features/transactions/application/transactions_service.dart';
import 'package:yanmii_wallet/src/features/transactions/presentation/edit/edit_transaction_state.dart';
import 'package:yanmii_wallet/src/features/wallet/application/wallet_service.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

class EditTransactionController extends StateNotifier<EditTransactionState> {
  EditTransactionController(this.ref, this.transactionId)
      : super(const EditTransactionState());

  final Ref ref;
  final int transactionId;

  TransactionsService get _transactionService =>
      ref.read(transactionsServiceProvider.notifier);

  void _validate() {
    final isStandardTransaction = state.type != TransactionType.transfer &&
        state.date != null &&
        state.wallet != null &&
        state.name.isNotEmpty &&
        state.amount > 0;

    final isTransferTransaction = state.type == TransactionType.transfer &&
        state.date != null &&
        state.wallet != null &&
        state.destWallet != null &&
        state.wallet?.id != state.destWallet?.id &&
        state.amount > 0;

    state = state.copyWith(
      isFormValid: isStandardTransaction || isTransferTransaction,
    );
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
    _setTransactionName();
    _validate();
  }

  void setDestWallet(WalletEntity value) {
    state = state.copyWith(destWallet: value);
    _setTransactionName();
    _validate();
  }

  void setName(String value) {
    state = state.copyWith(name: value);
    _validate();
  }

  void setAmount(String value) {
    state =
        state.copyWith(amount: int.tryParse(value.replaceAll('.', '')) ?? 0);
    _validate();
  }

  Future<void> suggestCategory(String value) async {
    final categories = await ref
        .read(categoryServiceProvider.notifier)
        .searchSuggestedCategories(value);
    state = state.copyWith(suggestedCategoryOptions: AsyncData(categories));
  }

  Future<void> searchCategory(String value) async {
    log('searchCategory: $value');
    final categories =
        await ref.read(categoryServiceProvider.notifier).searchCategory(value);
    state = state.copyWith(suggestedCategoryOptions: AsyncData(categories));
  }

  Future<void> searchName(String value) async {
    final names =
        await ref.read(transactionsServiceProvider.notifier).searchName(value);
    state = state.copyWith(
      suggestedNames: AsyncData(names),
    );
  }

  void clearNameSuggestion() {
    state = state.copyWith(suggestedNames: const AsyncData([]));
  }

  void clearCategorySuggestion() {
    state = state.copyWith(suggestedCategoryOptions: const AsyncData([]));
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

    if (state.wallet == null) {
      throw Exception('Wallet not selected');
    }

    try {
      await _transactionService.updateTransaction(
        id: transactionId,
        amount: state.amount.toString(),
        title: state.name,
        date: state.date ?? DateTime.now(),
        description: state.description,
        wallet: state.wallet!,
        category: state.category,
        type: state.type,
      );
      state = state.copyWith(submissionStatus: FormzSubmissionStatus.success);
    } catch (e) {
      state = state.copyWith(submissionStatus: FormzSubmissionStatus.failure);
    }
  }

  void setType(TransactionType type) {
    state = state.copyWith(type: type);
    _validate();
  }

  Future<void> init() async {
    await ref.read(walletServiceProvider.notifier).getWallets();
    await ref.read(categoryServiceProvider.notifier).getCategoryList();

    final walletOptions = ref.watch(walletServiceProvider);
    final categoryOptions = ref.watch(categoryServiceProvider);
    state = state.copyWith(
      walletOptions: walletOptions,
      categoryOptions: categoryOptions,
    );
  }

  void _setTransactionName() {
    if (state.wallet != null && state.destWallet != null) {
      final transactionName =
          'Transfer from ${state.wallet!.name} to ${state.destWallet!.name}';
      state = state.copyWith(name: transactionName);
    }
  }

  Future<void> getTransactionById(int id) async {
    log('getTransactionById $id');
    final transaction = await ref
        .watch(transactionsServiceProvider.notifier)
        .getTransactionById(id);
    state = state.copyWith(
      transaction: transaction,
      wallet: transaction.wallet,
      destWallet: transaction.destWallet,
      type: transaction.type,
      date: transaction.date.toDateTime,
      amount: transaction.amount,
      name: transaction.name,
      description: transaction.description ?? '',
      category: transaction.category,
    );
  }
}

final editTransactionControllerProvider = StateNotifierProvider.family
    .autoDispose<EditTransactionController, EditTransactionState, int>(
  (ref, id) => EditTransactionController(ref, id)..init(),
);
