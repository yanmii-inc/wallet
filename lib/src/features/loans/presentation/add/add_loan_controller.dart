import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:yanmii_wallet/src/common/domain/entities/loan_entity.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';
import 'package:yanmii_wallet/src/features/loans/application/loans_service.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/add/add_loan_state.dart';
import 'package:yanmii_wallet/src/features/wallet/application/wallet_service.dart';

class AddLoanController extends StateNotifier<AddLoanState> {
  AddLoanController(this.ref) : super(const AddLoanState());

  final Ref ref;

  LoansService get _transactionService =>
      ref.read(loansServiceProvider.notifier);

  void _validate() {
    final isValid =
        state.type != null && state.name.isNotEmpty && state.amount > 0;

    state = state.copyWith(isFormValid: isValid);
  }

  void setType(LoanType value) {
    state = state.copyWith(type: value);
    _validate();
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

  void setDescription(String value) {
    state = state.copyWith(description: value);
    _validate();
  }

  Future<void> save() async {
    state = state.copyWith(submissionStatus: FormzSubmissionStatus.inProgress);

    if (state.type == null) {
      throw Exception('Type not selected');
    }

    try {
      await _transactionService.createTransaction(
        amount: state.amount.toString(),
        title: state.name,
        date: state.date ?? DateTime.now(),
        description: state.description,
        type: state.type!,
        wallet: state.wallet,
      );
      state = state.copyWith(submissionStatus: FormzSubmissionStatus.success);
    } catch (e) {
      state = state.copyWith(submissionStatus: FormzSubmissionStatus.failure);
    }
  }

  Future<void> init() async {
    await ref.read(walletServiceProvider.notifier).getWallets();

    final walletOptions = ref.watch(walletServiceProvider);
    state = state.copyWith(walletOptions: walletOptions);
  }
}

final addTransactionControllerProvider =
    StateNotifierProvider.autoDispose<AddLoanController, AddLoanState>(
  (ref) => AddLoanController(ref)..init(),
);
