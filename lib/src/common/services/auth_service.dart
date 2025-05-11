import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/repositories/auth_repository.dart';
import 'package:yanmii_wallet/src/common/domain/entities/user.dart';
import 'package:yanmii_wallet/src/common/domain/enums/auth_status.dart';

class AuthService extends ChangeNotifier {
  AuthService(this.ref);

  final Ref ref;

  AuthRepository get _authRepository => ref.read(authRepositoryProvider);

  bool get isAuthenticated => _authRepository.currentUser != null;

  Future<User> signIn(String email, String password) async {
    return _authRepository.signIn(email, password);
  }

  Future<User> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    return _authRepository.signUp(
      email: email,
      password: password,
      fullName: fullName,
    );
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    notifyListeners();
  }

  Future<String?> get userToken async {
    return _authRepository.userToken;
  }

  User? get currentUser => _authRepository.currentUser;

  Future<AuthStatus> get authStatus async {
    return _authRepository.authStatus;
  }

  Future<void> resendConfirmationEmail(String email) async {
    await _authRepository.resendConfirmationEmail(email);
  }
}

final authServiceProvider =
    ChangeNotifierProvider<AuthService>(AuthService.new);

final authStateProvider = StreamProvider<User?>((ref) async* {
  while (true) {
    yield ref.read(authRepositoryProvider).currentUser;
    await Future<void>.delayed(const Duration(seconds: 1));
  }
});
