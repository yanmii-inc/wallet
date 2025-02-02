import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/domain/entities/user.dart';
import 'package:yanmii_wallet/src/common/domain/formz/formz.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(EmailFormz.pure()) EmailFormz email,
    @Default(PasswordFormz.pure()) PasswordFormz password,
    @Default(false) bool isValid,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus submissionStatus,
    @Default(AsyncValue.data(null)) AsyncValue<User?> value,
  }) = _LoginState;
}
