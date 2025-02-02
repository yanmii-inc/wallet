import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:yanmii_wallet/src/common/data/repositories/auth_repository.dart';
import 'package:yanmii_wallet/src/common/domain/formz/formz.dart';
import 'package:yanmii_wallet/src/features/auth/register/register_state.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController(this.ref) : super(const RegisterState());

  final Ref ref;

  bool validate({
    EmailFormz? email,
    PasswordFormz? password,
    ConfirmPasswordFormz? password2,
  }) {
    return Formz.validate([
      email ?? state.email,
      password ?? state.password,
      password2 ?? state.password2,
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

  Future<void> submit(
    String email,
    String password,
    String password2,
  ) async {
    state = state.copyWith(value: const AsyncValue.loading());

    final response = await ref
        .read(authRepositoryProvider)
        .register(email, password, password2);
    response.when(
      success: (data) => state = state.copyWith(
        value: AsyncValue.data(data),
        submissionStatus: FormzSubmissionStatus.success,
      ),
      failure: (error, stackTrace) => state = state.copyWith(
        submissionStatus: FormzSubmissionStatus.failure,
      ),
    );
  }
}

final registerControllerProvider =
    StateNotifierProvider<RegisterController, RegisterState>(
  RegisterController.new,
);
