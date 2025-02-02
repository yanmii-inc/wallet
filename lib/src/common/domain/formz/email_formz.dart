import 'package:formz/formz.dart';
import 'package:yanmii_wallet/src/utils/validators/string_validators.dart';

enum EmailValidationError {
  empty,
  invalid,
  ;

  String get message {
    switch (this) {
      case empty:
        return "Email can't be empty";
      case invalid:
        return 'Invalid email';
    }
  }
}

class EmailFormz extends FormzInput<String, EmailValidationError> {
  const EmailFormz.pure() : super.pure('');

  const EmailFormz.dirty(super.value) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    if (value.length < 4) return EmailValidationError.empty;

    if (!EmailSubmitRegexValidator().isValid(value)) {
      return EmailValidationError.invalid;
    }

    return null;
  }
}
