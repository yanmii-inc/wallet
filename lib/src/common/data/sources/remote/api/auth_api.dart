// ignore_for_file: inference_failure_on_function_invocation

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yanmii_wallet/src/common/data/models/responses/user_response.dart';
import 'package:yanmii_wallet/src/common/data/sources/remote/config/dio_client.dart';
import 'package:yanmii_wallet/src/common/data/sources/sources.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST(Endpoint.login)
  Future<UserResponse> login(@Body() Map<String, dynamic> body);

  @POST(Endpoint.register)
  Future<UserResponse> register(@Body() Map<String, dynamic> body);

  @POST(Endpoint.logout)
  Future<void> logout();
}

final authApiProvider = Provider<AuthApi>(
  (ref) => AuthApi(ref.watch(dioClientProvider).dio),
);
