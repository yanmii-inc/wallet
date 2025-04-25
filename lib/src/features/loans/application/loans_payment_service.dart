import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/mappers/loan_mapper.dart';
import 'package:yanmii_wallet/src/common/data/models/local/loan_payment.dart';
import 'package:yanmii_wallet/src/common/data/repositories/loan_repository.dart';
import 'package:yanmii_wallet/src/common/domain/entities/loan_payment_entity.dart';

class LoanPaymentsService extends Notifier<List<LoanPaymentEntity>> {
  LoanPaymentsService() : super();

  LoanRepository get _loanRepository => ref.watch(loanRepositoryProvider);

  @override
  List<LoanPaymentEntity> build() {
    return [];
  }

  Future<LoanPayment> addLoanPayment({
    required DateTime date,
    required int amount,
    required int loanId,
    int? walletId,
    String? note,
  }) async {
    final payment = LoanPayment(
      date: date.toIso8601String(),
      walletId: walletId,
      amount: amount,
      loanId: loanId,
    );
    final result = await _loanRepository.addPayment(payment);
    return result.when(
      success: (data) {
        return payment.copyWith(id: data);
      },
      failure: (e, st) {
        log('Error adding loan payment', error: e, stackTrace: st);
        throw Exception();
      },
    );
  }

  Future<LoanPayment> updateLoanPayment({
    required int paymentId,
    required DateTime date,
    required int amount,
    required int loanId,
    int? walletId,
    String? note,
  }) async {
    log('note $note');
    final payment = LoanPayment(
      date: date.toIso8601String(),
      walletId: walletId,
      amount: amount,
      id: paymentId,
      loanId: loanId,
      note: note,
    );
    final result = await _loanRepository.updatePayment(payment);
    return result.when(
      success: (data) {
        return payment.copyWith(id: data);
      },
      failure: (e, st) {
        log('Error adding loan payment', error: e, stackTrace: st);
        throw Exception();
      },
    );
  }

  Future<List<LoanPaymentEntity>> fetchLoanPayments(int loanId) async {
    final result = await _loanRepository.getPayments(loanId);

    return result.when(
      success: (success) {
        final mapper = ref.read(loanMapperProvider);
        final list =
            success.map(mapper.mapLoanPaymentToLoanPaymentEntity).toList();
        state = list;
        return list;
      },
      failure: (e, st) {
        log('Failed to get loan payments', error: e, stackTrace: st);
        throw Exception('Failed to get loan payments');
      },
    );
  }

  Future<LoanPaymentEntity> getPaymentById(int id) async {
    final result = await _loanRepository.getPaymentById(id);

    return result.when(
      success: (success) {
        final mapper = ref.read(loanMapperProvider);
        final entity = mapper.mapLoanPaymentToLoanPaymentEntity(success);
        return entity;
      },
      failure: (e, st) {
        log('Failed to get loan payments', error: e, stackTrace: st);
        throw Exception('Failed to get loan payments');
      },
    );
  }
}

final loanPaymentsServiceProvider =
    NotifierProvider<LoanPaymentsService, List<LoanPaymentEntity>>(
  LoanPaymentsService.new,
);
