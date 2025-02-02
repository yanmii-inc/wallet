// ignore_for_file: avoid_dynamic_calls

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

part 'network_exceptions.freezed.dart';

@freezed
class NetworkExceptions with _$NetworkExceptions implements Exception {
  /// This functions are some exceptions that might shows

  // if some exceptions need to customize the error message.
  // then parameter [String reason] of the function.
  // don't forget to build with freezed
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorizedRequest(String reason) =
      UnauthorizedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.badCertificate() = BadCertificate;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  const factory NetworkExceptions.unProcessableEntity(
    Map<String, dynamic> errors,
  ) = UnProcessableEntity;

  /// This function called in the catch in try...catch, and then get the error
  /// and stacktrace, then in this function, will detect, what Exceptions will
  /// be, and then assign it to the function that we create above.
  factory NetworkExceptions.getException(
    Object exception,
    StackTrace stackTrace,
  ) {
    /// use for logging the error, quite helpful in debugging
    log(
      exception.toString(),
      stackTrace: stackTrace,
      error: exception,
      name: 'NETWORK EXCEPTION',
    );

    FirebaseCrashlytics.instance.recordError(exception, stackTrace);

    /// if the error is DioError, usually comes from Dio Network
    if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.cancel:
          return const NetworkExceptions.requestCancelled();
        case DioExceptionType.receiveTimeout:
          return const NetworkExceptions.sendTimeout();
        case DioExceptionType.sendTimeout:
          return const NetworkExceptions.sendTimeout();

        /// for catch the error response status code
        case DioExceptionType.badResponse:
          switch (exception.response?.statusCode) {
            case 400:
            case 401:
            case 403:
              return NetworkExceptions.unauthorizedRequest(
                '${exception.response?.data['error']['message']}',
              );
            case 404:
              return NetworkExceptions.notFound(
                "${exception.response?.data['error']['message']}",
              );
            case 408:
              return const NetworkExceptions.requestTimeout();

            case 409:
              return const NetworkExceptions.conflict();
            case 422:
              return NetworkExceptions.unProcessableEntity(
                exception.response?.data['error']['errors']
                    as Map<String, dynamic>,
              );
            case 500:
              return const NetworkExceptions.internalServerError();
            case 503:
              return const NetworkExceptions.serviceUnavailable();
            default:
              return NetworkExceptions.defaultError(
                "${exception.response?.data['error']['message']}",
              );
          }
        case DioExceptionType.connectionTimeout:
          return const NetworkExceptions.requestTimeout();
        case DioExceptionType.badCertificate:
          return const NetworkExceptions.badCertificate();
        case DioExceptionType.connectionError:
          return const NetworkExceptions.noInternetConnection();
        case DioExceptionType.unknown:
          return const NetworkExceptions.unexpectedError();
      }
    } else if (exception is SocketException) {
      /// for catch the no internet connection exception
      return const NetworkExceptions.noInternetConnection();
    } else if (exception is FormatException) {
      /// for catch the no internet connection exception
      return const NetworkExceptions.formatException();
    } else if (exception is Error) {
      /// for catch the no internet connection exception
      return const NetworkExceptions.formatException();
    } else {
      if (exception.toString().contains('is not a subtype of')) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }
}

extension NetworkExceptionExt on NetworkExceptions {
  /// This function called in the catch in controller, to show readable message
  /// from server that user can read, and then get the error. after we know
  /// what type of [NetworkExceptions], then we show it.
  String get message => when(
        notImplemented: () => 'Not Implemented'.hardcoded,
        requestCancelled: () => 'Request Cancelled'.hardcoded,
        internalServerError: () => 'Internal Server Error'.hardcoded,
        notFound: (String reason) => reason,
        serviceUnavailable: () => 'Service unavailable'.hardcoded,
        methodNotAllowed: () => 'Method Not Allowed'.hardcoded,
        badRequest: () => 'Bad request'.hardcoded,
        badCertificate: () => 'Bad Certificate'.hardcoded,
        unauthorizedRequest: (String reason) => reason,
        unexpectedError: () => 'Unexpected error occurred'.hardcoded,
        requestTimeout: () => 'Connection request timeout'.hardcoded,
        noInternetConnection: () => 'No internet connection'.hardcoded,
        conflict: () => 'Error due to a conflict'.hardcoded,
        sendTimeout: () =>
            'Send timeout in connection with API server'.hardcoded,
        unableToProcess: () => 'Unable to process the data'.hardcoded,
        defaultError: (String error) => error,
        formatException: () => 'Unexpected error occurred'.hardcoded,
        notAcceptable: () => 'Not acceptable'.hardcoded,
        unProcessableEntity: (error) => 'Un Processable Entity'.hardcoded,
      );

  Map<String, dynamic> get errors => maybeWhen(
        unProcessableEntity: (error) {
          return error;
        },
        orElse: () {
          return {};
        },
      );

  /// for get if its unauthorized or not, returning boolean.
  /// actually this is function that maybe we don't call, because of the simpan
  /// project, we have some difficult to detect if its unauthorized or not,
  /// because we are not using redirect in GoRouter.
  ///
  /// and maybe this function we can call it in the GoRouter redirection,
  /// if return true, then we redirect to login, if its not, redirect to home
  bool? get isUnauthorizedRequest => whenOrNull(
        unauthorizedRequest: (reason) {
          return true;
        },
      );
}
