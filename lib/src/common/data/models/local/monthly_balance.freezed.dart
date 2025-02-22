// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MonthlyBalance _$MonthlyBalanceFromJson(Map<String, dynamic> json) {
  return _MonthlyBalance.fromJson(json);
}

/// @nodoc
mixin _$MonthlyBalance {
  @JsonKey(name: 'year')
  int? get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'month')
  int? get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_expense')
  double? get totalExpense => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_income')
  double? get totalIncome => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_balance')
  double? get monthlyBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'running_balance')
  double? get runningBalance => throw _privateConstructorUsedError;

  /// Serializes this MonthlyBalance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyBalanceCopyWith<MonthlyBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyBalanceCopyWith<$Res> {
  factory $MonthlyBalanceCopyWith(
          MonthlyBalance value, $Res Function(MonthlyBalance) then) =
      _$MonthlyBalanceCopyWithImpl<$Res, MonthlyBalance>;
  @useResult
  $Res call(
      {@JsonKey(name: 'year') int? year,
      @JsonKey(name: 'month') int? month,
      @JsonKey(name: 'total_expense') double? totalExpense,
      @JsonKey(name: 'total_income') double? totalIncome,
      @JsonKey(name: 'monthly_balance') double? monthlyBalance,
      @JsonKey(name: 'running_balance') double? runningBalance});
}

/// @nodoc
class _$MonthlyBalanceCopyWithImpl<$Res, $Val extends MonthlyBalance>
    implements $MonthlyBalanceCopyWith<$Res> {
  _$MonthlyBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = freezed,
    Object? month = freezed,
    Object? totalExpense = freezed,
    Object? totalIncome = freezed,
    Object? monthlyBalance = freezed,
    Object? runningBalance = freezed,
  }) {
    return _then(_value.copyWith(
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      totalExpense: freezed == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double?,
      totalIncome: freezed == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double?,
      monthlyBalance: freezed == monthlyBalance
          ? _value.monthlyBalance
          : monthlyBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      runningBalance: freezed == runningBalance
          ? _value.runningBalance
          : runningBalance // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyBalanceImplCopyWith<$Res>
    implements $MonthlyBalanceCopyWith<$Res> {
  factory _$$MonthlyBalanceImplCopyWith(_$MonthlyBalanceImpl value,
          $Res Function(_$MonthlyBalanceImpl) then) =
      __$$MonthlyBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'year') int? year,
      @JsonKey(name: 'month') int? month,
      @JsonKey(name: 'total_expense') double? totalExpense,
      @JsonKey(name: 'total_income') double? totalIncome,
      @JsonKey(name: 'monthly_balance') double? monthlyBalance,
      @JsonKey(name: 'running_balance') double? runningBalance});
}

/// @nodoc
class __$$MonthlyBalanceImplCopyWithImpl<$Res>
    extends _$MonthlyBalanceCopyWithImpl<$Res, _$MonthlyBalanceImpl>
    implements _$$MonthlyBalanceImplCopyWith<$Res> {
  __$$MonthlyBalanceImplCopyWithImpl(
      _$MonthlyBalanceImpl _value, $Res Function(_$MonthlyBalanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlyBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = freezed,
    Object? month = freezed,
    Object? totalExpense = freezed,
    Object? totalIncome = freezed,
    Object? monthlyBalance = freezed,
    Object? runningBalance = freezed,
  }) {
    return _then(_$MonthlyBalanceImpl(
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      totalExpense: freezed == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double?,
      totalIncome: freezed == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double?,
      monthlyBalance: freezed == monthlyBalance
          ? _value.monthlyBalance
          : monthlyBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      runningBalance: freezed == runningBalance
          ? _value.runningBalance
          : runningBalance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyBalanceImpl implements _MonthlyBalance {
  const _$MonthlyBalanceImpl(
      {@JsonKey(name: 'year') this.year,
      @JsonKey(name: 'month') this.month,
      @JsonKey(name: 'total_expense') this.totalExpense,
      @JsonKey(name: 'total_income') this.totalIncome,
      @JsonKey(name: 'monthly_balance') this.monthlyBalance,
      @JsonKey(name: 'running_balance') this.runningBalance});

  factory _$MonthlyBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyBalanceImplFromJson(json);

  @override
  @JsonKey(name: 'year')
  final int? year;
  @override
  @JsonKey(name: 'month')
  final int? month;
  @override
  @JsonKey(name: 'total_expense')
  final double? totalExpense;
  @override
  @JsonKey(name: 'total_income')
  final double? totalIncome;
  @override
  @JsonKey(name: 'monthly_balance')
  final double? monthlyBalance;
  @override
  @JsonKey(name: 'running_balance')
  final double? runningBalance;

  @override
  String toString() {
    return 'MonthlyBalance(year: $year, month: $month, totalExpense: $totalExpense, totalIncome: $totalIncome, monthlyBalance: $monthlyBalance, runningBalance: $runningBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyBalanceImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.monthlyBalance, monthlyBalance) ||
                other.monthlyBalance == monthlyBalance) &&
            (identical(other.runningBalance, runningBalance) ||
                other.runningBalance == runningBalance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, year, month, totalExpense,
      totalIncome, monthlyBalance, runningBalance);

  /// Create a copy of MonthlyBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyBalanceImplCopyWith<_$MonthlyBalanceImpl> get copyWith =>
      __$$MonthlyBalanceImplCopyWithImpl<_$MonthlyBalanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyBalanceImplToJson(
      this,
    );
  }
}

abstract class _MonthlyBalance implements MonthlyBalance {
  const factory _MonthlyBalance(
          {@JsonKey(name: 'year') final int? year,
          @JsonKey(name: 'month') final int? month,
          @JsonKey(name: 'total_expense') final double? totalExpense,
          @JsonKey(name: 'total_income') final double? totalIncome,
          @JsonKey(name: 'monthly_balance') final double? monthlyBalance,
          @JsonKey(name: 'running_balance') final double? runningBalance}) =
      _$MonthlyBalanceImpl;

  factory _MonthlyBalance.fromJson(Map<String, dynamic> json) =
      _$MonthlyBalanceImpl.fromJson;

  @override
  @JsonKey(name: 'year')
  int? get year;
  @override
  @JsonKey(name: 'month')
  int? get month;
  @override
  @JsonKey(name: 'total_expense')
  double? get totalExpense;
  @override
  @JsonKey(name: 'total_income')
  double? get totalIncome;
  @override
  @JsonKey(name: 'monthly_balance')
  double? get monthlyBalance;
  @override
  @JsonKey(name: 'running_balance')
  double? get runningBalance;

  /// Create a copy of MonthlyBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyBalanceImplCopyWith<_$MonthlyBalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
