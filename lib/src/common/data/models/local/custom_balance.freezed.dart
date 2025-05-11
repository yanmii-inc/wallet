// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomBalance _$CustomBalanceFromJson(Map<String, dynamic> json) {
  return _CustomBalance.fromJson(json);
}

/// @nodoc
mixin _$CustomBalance {
  @JsonKey(name: 'start_date')
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  DateTime get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_expense')
  int get totalExpense => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_income')
  int get totalIncome => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance')
  int get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;

  /// Serializes this CustomBalance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomBalanceCopyWith<CustomBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomBalanceCopyWith<$Res> {
  factory $CustomBalanceCopyWith(
          CustomBalance value, $Res Function(CustomBalance) then) =
      _$CustomBalanceCopyWithImpl<$Res, CustomBalance>;
  @useResult
  $Res call(
      {@JsonKey(name: 'start_date') DateTime startDate,
      @JsonKey(name: 'end_date') DateTime endDate,
      @JsonKey(name: 'total_expense') int totalExpense,
      @JsonKey(name: 'total_income') int totalIncome,
      @JsonKey(name: 'balance') int balance,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title});
}

/// @nodoc
class _$CustomBalanceCopyWithImpl<$Res, $Val extends CustomBalance>
    implements $CustomBalanceCopyWith<$Res> {
  _$CustomBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? totalExpense = null,
    Object? totalIncome = null,
    Object? balance = null,
    Object? id = freezed,
    Object? title = freezed,
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
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomBalanceImplCopyWith<$Res>
    implements $CustomBalanceCopyWith<$Res> {
  factory _$$CustomBalanceImplCopyWith(
          _$CustomBalanceImpl value, $Res Function(_$CustomBalanceImpl) then) =
      __$$CustomBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'start_date') DateTime startDate,
      @JsonKey(name: 'end_date') DateTime endDate,
      @JsonKey(name: 'total_expense') int totalExpense,
      @JsonKey(name: 'total_income') int totalIncome,
      @JsonKey(name: 'balance') int balance,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title});
}

/// @nodoc
class __$$CustomBalanceImplCopyWithImpl<$Res>
    extends _$CustomBalanceCopyWithImpl<$Res, _$CustomBalanceImpl>
    implements _$$CustomBalanceImplCopyWith<$Res> {
  __$$CustomBalanceImplCopyWithImpl(
      _$CustomBalanceImpl _value, $Res Function(_$CustomBalanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? totalExpense = null,
    Object? totalIncome = null,
    Object? balance = null,
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$CustomBalanceImpl(
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
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomBalanceImpl implements _CustomBalance {
  const _$CustomBalanceImpl(
      {@JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') required this.endDate,
      @JsonKey(name: 'total_expense') required this.totalExpense,
      @JsonKey(name: 'total_income') required this.totalIncome,
      @JsonKey(name: 'balance') required this.balance,
      @JsonKey(name: 'id') this.id = null,
      @JsonKey(name: 'title') this.title = null});

  factory _$CustomBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomBalanceImplFromJson(json);

  @override
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @override
  @JsonKey(name: 'end_date')
  final DateTime endDate;
  @override
  @JsonKey(name: 'total_expense')
  final int totalExpense;
  @override
  @JsonKey(name: 'total_income')
  final int totalIncome;
  @override
  @JsonKey(name: 'balance')
  final int balance;
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;

  @override
  String toString() {
    return 'CustomBalance(startDate: $startDate, endDate: $endDate, totalExpense: $totalExpense, totalIncome: $totalIncome, balance: $balance, id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomBalanceImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate, totalExpense,
      totalIncome, balance, id, title);

  /// Create a copy of CustomBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomBalanceImplCopyWith<_$CustomBalanceImpl> get copyWith =>
      __$$CustomBalanceImplCopyWithImpl<_$CustomBalanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomBalanceImplToJson(
      this,
    );
  }
}

abstract class _CustomBalance implements CustomBalance {
  const factory _CustomBalance(
      {@JsonKey(name: 'start_date') required final DateTime startDate,
      @JsonKey(name: 'end_date') required final DateTime endDate,
      @JsonKey(name: 'total_expense') required final int totalExpense,
      @JsonKey(name: 'total_income') required final int totalIncome,
      @JsonKey(name: 'balance') required final int balance,
      @JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'title') final String? title}) = _$CustomBalanceImpl;

  factory _CustomBalance.fromJson(Map<String, dynamic> json) =
      _$CustomBalanceImpl.fromJson;

  @override
  @JsonKey(name: 'start_date')
  DateTime get startDate;
  @override
  @JsonKey(name: 'end_date')
  DateTime get endDate;
  @override
  @JsonKey(name: 'total_expense')
  int get totalExpense;
  @override
  @JsonKey(name: 'total_income')
  int get totalIncome;
  @override
  @JsonKey(name: 'balance')
  int get balance;
  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;

  /// Create a copy of CustomBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomBalanceImplCopyWith<_$CustomBalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
