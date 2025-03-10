import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/features/report/domain/entities/custom_balance_entity.dart';

part 'custom_view_state.freezed.dart';

@freezed
class CustomViewState with _$CustomViewState {
  const factory CustomViewState({
    @Default(AsyncLoading<List<CustomBalanceEntity>>())
    AsyncValue<List<CustomBalanceEntity>> months,
  }) = _CustomViewState;
}
