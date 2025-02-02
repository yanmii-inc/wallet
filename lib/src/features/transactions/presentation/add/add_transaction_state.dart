import 'package:freezed_annotation/freezed_annotation.dart';

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
    @Default(false) bool isFormValid,
  }) = _AddTransactionState;
}
