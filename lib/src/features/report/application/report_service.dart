import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/data/repositories/transaction_repository.dart';
import 'package:yanmii_wallet/src/common/domain/entities/monthly_balance_entity.dart';
import 'package:yanmii_wallet/src/features/report/domain/entities/custom_balance_entity.dart';
import 'package:yanmii_wallet/src/features/report/domain/entities/report_entity.dart';
import 'package:yanmii_wallet/src/features/report/domain/entities/title_report_entity.dart';
import 'package:yanmii_wallet/src/features/report/domain/mapper/report_mapper.dart';
import 'package:yanmii_wallet/src/utils/helpers/shared_preference_helper.dart';

class ReportService {
  ReportService(this.ref) : super();
  final Ref ref;

  TransactionRepository get transactionRepository =>
      ref.watch(transactionRepositoryProvider);

  Future<List<ReportEntity>> getCategoryTotals({
    required DateTime startDateTime,
  }) async {
    final result = await transactionRepository.getCategoryTotals(
      startDateTime: startDateTime,
    );

    return result.when(
      success: (data) {
        final mapper = ref.read(reportMapperProvider);
        final total = data.map((e) => e.total).sum;
        return data.map((e) => mapper.toReportEntity(e, total)).toList();
      },
      failure: (e, st) {
        log(e.toString(), error: e, stackTrace: st);
        return [];
      },
    );
  }

  Future<List<TitleReportEntity>> getTitleTransactions(DateTime month) async {
    final result =
        await transactionRepository.getTitleTransactions(startDateTime: month);

    return result.when(
      success: (data) {
        final mapper = ref.read(reportMapperProvider);
        final total = data.map((e) => e.total).sum;
        return data.map((e) => mapper.toTitleReportEntity(e, total)).toList();
      },
      failure: (e, st) {
        log(e.toString(), error: e, stackTrace: st);
        return [];
      },
    );
  }

  Future<List<MonthlyBalanceEntity>> getMonthlyRecaps() async {
    final startDate =
        await SharedPreferencesHelper.getInt(AppConstants.startDateKey);
    final showRunningBalance = await SharedPreferencesHelper.getBool(
      AppConstants.showCumulativeBalanceKey,
    );
    final result =
        await transactionRepository.getMonthlyRecaps(startDate: startDate);

    return result.when(
      success: (data) {
        final mapper = ref.read(reportMapperProvider);
        final monthlyBalances = data
            .map(
              (e) => mapper.toMonthlyBalanceEntity(
                e,
                startDate: startDate,
                showRunningBalance: showRunningBalance,
              ),
            )
            .toList();
        return monthlyBalances;
      },
      failure: (e, st) {
        log(e.toString(), error: e, stackTrace: st);
        return [];
      },
    );
  }

  Future<List<CustomBalanceEntity>> getCustomRecaps() async {
    final result = await transactionRepository.getCustomRecaps();

    return result.when(
      success: (data) {
        final mapper = ref.read(reportMapperProvider);
        return data.map(mapper.toCustomBalanceEntity).toList();
      },
      failure: (e, st) {
        log(e.toString(), error: e, stackTrace: st);
        return [];
      },
    );
  }

  Future<void> addCustomRecap(
    String title,
    DateTime startDate,
    DateTime endDate,
  ) async {
    final result = await transactionRepository.addCustomRecap(
      title,
      startDate,
      endDate,
    );

    result.when(
      success: (id) {
        return id;
      },
      failure: (e, st) {
        log(e.toString(), error: e, stackTrace: st);
        throw Exception();
      },
    );
  }

  Future<CustomBalanceEntity> getMonthRecaps({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final result = await transactionRepository.getDetailedRecapByRange(
      startDate: startDate,
      endDate: endDate,
    );
    return result.when(
      success: (data) {
        final mapper = ref.read(reportMapperProvider);
        log(data.toJson().toString());
        return mapper.toCustomBalanceEntity(data);
      },
      failure: (e, st) {
        log(e.toString(), error: e, stackTrace: st);
        throw Exception();
      },
    );
  }
}

final reportServiceProvider = Provider<ReportService>(ReportService.new);
