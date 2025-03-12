import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/domain/entities/loan_entity.dart';

part 'loans_state.freezed.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState({
    @Default(AsyncLoading<List<LoanEntity>>())
    AsyncValue<List<LoanEntity>> transactions,
  }) = _TransactionsState;
}
