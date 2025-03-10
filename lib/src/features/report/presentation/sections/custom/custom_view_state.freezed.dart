// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomViewState {
  AsyncValue<List<CustomBalanceEntity>> get months =>
      throw _privateConstructorUsedError;

  /// Create a copy of CustomViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomViewStateCopyWith<CustomViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomViewStateCopyWith<$Res> {
  factory $CustomViewStateCopyWith(
          CustomViewState value, $Res Function(CustomViewState) then) =
      _$CustomViewStateCopyWithImpl<$Res, CustomViewState>;
  @useResult
  $Res call({AsyncValue<List<CustomBalanceEntity>> months});
}

/// @nodoc
class _$CustomViewStateCopyWithImpl<$Res, $Val extends CustomViewState>
    implements $CustomViewStateCopyWith<$Res> {
  _$CustomViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomViewState
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
              as AsyncValue<List<CustomBalanceEntity>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomViewStateImplCopyWith<$Res>
    implements $CustomViewStateCopyWith<$Res> {
  factory _$$CustomViewStateImplCopyWith(_$CustomViewStateImpl value,
          $Res Function(_$CustomViewStateImpl) then) =
      __$$CustomViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<CustomBalanceEntity>> months});
}

/// @nodoc
class __$$CustomViewStateImplCopyWithImpl<$Res>
    extends _$CustomViewStateCopyWithImpl<$Res, _$CustomViewStateImpl>
    implements _$$CustomViewStateImplCopyWith<$Res> {
  __$$CustomViewStateImplCopyWithImpl(
      _$CustomViewStateImpl _value, $Res Function(_$CustomViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? months = null,
  }) {
    return _then(_$CustomViewStateImpl(
      months: null == months
          ? _value.months
          : months // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<CustomBalanceEntity>>,
    ));
  }
}

/// @nodoc

class _$CustomViewStateImpl implements _CustomViewState {
  const _$CustomViewStateImpl(
      {this.months = const AsyncLoading<List<CustomBalanceEntity>>()});

  @override
  @JsonKey()
  final AsyncValue<List<CustomBalanceEntity>> months;

  @override
  String toString() {
    return 'CustomViewState(months: $months)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomViewStateImpl &&
            (identical(other.months, months) || other.months == months));
  }

  @override
  int get hashCode => Object.hash(runtimeType, months);

  /// Create a copy of CustomViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomViewStateImplCopyWith<_$CustomViewStateImpl> get copyWith =>
      __$$CustomViewStateImplCopyWithImpl<_$CustomViewStateImpl>(
          this, _$identity);
}

abstract class _CustomViewState implements CustomViewState {
  const factory _CustomViewState(
          {final AsyncValue<List<CustomBalanceEntity>> months}) =
      _$CustomViewStateImpl;

  @override
  AsyncValue<List<CustomBalanceEntity>> get months;

  /// Create a copy of CustomViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomViewStateImplCopyWith<_$CustomViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
