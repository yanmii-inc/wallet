// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MonthlyViewState {
  AsyncValue<List<MonthlyBalanceEntity>> get months =>
      throw _privateConstructorUsedError;

  /// Create a copy of MonthlyViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyViewStateCopyWith<MonthlyViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyViewStateCopyWith<$Res> {
  factory $MonthlyViewStateCopyWith(
          MonthlyViewState value, $Res Function(MonthlyViewState) then) =
      _$MonthlyViewStateCopyWithImpl<$Res, MonthlyViewState>;
  @useResult
  $Res call({AsyncValue<List<MonthlyBalanceEntity>> months});
}

/// @nodoc
class _$MonthlyViewStateCopyWithImpl<$Res, $Val extends MonthlyViewState>
    implements $MonthlyViewStateCopyWith<$Res> {
  _$MonthlyViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? months = null,
  }) {
    return _then(_value.copyWith(
      months: null == months
          ? _value.months
          : months // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<MonthlyBalanceEntity>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyViewStateImplCopyWith<$Res>
    implements $MonthlyViewStateCopyWith<$Res> {
  factory _$$MonthlyViewStateImplCopyWith(_$MonthlyViewStateImpl value,
          $Res Function(_$MonthlyViewStateImpl) then) =
      __$$MonthlyViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<MonthlyBalanceEntity>> months});
}

/// @nodoc
class __$$MonthlyViewStateImplCopyWithImpl<$Res>
    extends _$MonthlyViewStateCopyWithImpl<$Res, _$MonthlyViewStateImpl>
    implements _$$MonthlyViewStateImplCopyWith<$Res> {
  __$$MonthlyViewStateImplCopyWithImpl(_$MonthlyViewStateImpl _value,
      $Res Function(_$MonthlyViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlyViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? months = null,
  }) {
    return _then(_$MonthlyViewStateImpl(
      months: null == months
          ? _value.months
          : months // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<MonthlyBalanceEntity>>,
    ));
  }
}

/// @nodoc

class _$MonthlyViewStateImpl implements _MonthlyViewState {
  const _$MonthlyViewStateImpl(
      {this.months = const AsyncLoading<List<MonthlyBalanceEntity>>()});

  @override
  @JsonKey()
  final AsyncValue<List<MonthlyBalanceEntity>> months;

  @override
  String toString() {
    return 'MonthlyViewState(months: $months)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyViewStateImpl &&
            (identical(other.months, months) || other.months == months));
  }

  @override
  int get hashCode => Object.hash(runtimeType, months);

  /// Create a copy of MonthlyViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyViewStateImplCopyWith<_$MonthlyViewStateImpl> get copyWith =>
      __$$MonthlyViewStateImplCopyWithImpl<_$MonthlyViewStateImpl>(
          this, _$identity);
}

abstract class _MonthlyViewState implements MonthlyViewState {
  const factory _MonthlyViewState(
          {final AsyncValue<List<MonthlyBalanceEntity>> months}) =
      _$MonthlyViewStateImpl;

  @override
  AsyncValue<List<MonthlyBalanceEntity>> get months;

  /// Create a copy of MonthlyViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyViewStateImplCopyWith<_$MonthlyViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
