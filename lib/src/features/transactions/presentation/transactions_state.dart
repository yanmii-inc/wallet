import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/domain/entities/transaction_entity.dart';

part 'transactions_state.freezed.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState({
    required DateTime selectedDate,
    @Default(AsyncLoading<List<TransactionEntity>>())
    AsyncValue<List<TransactionEntity>> transactions,
  }) = _TransactionsState;
}
