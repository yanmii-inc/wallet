import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_view_state.freezed.dart';

@freezed
class SummaryViewState with _$SummaryViewState {
  const factory SummaryViewState({
    required AsyncValue<int> monthlyBalance,
    required AsyncValue<int> totalExpense,
    required AsyncValue<int> totalIncome,
  }) = _SummaryViewState;
}
