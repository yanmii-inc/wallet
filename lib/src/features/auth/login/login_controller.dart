import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:yanmii_wallet/src/common/domain/formz/formz.dart';
import 'package:yanmii_wallet/src/common/services/auth_service.dart';
import 'package:yanmii_wallet/src/features/auth/login/login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginState());

  final Ref ref;

  bool validate({EmailFormz? email, PasswordFormz? password}) {
    return Formz.validate([email ?? state.email, password ?? state.password]);
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

  Future<void> submit(String email, String password) async {
    state = state.copyWith(value: const AsyncValue.loading());

    final response = await ref.read(authServiceProvider).login(email, password);

    response.when(
      success: (data) {
        state = state.copyWith(
          value: AsyncValue.data(data),
          submissionStatus: FormzSubmissionStatus.success,
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          submissionStatus: FormzSubmissionStatus.failure,
        );
      },
    );
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>(
  LoginController.new,
);
