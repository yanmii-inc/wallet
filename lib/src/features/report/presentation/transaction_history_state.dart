import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/domain/entities/transaction_entity.dart';

part 'transaction_history_state.freezed.dart';

@freezed
class TransactionHistoryState with _$TransactionHistoryState {
  const factory TransactionHistoryState({
    @Default(AsyncLoading<List<TransactionEntity>>())
    AsyncValue<List<TransactionEntity>> transactions,
  }) = _TransactionHistoryState;
}
