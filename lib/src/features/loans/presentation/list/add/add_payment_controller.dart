import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';
import 'package:yanmii_wallet/src/features/loans/application/loans_payment_service.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/list/add/add_payment_state.dart';
import 'package:yanmii_wallet/src/features/wallet/application/wallet_service.dart';

class AddPaymentController extends StateNotifier<AddPaymentState> {
  AddPaymentController(
    this.ref,
    this.loanId,
  ) : super(const AddPaymentState());

  final Ref ref;
  final int loanId;

  LoanPaymentsService get _transactionService =>
      ref.read(loanPaymentsServiceProvider.notifier);

  void _validate() {
    final isValid = state.amount > 0;

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

  void setAmount(int value) {
    state = state.copyWith(amount: value);
    _validate();
  }

  void setDescription(String note) {
    state = state.copyWith(note: note);
    _validate();
  }

  Future<void> save() async {
    state = state.copyWith(submissionStatus: FormzSubmissionStatus.inProgress);

    try {
      await _transactionService.addLoanPayment(
        amount: state.amount,
        date: state.date ?? DateTime.now(),
        note: state.note,
        walletId: state.wallet?.id,
        loanId: loanId,
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

final addLoanPaymentControllerProvider = StateNotifierProvider.family
    .autoDispose<AddPaymentController, AddPaymentState, int>(
  (ref, loanId) => AddPaymentController(ref, loanId)..init(),
);
