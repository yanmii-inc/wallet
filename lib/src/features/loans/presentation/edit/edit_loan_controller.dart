import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';
import 'package:yanmii_wallet/src/features/loans/application/loans_service.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/edit/edit_loan_state.dart';
import 'package:yanmii_wallet/src/features/wallet/application/wallet_service.dart';

class EditLoanController extends StateNotifier<EditLoanState> {
  EditLoanController(this.ref, this.transactionId)
      : super(const EditLoanState());

  final Ref ref;
  final int transactionId;

  LoansService get _transactionService =>
      ref.read(loansServiceProvider.notifier);

  void _validate() {
    final isValid =
        state.type != null && state.name.isNotEmpty && state.amount > 0;
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

  void setDescription(String value) {
    state = state.copyWith(description: value);
    _validate();
  }

  Future<void> save() async {
    state = state.copyWith(submissionStatus: FormzSubmissionStatus.inProgress);

    if (state.wallet == null) {
      throw Exception('Wallet not selected');
    }

    if (state.type == null) {
      throw Exception('Type not selected');
    }

    try {
      await _transactionService.updateTransaction(
        id: transactionId,
        amount: state.amount.toString(),
        title: state.name,
        date: state.date ?? DateTime.now(),
        type: state.type!,
        description: state.description,
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

  Future<void> getLoanById(int id) async {
    final loan =
        await ref.watch(loansServiceProvider.notifier).getTransactionById(id);
    state = state.copyWith(
      loan: loan,
      wallet: loan.wallet,
      date: loan.date,
      amount: loan.amount,
      name: loan.name,
      description: loan.description ?? '',
    );
  }
}

final editTransactionControllerProvider = StateNotifierProvider.family
    .autoDispose<EditLoanController, EditLoanState, int>(
  (ref, id) => EditLoanController(ref, id)..init(),
);
