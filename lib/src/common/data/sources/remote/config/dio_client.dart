// ignore_for_file: inference_failure_on_untyped_parameter,
// ignore_for_file: type_annotate_public_apis

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/sources/local/hive_service.dart';

const _defaultConnectTimeout = Duration(milliseconds: 15000);
const _defaultReceiveTimeout = Duration(milliseconds: 15000);

class DioClient {
  DioClient({
    required HiveService hiveService,
    List<Interceptor>? interceptors,
  }) {
    const baseUrl = String.fromEnvironment(
      'API_URL',
      defaultValue: 'http://0.0.0.0:8080/',
    );

    _dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

    (_dio.httpClientAdapter as IOHttpClientAdapter).validateCertificate =
        (certificate, host, port) => true;

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) async {
          final token = await hiveService.userToken;
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );

    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors!);
    }

    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestHeader: false,
          responseHeader: false,
          request: false,
          logPrint: (obj) => log(obj.toString()),
        ),
      );
    }
  }
  late Dio _dio;

  Dio get dio => _dio;
}

final dioClientProvider =
    Provider((ref) => DioClient(hiveService: ref.watch(hiveServiceProvider)));
