import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';
import 'package:yanmii_wallet/src/features/loans/application/loans_payment_service.dart';
import 'package:yanmii_wallet/src/features/loans/presentation/list/edit/edit_payment_state.dart';
import 'package:yanmii_wallet/src/features/wallet/application/wallet_service.dart';

class EditPaymentController extends StateNotifier<EditPaymentState> {
  EditPaymentController(
    this.ref,
    this.paymentId,
  ) : super(const EditPaymentState());

  final Ref ref;
  final int paymentId;

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
    log('wallet ${state.wallet}');
    _validate();
  }

  void setAmount(int value) {
    log('setAmount: $value');
    state = state.copyWith(amount: value);
    log('Amount: ${state.amount}');
    _validate();
  }

  void setDescription(String note) {
    state = state.copyWith(note: note);
    log('note ${state.note}');
    _validate();
  }

  Future<void> save() async {
    state = state.copyWith(submissionStatus: FormzSubmissionStatus.inProgress);

    final entity = state.payment.value;

    if (entity == null) {
      AssertionError('Payment not found');
    }

    try {
      await _transactionService.updateLoanPayment(
        paymentId: paymentId,
        amount: state.amount,
        date: state.date ?? DateTime.now(),
        note: state.note,
        walletId: state.wallet?.id,
        loanId: entity!.loanId,
      );
      state = state.copyWith(submissionStatus: FormzSubmissionStatus.success);
    } catch (e) {
      state = state.copyWith(submissionStatus: FormzSubmissionStatus.failure);
    }
  }

  Future<void> init() async {
    await ref.read(walletServiceProvider.notifier).getWallets();
    final payment = await ref
        .read(loanPaymentsServiceProvider.notifier)
        .getPaymentById(paymentId);
    final walletOptions = ref.read(walletServiceProvider);

    state = state.copyWith(
      payment: AsyncData(payment),
      date: DateTime.tryParse(payment.date) ?? DateTime.now(),
      walletOptions: walletOptions,
      amount: payment.amount,
      wallet: walletOptions.value
          ?.firstWhereOrNull((element) => element.id == payment.walletId),
      note: payment.note ?? '',
    );
  }
}

final editLoanPaymentControllerProvider = StateNotifierProvider.family
    .autoDispose<EditPaymentController, EditPaymentState, int>(
  (ref, paymentId) => EditPaymentController(ref, paymentId)..init(),
);
