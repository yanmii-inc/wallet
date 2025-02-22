// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_balance_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MonthlyBalanceEntity {
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  int get totalExpense => throw _privateConstructorUsedError;
  int get totalIncome => throw _privateConstructorUsedError;
  int get monthlyBalance => throw _privateConstructorUsedError;
  int get runningBalance => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyBalanceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyBalanceEntityCopyWith<MonthlyBalanceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyBalanceEntityCopyWith<$Res> {
  factory $MonthlyBalanceEntityCopyWith(MonthlyBalanceEntity value,
          $Res Function(MonthlyBalanceEntity) then) =
      _$MonthlyBalanceEntityCopyWithImpl<$Res, MonthlyBalanceEntity>;
  @useResult
  $Res call(
      {DateTime startDate,
      DateTime endDate,
      int totalExpense,
      int totalIncome,
      int monthlyBalance,
      int runningBalance});
}

/// @nodoc
class _$MonthlyBalanceEntityCopyWithImpl<$Res,
        $Val extends MonthlyBalanceEntity>
    implements $MonthlyBalanceEntityCopyWith<$Res> {
  _$MonthlyBalanceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyBalanceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? totalExpense = null,
    Object? totalIncome = null,
    Object? monthlyBalance = null,
    Object? runningBalance = null,
  }) {
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as int,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyBalance: null == monthlyBalance
          ? _value.monthlyBalance
          : monthlyBalance // ignore: cast_nullable_to_non_nullable
              as int,
      runningBalance: null == runningBalance
          ? _value.runningBalance
          : runningBalance // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyBalanceEntityImplCopyWith<$Res>
    implements $MonthlyBalanceEntityCopyWith<$Res> {
  factory _$$MonthlyBalanceEntityImplCopyWith(_$MonthlyBalanceEntityImpl value,
          $Res Function(_$MonthlyBalanceEntityImpl) then) =
      __$$MonthlyBalanceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime startDate,
      DateTime endDate,
      int totalExpense,
      int totalIncome,
      int monthlyBalance,
      int runningBalance});
}

/// @nodoc
class __$$MonthlyBalanceEntityImplCopyWithImpl<$Res>
    extends _$MonthlyBalanceEntityCopyWithImpl<$Res, _$MonthlyBalanceEntityImpl>
    implements _$$MonthlyBalanceEntityImplCopyWith<$Res> {
  __$$MonthlyBalanceEntityImplCopyWithImpl(_$MonthlyBalanceEntityImpl _value,
      $Res Function(_$MonthlyBalanceEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlyBalanceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? totalExpense = null,
    Object? totalIncome = null,
    Object? monthlyBalance = null,
    Object? runningBalance = null,
  }) {
    return _then(_$MonthlyBalanceEntityImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as int,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyBalance: null == monthlyBalance
          ? _value.monthlyBalance
          : monthlyBalance // ignore: cast_nullable_to_non_nullable
              as int,
      runningBalance: null == runningBalance
          ? _value.runningBalance
          : runningBalance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MonthlyBalanceEntityImpl implements _MonthlyBalanceEntity {
  const _$MonthlyBalanceEntityImpl(
      {required this.startDate,
      required this.endDate,
      required this.totalExpense,
      required this.totalIncome,
      required this.monthlyBalance,
      required this.runningBalance});

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final int totalExpense;
  @override
  final int totalIncome;
  @override
  final int monthlyBalance;
  @override
  final int runningBalance;

  @override
  String toString() {
    return 'MonthlyBalanceEntity(startDate: $startDate, endDate: $endDate, totalExpense: $totalExpense, totalIncome: $totalIncome, monthlyBalance: $monthlyBalance, runningBalance: $runningBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyBalanceEntityImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.monthlyBalance, monthlyBalance) ||
                other.monthlyBalance == monthlyBalance) &&
            (identical(other.runningBalance, runningBalance) ||
                other.runningBalance == runningBalance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate, totalExpense,
      totalIncome, monthlyBalance, runningBalance);

  /// Create a copy of MonthlyBalanceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyBalanceEntityImplCopyWith<_$MonthlyBalanceEntityImpl>
      get copyWith =>
          __$$MonthlyBalanceEntityImplCopyWithImpl<_$MonthlyBalanceEntityImpl>(
              this, _$identity);
}

abstract class _MonthlyBalanceEntity implements MonthlyBalanceEntity {
  const factory _MonthlyBalanceEntity(
      {required final DateTime startDate,
      required final DateTime endDate,
      required final int totalExpense,
      required final int totalIncome,
      required final int monthlyBalance,
      required final int runningBalance}) = _$MonthlyBalanceEntityImpl;

  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  int get totalExpense;
  @override
  int get totalIncome;
  @override
  int get monthlyBalance;
  @override
  int get runningBalance;

  /// Create a copy of MonthlyBalanceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyBalanceEntityImplCopyWith<_$MonthlyBalanceEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
