// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'db_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DbResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object error, StackTrace stackTrace) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object error, StackTrace stackTrace)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object error, StackTrace stackTrace)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DbSuccess<T> value) success,
    required TResult Function(DbFailure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DbSuccess<T> value)? success,
    TResult? Function(DbFailure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DbSuccess<T> value)? success,
    TResult Function(DbFailure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbResultCopyWith<T, $Res> {
  factory $DbResultCopyWith(
          DbResult<T> value, $Res Function(DbResult<T>) then) =
      _$DbResultCopyWithImpl<T, $Res, DbResult<T>>;
}

/// @nodoc
class _$DbResultCopyWithImpl<T, $Res, $Val extends DbResult<T>>
    implements $DbResultCopyWith<T, $Res> {
  _$DbResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DbResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DbSuccessImplCopyWith<T, $Res> {
  factory _$$DbSuccessImplCopyWith(
          _$DbSuccessImpl<T> value, $Res Function(_$DbSuccessImpl<T>) then) =
      __$$DbSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$DbSuccessImplCopyWithImpl<T, $Res>
    extends _$DbResultCopyWithImpl<T, $Res, _$DbSuccessImpl<T>>
    implements _$$DbSuccessImplCopyWith<T, $Res> {
  __$$DbSuccessImplCopyWithImpl(
      _$DbSuccessImpl<T> _value, $Res Function(_$DbSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DbResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$DbSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$DbSuccessImpl<T> implements DbSuccess<T> {
  const _$DbSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'DbResult<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DbSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of DbResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DbSuccessImplCopyWith<T, _$DbSuccessImpl<T>> get copyWith =>
      __$$DbSuccessImplCopyWithImpl<T, _$DbSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object error, StackTrace stackTrace) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object error, StackTrace stackTrace)? failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object error, StackTrace stackTrace)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DbSuccess<T> value) success,
    required TResult Function(DbFailure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DbSuccess<T> value)? success,
    TResult? Function(DbFailure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DbSuccess<T> value)? success,
    TResult Function(DbFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class DbSuccess<T> implements DbResult<T> {
  const factory DbSuccess(final T data) = _$DbSuccessImpl<T>;

  T get data;

  /// Create a copy of DbResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DbSuccessImplCopyWith<T, _$DbSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DbFailureImplCopyWith<T, $Res> {
  factory _$$DbFailureImplCopyWith(
          _$DbFailureImpl<T> value, $Res Function(_$DbFailureImpl<T>) then) =
      __$$DbFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class __$$DbFailureImplCopyWithImpl<T, $Res>
    extends _$DbResultCopyWithImpl<T, $Res, _$DbFailureImpl<T>>
    implements _$$DbFailureImplCopyWith<T, $Res> {
  __$$DbFailureImplCopyWithImpl(
      _$DbFailureImpl<T> _value, $Res Function(_$DbFailureImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DbResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(_$DbFailureImpl<T>(
      null == error ? _value.error : error,
      null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$DbFailureImpl<T> implements DbFailure<T> {
  const _$DbFailureImpl(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'DbResult<$T>.failure(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DbFailureImpl<T> &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stackTrace);

  /// Create a copy of DbResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DbFailureImplCopyWith<T, _$DbFailureImpl<T>> get copyWith =>
      __$$DbFailureImplCopyWithImpl<T, _$DbFailureImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object error, StackTrace stackTrace) failure,
  }) {
    return failure(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object error, StackTrace stackTrace)? failure,
  }) {
    return failure?.call(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object error, StackTrace stackTrace)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DbSuccess<T> value) success,
    required TResult Function(DbFailure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DbSuccess<T> value)? success,
    TResult? Function(DbFailure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DbSuccess<T> value)? success,
    TResult Function(DbFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class DbFailure<T> implements DbResult<T> {
  const factory DbFailure(final Object error, final StackTrace stackTrace) =
      _$DbFailureImpl<T>;

  Object get error;
  StackTrace get stackTrace;

  /// Create a copy of DbResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DbFailureImplCopyWith<T, _$DbFailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
