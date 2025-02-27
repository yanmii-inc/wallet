import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/data/mappers/transaction_mapper.dart';
import 'package:yanmii_wallet/src/common/data/repositories/transaction_repository.dart';
import 'package:yanmii_wallet/src/common/domain/entities/monthly_balance_entity.dart';
import 'package:yanmii_wallet/src/common/domain/entities/transaction_entity.dart';
import 'package:yanmii_wallet/src/features/report/domain/entities/report_entity.dart';
import 'package:yanmii_wallet/src/features/report/domain/entities/title_report_entity.dart';
import 'package:yanmii_wallet/src/features/report/domain/mapper/report_mapper.dart';
import 'package:yanmii_wallet/src/utils/helpers/shared_preference_helper.dart';

class ReportService {
  ReportService(this.ref, this.transactionRepository);

  final Ref ref;
  final TransactionRepository transactionRepository;

  List<ReportEntity> reports = [];
  List<TitleReportEntity> titleReports = [];
  List<MonthlyBalanceEntity> monthlyBalances = [];
  List<TransactionEntity> transactions = [];

  Future<void> getCategoryTotals({required DateTime startDateTime}) async {
    final result = await transactionRepository.getCategoryTotals(
      startDateTime: startDateTime,
    );

    result.when(
      success: (data) {
        final mapper = ref.read(reportMapperProvider);
        final total = data.map((e) => e.total).sum;
        reports = data.map((e) => mapper.toReportEntity(e, total)).toList();
        log('categoryReports $reports');
      },
      failure: (e, st) {
        log(e.toString(), error: e, stackTrace: st);
        throw Exception(e);
      },
    );
  }

  Future<void> getTitleTransactions(DateTime month) async {
    final result =
        await transactionRepository.getTitleTransactions(startDateTime: month);

    result.when(
      success: (data) {
        final mapper = ref.read(reportMapperProvider);
        final total = data.map((e) => e.total).sum;
        titleReports =
            data.map((e) => mapper.toTitleReportEntity(e, total)).toList();
      },
      failure: (e, st) {
        log(e.toString(), error: e, stackTrace: st);
        throw Exception(e);
      },
    );
  }

  Future<void> getMonthlyRecaps() async {
    final startDate =
        await SharedPreferencesHelper.getInt(AppConstants.startDateKey);
    final showRunningBalance = await SharedPreferencesHelper.getBool(
      AppConstants.showCumulativeBalanceKey,
    );
    final result =
        await transactionRepository.getMonthlyRecaps(startDate: startDate);

    result.when(
      success: (data) {
        final mapper = ref.read(reportMapperProvider);
        monthlyBalances = data
            .map(
              (e) => mapper.toMonthlyBalanceEntity(
                e,
                startDate: startDate,
                showRunningBalance: showRunningBalance,
              ),
            )
            .toList();
        log('monthlyBalances $monthlyBalances');
      },
      failure: (e, st) {
        log(e.toString(), error: e, stackTrace: st);
        monthlyBalances = [];
        throw Exception(e);
      },
    );
  }

  Future<void> getTransactionsByTitle(
    String title, {
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final mapper = ref.read(transactionMapperProvider);
    final result = await transactionRepository.getTransactionsByTitle(
      title,
      startDate: startDate,
      endDate: endDate,
    );

    result.when(
      success: (data) {
        transactions =
            data.map(mapper.mapTransactionToTransactionEntity).toList();
        log('transactions == $transactions');
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

  Future<void> getTransactionsByCategory(
    int categoryId, {
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final mapper = ref.read(transactionMapperProvider);
    final result = await transactionRepository.getTransactionsByCategory(
      categoryId,
      startDate: startDate,
      endDate: endDate,
    );

    result.when(
      success: (data) {
        transactions =
            data.map(mapper.mapTransactionToTransactionEntity).toList();
        log('transactions == $transactions');
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
}

final reportServiceProvider = Provider<ReportService>(
  (ref) => ReportService(ref, ref.watch(transactionRepositoryProvider)),
);
