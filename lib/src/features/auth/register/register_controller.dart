import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:yanmii_wallet/src/common/domain/formz/formz.dart';
import 'package:yanmii_wallet/src/common/services/auth_service.dart';
import 'package:yanmii_wallet/src/features/auth/register/register_state.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController(this.ref) : super(const RegisterState());

  final Ref ref;

  bool validate({
    EmailFormz? email,
    PasswordFormz? password,
    ConfirmPasswordFormz? password2,
    TextFormz? fullName,
  }) {
    return Formz.validate([
      email ?? state.email,
      password ?? state.password,
      password2 ?? state.password2,
      fullName ?? state.fullName,
    ]);
  }

  void updateEmail(String value) {
    final email = EmailFormz.dirty(value);
    state = state.copyWith(
      email: email,
      isValid: validate(email: email),
    );
  }

  void updatePassword(String value) {
    final password = PasswordFormz.dirty(value);
    state = state.copyWith(
      password: password,
      isValid: validate(password: password),
    );
  }

  void updatePassword2(String value) {
    final password2 = ConfirmPasswordFormz.dirty(
      value,
      other: state.password.value,
    );

    state = state.copyWith(
      password2: password2,
      isValid: validate(password2: password2),
    );
  }

  void updateFullName(String value) {
    final fullName = TextFormz.dirty(value);
    state = state.copyWith(
      fullName: fullName,
      isValid: validate(fullName: fullName),
    );
  }

  Future<void> submit() async {
    if (!state.isValid) return;

    state = state.copyWith(submissionStatus: FormzSubmissionStatus.inProgress);

    try {
      final user = await ref.read(authServiceProvider).signUp(
        email: state.email.value,
        password: state.password.value,
        fullName: state.fullName.value,
      );

      state = state.copyWith(
        value: AsyncValue.data(user),
        submissionStatus: FormzSubmissionStatus.success,
      );
    } catch (e) {
      state = state.copyWith(
        submissionStatus: FormzSubmissionStatus.failure,
      );
    }
  }
}

final registerControllerProvider =
    StateNotifierProvider<RegisterController, RegisterState>(
  RegisterController.new,
);
