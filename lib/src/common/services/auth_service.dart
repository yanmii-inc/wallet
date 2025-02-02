import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/repositories/auth_repository.dart';
import 'package:yanmii_wallet/src/common/data/sources/remote/config/result.dart';
import 'package:yanmii_wallet/src/common/domain/entities/user.dart';
import 'package:yanmii_wallet/src/common/domain/enums/auth_status.dart';

class AuthService extends ChangeNotifier {
  AuthService(this.authRepository);

  final AuthRepository authRepository;

  Future<Result<User>> login(String email, String password) {
    final result = authRepository.login(email, password);
    return result;
  }

  Future<void> logout() async {
    await authRepository.logout();
  }

  Future<AuthStatus> get authStatus async {
    final userToken = await authRepository.userToken;
    return userToken != null
        ? AuthStatus.authenticated
        : AuthStatus.unauthenticated;
  }

  Future<User?> get currentUser async {
    return authRepository.currentUser;
  }

  Stream<User?> get userStream {
    return authRepository.userStream;
  }
}

final authServiceProvider = ChangeNotifierProvider<AuthService>(
  (ref) => AuthService(ref.read(authRepositoryProvider)),
);

final authStateProvider = StreamProvider<User?>(
  (ref) => ref.watch(authRepositoryProvider).userStream,
);
