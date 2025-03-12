import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/mappers/loan_mapper.dart';
import 'package:yanmii_wallet/src/common/data/mappers/transaction_mapper.dart';
import 'package:yanmii_wallet/src/common/data/models/local/loan.dart';
import 'package:yanmii_wallet/src/common/data/repositories/loan_repository.dart';
import 'package:yanmii_wallet/src/common/domain/entities/loan_entity.dart';
import 'package:yanmii_wallet/src/common/domain/entities/wallet_entity.dart';

class LoansService extends Notifier<List<LoanEntity>> {
  LoansService() : super();

  LoanRepository get _loanRepository => ref.watch(loanRepositoryProvider);

  @override
  List<LoanEntity> build() {
    return [];
  }

  Future<void> createTransaction({
    required String title,
    required String amount,
    required DateTime date,
    required String description,
    required LoanType type,
    WalletEntity? wallet,
  }) async {
    try {
      await _insertTransaction(
        amount: int.parse(amount),
        date: date.toIso8601String(),
        description: description,
        wallet: wallet,
        type: type,
        title: title,
      );
    } catch (e, st) {
      log(st.toString());
      rethrow;
    }
  }

  Future<void> getLoans() async {
    final mapper = ref.read(loanMapperProvider);
    final result = await _loanRepository.getLoans();

    result.when(
      success: (data) {
        state = data.map(mapper.mapLoanToLoanEntity).toList();
      },
      failure: (error, stackTrace) {
        log(
          'Error mapTransactionToTransactionEntity',
          error: error,
          stackTrace: stackTrace,
        );
      },
    );
  }

  Future<void> _insertTransaction({
    required String title,
    required int amount,
    required String date,
    required String description,
    required LoanType type,
    WalletEntity? wallet,
  }) async {
    final mapper = ref.read(transactionMapperProvider);
    final loan = Loan(
      name: title,
      amount: amount,
      date: date,
      type: type.name,
      description: description,
      walletId: wallet?.id,
      wallet: wallet == null ? null : mapper.mapWalletEntityToWallet(wallet),
    );

    log('_insertTransaction $loan');
    final result = await _loanRepository.add(loan);

    result.when(
      success: (data) {
        final mapper = ref.read(loanMapperProvider);

        final transactionEntity =
            mapper.mapLoanToLoanEntity(loan.copyWith(id: data));
        state = [...state, transactionEntity];
      },
      failure: (e, stackTrace) {
        log('Error adding transaction', error: e, stackTrace: stackTrace);
      },
    );
  }

  Future<void> updateTransaction({
    required int id,
    required String amount,
    required String title,
    required DateTime date,
    required LoanType type,
    String? description,
    WalletEntity? wallet,
  }) async {
    final mapper = ref.read(loanMapperProvider);
    final transactionMapper = ref.read(transactionMapperProvider);

    final value = Loan(
      name: title,
      amount: int.parse(amount),
      date: date.toIso8601String(),
      description: description,
      type: type.name,
      walletId: wallet?.id,
      wallet: wallet != null
          ? transactionMapper.mapWalletEntityToWallet(wallet)
          : null,
    );

    final result = await _loanRepository.update(value);

    result.when(
      success: (data) {
        final transactionEntity = mapper.mapLoanToLoanEntity(value);
        state = [
          ...state.map((transaction) {
            if (transaction.id == transactionEntity.id) {
              return transactionEntity;
            } else {
              return transaction;
            }
          }),
        ];

        log('transactions $state');
      },
      failure: (_, stackTrace) {},
    );
  }

  Future<void> deleteTransaction(LoanEntity transaction) async {
    final result = await _loanRepository.delete(transaction.id);

    result.when(
      success: (_) {
        state.removeWhere((element) => element.id == transaction.id);
      },
      failure: (_, stackTrace) {
        log('Error removing transaction', stackTrace: stackTrace);
      },
    );
  }

  Future<LoanEntity> getTransactionById(int id) async {
    final loan = await _loanRepository.getLoanById(id);
    return loan.when(
      success: (data) {
        final mapper = ref.read(loanMapperProvider);
        return mapper.mapLoanToLoanEntity(data);
      },
      failure: (e, st) {
        log(st.toString(), error: e, stackTrace: st);
        throw Exception();
      },
    );
  }
}

final loansServiceProvider = NotifierProvider<LoansService, List<LoanEntity>>(
  LoansService.new,
);
