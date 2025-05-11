import 'package:formz/formz.dart';

/// Validation errors for the [TextFormz] [FormzInput].
enum TextFormzValidationError {
  /// Generic invalid error.
  invalid,

  /// The text is empty.
  empty;

  String get message {
    switch (this) {
      case TextFormzValidationError.invalid:
        return 'Invalid input';
      case TextFormzValidationError.empty:
        return 'This field is required';
    }
  }
}

/// {@template text_formz}
/// Form input for a text input.
/// {@endtemplate}
class TextFormz extends FormzInput<String, TextFormzValidationError> {
  /// {@macro text_formz}
  const TextFormz.pure() : super.pure('');

  /// {@macro text_formz}
  const TextFormz.dirty([super.value = '']) : super.dirty();

  @override
  TextFormzValidationError? validator(String value) {
    if (value.isEmpty) {
      return TextFormzValidationError.empty;
    }
    return null;
  }
}
