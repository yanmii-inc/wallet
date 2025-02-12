import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/mappers/user_mapper.dart';
import 'package:yanmii_wallet/src/common/data/models/requests/login_request.dart';
import 'package:yanmii_wallet/src/common/data/sources/sources.dart';
import 'package:yanmii_wallet/src/common/domain/entities/user.dart';
import 'package:yanmii_wallet/src/utils/delay.dart';

class AuthRepository {
  AuthRepository(
    this.authApi, {
    required this.hiveService,
  });

  final AuthApi authApi;
  final HiveService hiveService;

  User? get currentUser => hiveService.currentUser;

  Future<String?> get userToken => hiveService.userToken;

  Stream<User?> get userStream async* {
    yield hiveService.currentUser;
  }

  Future<NetworkResult<User>> login(
    String email,
    String password,
  ) async {
    final request = LoginRequest(
      email: email,
      password: password,
    );

    try {
      final response = await authApi.login(request.toJson());

      final user = UserMapper.mapUserResponseToUser(response);

      hiveService.saveCurrentUser(user);
      await hiveService.saveUserToken(response.token);
      return NetworkResult.success(user);
    } catch (e, st) {
      return NetworkResult.failure(
        NetworkExceptions.getException(e, st),
        st,
      );
    }
  }

  Future<NetworkResult<User>> register(
    String email,
    String password,
    String password2,
  ) async {
    try {
      // final user = await authApi.register();
      await delay();
      final user = User(
        uid: email.split('').reversed.join(),
        email: email,
      );

      hiveService.saveCurrentUser(user);

      return NetworkResult.success(user);
    } catch (e, st) {
      return NetworkResult.failure(
        NetworkExceptions.getException(e, st),
        st,
      );
    }
  }

  Future<void> logout() async => hiveService
    ..deleteCurrentUser()
    ..deleteUserToken();

  void dispose() => hiveService.close();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final auth = AuthRepository(
    ref.watch(authApiProvider),
    hiveService: ref.watch(hiveServiceProvider),
  );
  ref.onDispose(auth.dispose);
  return auth;
});
