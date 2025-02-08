import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/data/models/type.dart';

part 'add_transaction_state.freezed.dart';

@freezed
class AddTransactionState with _$AddTransactionState {
  const factory AddTransactionState({
    @Default(null) DateTime? date,
    @Default('') String wallet,
    @Default('') String name,
    @Default(0) int amount,
    @Default('') String category,
    @Default('') String description,
    @Default(TransactionType.expense) TransactionType type,
    @Default(false) bool isFormValid,
  }) = _AddTransactionState;
}
