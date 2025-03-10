// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SummaryViewState {
  AsyncValue<int> get monthlyBalance => throw _privateConstructorUsedError;
  AsyncValue<int> get totalExpense => throw _privateConstructorUsedError;
  AsyncValue<int> get totalIncome => throw _privateConstructorUsedError;

  /// Create a copy of SummaryViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SummaryViewStateCopyWith<SummaryViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryViewStateCopyWith<$Res> {
  factory $SummaryViewStateCopyWith(
          SummaryViewState value, $Res Function(SummaryViewState) then) =
      _$SummaryViewStateCopyWithImpl<$Res, SummaryViewState>;
  @useResult
  $Res call(
      {AsyncValue<int> monthlyBalance,
      AsyncValue<int> totalExpense,
      AsyncValue<int> totalIncome});
}

/// @nodoc
class _$SummaryViewStateCopyWithImpl<$Res, $Val extends SummaryViewState>
    implements $SummaryViewStateCopyWith<$Res> {
  _$SummaryViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SummaryViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthlyBalance = null,
    Object? totalExpense = null,
    Object? totalIncome = null,
  }) {
    return _then(_value.copyWith(
      monthlyBalance: null == monthlyBalance
          ? _value.monthlyBalance
          : monthlyBalance // ignore: cast_nullable_to_non_nullable
              as AsyncValue<int>,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as AsyncValue<int>,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as AsyncValue<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SummaryViewStateImplCopyWith<$Res>
    implements $SummaryViewStateCopyWith<$Res> {
  factory _$$SummaryViewStateImplCopyWith(_$SummaryViewStateImpl value,
          $Res Function(_$SummaryViewStateImpl) then) =
      __$$SummaryViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<int> monthlyBalance,
      AsyncValue<int> totalExpense,
      AsyncValue<int> totalIncome});
}

/// @nodoc
class __$$SummaryViewStateImplCopyWithImpl<$Res>
    extends _$SummaryViewStateCopyWithImpl<$Res, _$SummaryViewStateImpl>
    implements _$$SummaryViewStateImplCopyWith<$Res> {
  __$$SummaryViewStateImplCopyWithImpl(_$SummaryViewStateImpl _value,
      $Res Function(_$SummaryViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SummaryViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthlyBalance = null,
    Object? totalExpense = null,
    Object? totalIncome = null,
  }) {
    return _then(_$SummaryViewStateImpl(
      monthlyBalance: null == monthlyBalance
          ? _value.monthlyBalance
          : monthlyBalance // ignore: cast_nullable_to_non_nullable
              as AsyncValue<int>,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as AsyncValue<int>,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as AsyncValue<int>,
    ));
  }
}

/// @nodoc

class _$SummaryViewStateImpl implements _SummaryViewState {
  const _$SummaryViewStateImpl(
      {required this.monthlyBalance,
      required this.totalExpense,
      required this.totalIncome});

  @override
  final AsyncValue<int> monthlyBalance;
  @override
  final AsyncValue<int> totalExpense;
  @override
  final AsyncValue<int> totalIncome;

  @override
  String toString() {
    return 'SummaryViewState(monthlyBalance: $monthlyBalance, totalExpense: $totalExpense, totalIncome: $totalIncome)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryViewStateImpl &&
            (identical(other.monthlyBalance, monthlyBalance) ||
                other.monthlyBalance == monthlyBalance) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, monthlyBalance, totalExpense, totalIncome);

  /// Create a copy of SummaryViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryViewStateImplCopyWith<_$SummaryViewStateImpl> get copyWith =>
      __$$SummaryViewStateImplCopyWithImpl<_$SummaryViewStateImpl>(
          this, _$identity);
}

abstract class _SummaryViewState implements SummaryViewState {
  const factory _SummaryViewState(
      {required final AsyncValue<int> monthlyBalance,
      required final AsyncValue<int> totalExpense,
      required final AsyncValue<int> totalIncome}) = _$SummaryViewStateImpl;

  @override
  AsyncValue<int> get monthlyBalance;
  @override
  AsyncValue<int> get totalExpense;
  @override
  AsyncValue<int> get totalIncome;

  /// Create a copy of SummaryViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryViewStateImplCopyWith<_$SummaryViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
