import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/features/transactions/domain/entities/transaction_item_entity.dart';

part 'transactions_state.freezed.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState({
    @Default(AsyncValue.data(null)) AsyncValue<TransactionItemEntity?> transactionItemEntity,
  }) = _TransactionsState;
}
