import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum TransactionType {
  income,
  expense,
  transfer,
}
