import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_balance_entity.freezed.dart';

@freezed
class CustomBalanceEntity with _$CustomBalanceEntity {
  const factory CustomBalanceEntity({
    required int id,
    required String title,
    required DateTime startDate,
    required DateTime endDate,
    required int totalExpense,
    required int totalIncome,
    required int balance,
  }) = _CustomBalanceEntity;
}
