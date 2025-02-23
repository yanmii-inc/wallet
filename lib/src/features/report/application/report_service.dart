import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/data/repositories/transaction_repository.dart';
import 'package:yanmii_wallet/src/common/domain/entities/monthly_balance_entity.dart';
import 'package:yanmii_wallet/src/features/report/domain/entities/report_entity.dart';
import 'package:yanmii_wallet/src/features/report/domain/mapper/report_mapper.dart';
import 'package:yanmii_wallet/src/utils/helpers/shared_preference_helper.dart';

class ReportService {
  ReportService(this.ref, this.transactionRepository);

  final Ref ref;
  final TransactionRepository transactionRepository;

  List<ReportEntity> reports = [];
  List<MonthlyBalanceEntity> monthlyBalances = [];

  Future<void> getCategoryTotals(DateTime month) async {
    final result = await transactionRepository.getCategoryTotals(month);

    result.when(
      success: (data) {
        final mapper = ref.read(reportMapperProvider);
        final total = data
            .map((e) => e.total)
            .reduce((value, element) => value + element);
        log('total $total');
        reports = data.map((e) => mapper.toReportEntity(e, total)).toList();
      },
      failure: (e, st) {
        log(e.toString(), error: e, stackTrace: st);
        throw Exception(e);
      },
    );
  }

  Future<void> getMonthlyRecap() async {
    final startDate =
        await SharedPreferencesHelper.getInt(AppConstants.startDateKey);
    final showRunningBalance = await SharedPreferencesHelper.getBool(
      AppConstants.showCumulativeBalanceKey,
    );
    log('startDate $startDate');
    final result =
        await transactionRepository.getMonthlyRecap(startDate: startDate);

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
}

final reportServiceProvider = Provider<ReportService>(
  (ref) => ReportService(ref, ref.watch(transactionRepositoryProvider)),
);
