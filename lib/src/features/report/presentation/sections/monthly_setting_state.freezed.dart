// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MonthlySettingState {
  bool get showCumulativeBalance => throw _privateConstructorUsedError;
  int get startDate => throw _privateConstructorUsedError;

  /// Create a copy of MonthlySettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlySettingStateCopyWith<MonthlySettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlySettingStateCopyWith<$Res> {
  factory $MonthlySettingStateCopyWith(
          MonthlySettingState value, $Res Function(MonthlySettingState) then) =
      _$MonthlySettingStateCopyWithImpl<$Res, MonthlySettingState>;
  @useResult
  $Res call({bool showCumulativeBalance, int startDate});
}

/// @nodoc
class _$MonthlySettingStateCopyWithImpl<$Res, $Val extends MonthlySettingState>
    implements $MonthlySettingStateCopyWith<$Res> {
  _$MonthlySettingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlySettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showCumulativeBalance = null,
    Object? startDate = null,
  }) {
    return _then(_value.copyWith(
      showCumulativeBalance: null == showCumulativeBalance
          ? _value.showCumulativeBalance
          : showCumulativeBalance // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlySettingStateImplCopyWith<$Res>
    implements $MonthlySettingStateCopyWith<$Res> {
  factory _$$MonthlySettingStateImplCopyWith(_$MonthlySettingStateImpl value,
          $Res Function(_$MonthlySettingStateImpl) then) =
      __$$MonthlySettingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool showCumulativeBalance, int startDate});
}

/// @nodoc
class __$$MonthlySettingStateImplCopyWithImpl<$Res>
    extends _$MonthlySettingStateCopyWithImpl<$Res, _$MonthlySettingStateImpl>
    implements _$$MonthlySettingStateImplCopyWith<$Res> {
  __$$MonthlySettingStateImplCopyWithImpl(_$MonthlySettingStateImpl _value,
      $Res Function(_$MonthlySettingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlySettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showCumulativeBalance = null,
    Object? startDate = null,
  }) {
    return _then(_$MonthlySettingStateImpl(
      showCumulativeBalance: null == showCumulativeBalance
          ? _value.showCumulativeBalance
          : showCumulativeBalance // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MonthlySettingStateImpl implements _MonthlySettingState {
  const _$MonthlySettingStateImpl(
      {this.showCumulativeBalance = false, this.startDate = 1});

  @override
  @JsonKey()
  final bool showCumulativeBalance;
  @override
  @JsonKey()
  final int startDate;

  @override
  String toString() {
    return 'MonthlySettingState(showCumulativeBalance: $showCumulativeBalance, startDate: $startDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlySettingStateImpl &&
            (identical(other.showCumulativeBalance, showCumulativeBalance) ||
                other.showCumulativeBalance == showCumulativeBalance) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, showCumulativeBalance, startDate);

  /// Create a copy of MonthlySettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlySettingStateImplCopyWith<_$MonthlySettingStateImpl> get copyWith =>
      __$$MonthlySettingStateImplCopyWithImpl<_$MonthlySettingStateImpl>(
          this, _$identity);
}

abstract class _MonthlySettingState implements MonthlySettingState {
  const factory _MonthlySettingState(
      {final bool showCumulativeBalance,
      final int startDate}) = _$MonthlySettingStateImpl;

  @override
  bool get showCumulativeBalance;
  @override
  int get startDate;

  /// Create a copy of MonthlySettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlySettingStateImplCopyWith<_$MonthlySettingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
