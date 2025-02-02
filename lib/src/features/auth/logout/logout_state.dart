import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_state.freezed.dart';

@freezed
class LogoutState with _$LogoutState {
  const factory LogoutState({
    @Default(AsyncValue.data(false)) AsyncValue<bool> isSuccessful,
  }) = _LogoutState;
}
