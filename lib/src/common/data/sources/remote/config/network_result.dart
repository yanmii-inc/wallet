// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yanmii_wallet/src/common/data/sources/remote/config/network_exceptions.dart';

part 'network_result.freezed.dart';

@freezed
class NetworkResult<T> with _$NetworkResult<T> {
  /// This function is returning when it success, usually call it inside try
  /// of try...catch, so it will be safe to get data from this function.
  const factory NetworkResult.success(T data) = Success<T>;

  /// This function is returning when it failure, usually call it inside catch
  /// of try...catch, so it will be more helpful to get error from try catch.
  const factory NetworkResult.failure(
    NetworkExceptions error,
    StackTrace stackTrace,
  ) = Failure<T>;
}
