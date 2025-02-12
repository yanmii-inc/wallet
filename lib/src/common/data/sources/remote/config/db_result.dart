// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'db_result.freezed.dart';

@freezed
class DbResult<T> with _$DbResult<T> {
  /// This function is returning when it success, usually call it inside try
  /// of try...catch, so it will be safe to get data from this function.
  const factory DbResult.success(T data) = DbSuccess<T>;

  /// This function is returning when it failure, usually call it inside catch
  /// of try...catch, so it will be more helpful to get error from try catch.
  const factory DbResult.failure(
    Object error,
    StackTrace stackTrace,
  ) = DbFailure<T>;
}
