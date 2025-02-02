import 'package:formz/formz.dart';
import 'package:yanmii_wallet/src/utils/validators/string_validators.dart';

enum PasswordValidationError {
  empty,
  tooShort,
  invalid,
  mismatch,
  ;

  String get message {
    switch (this) {
      case empty:
        return "Password can't be empty";
      case tooShort:
        return 'Password is too short';
      case invalid:
        return 'Must contain at least 1 characters and 1 symbol';
      case mismatch:
        return 'Password must be equal';
    }
  }
}

class PasswordFormz extends FormzInput<String, PasswordValidationError> {
  const PasswordFormz.pure() : super.pure('');

  const PasswordFormz.dirty(super.value) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return PasswordValidationError.empty;
    }

    if (!MinLengthStringValidator(4).isValid(value)) {
      return PasswordValidationError.tooShort;
    }

    if (!PasswordSubmitRegexValidator().isValid(value)) {
      return PasswordValidationError.invalid;
    }

    return null;
  }
}

class ConfirmPasswordFormz extends FormzInput<String, PasswordValidationError> {
  const ConfirmPasswordFormz.pure({this.other = ''}) : super.pure('');

  const ConfirmPasswordFormz.dirty(super.value, {required this.other})
      : super.dirty();

  final String other;

  @override
  PasswordValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return PasswordValidationError.empty;
    }

    if (!MinLengthStringValidator(4).isValid(value)) {
      return PasswordValidationError.tooShort;
    }

    if (!PasswordSubmitRegexValidator().isValid(value)) {
      return PasswordValidationError.invalid;
    }

    if (!EqualityValidator(other).isValid(value)) {
      return PasswordValidationError.mismatch;
    }

    return null;
  }
}
