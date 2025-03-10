// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_balance_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomBalanceEntity {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  int get totalExpense => throw _privateConstructorUsedError;
  int get totalIncome => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;

  /// Create a copy of CustomBalanceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomBalanceEntityCopyWith<CustomBalanceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomBalanceEntityCopyWith<$Res> {
  factory $CustomBalanceEntityCopyWith(
          CustomBalanceEntity value, $Res Function(CustomBalanceEntity) then) =
      _$CustomBalanceEntityCopyWithImpl<$Res, CustomBalanceEntity>;
  @useResult
  $Res call(
      {int id,
      String title,
      DateTime startDate,
      DateTime endDate,
      int totalExpense,
      int totalIncome,
      int balance});
}

/// @nodoc
class _$CustomBalanceEntityCopyWithImpl<$Res, $Val extends CustomBalanceEntity>
    implements $CustomBalanceEntityCopyWith<$Res> {
  _$CustomBalanceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomBalanceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? totalExpense = null,
    Object? totalIncome = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomBalanceEntityImplCopyWith<$Res>
    implements $CustomBalanceEntityCopyWith<$Res> {
  factory _$$CustomBalanceEntityImplCopyWith(_$CustomBalanceEntityImpl value,
          $Res Function(_$CustomBalanceEntityImpl) then) =
      __$$CustomBalanceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      DateTime startDate,
      DateTime endDate,
      int totalExpense,
      int totalIncome,
      int balance});
}

/// @nodoc
class __$$CustomBalanceEntityImplCopyWithImpl<$Res>
    extends _$CustomBalanceEntityCopyWithImpl<$Res, _$CustomBalanceEntityImpl>
    implements _$$CustomBalanceEntityImplCopyWith<$Res> {
  __$$CustomBalanceEntityImplCopyWithImpl(_$CustomBalanceEntityImpl _value,
      $Res Function(_$CustomBalanceEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomBalanceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? totalExpense = null,
    Object? totalIncome = null,
    Object? balance = null,
  }) {
    return _then(_$CustomBalanceEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// @nodoc

class _$CustomBalanceEntityImpl implements _CustomBalanceEntity {
  const _$CustomBalanceEntityImpl(
      {required this.id,
      required this.title,
      required this.startDate,
      required this.endDate,
      required this.totalExpense,
      required this.totalIncome,
      required this.balance});

  @override
  final int id;
  @override
  final String title;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final int totalExpense;
  @override
  final int totalIncome;
  @override
  final int balance;

  @override
  String toString() {
    return 'CustomBalanceEntity(id: $id, title: $title, startDate: $startDate, endDate: $endDate, totalExpense: $totalExpense, totalIncome: $totalIncome, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomBalanceEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, startDate, endDate,
      totalExpense, totalIncome, balance);

  /// Create a copy of CustomBalanceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomBalanceEntityImplCopyWith<_$CustomBalanceEntityImpl> get copyWith =>
      __$$CustomBalanceEntityImplCopyWithImpl<_$CustomBalanceEntityImpl>(
          this, _$identity);
}

abstract class _CustomBalanceEntity implements CustomBalanceEntity {
  const factory _CustomBalanceEntity(
      {required final int id,
      required final String title,
      required final DateTime startDate,
      required final DateTime endDate,
      required final int totalExpense,
      required final int totalIncome,
      required final int balance}) = _$CustomBalanceEntityImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  int get totalExpense;
  @override
  int get totalIncome;
  @override
  int get balance;

  /// Create a copy of CustomBalanceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomBalanceEntityImplCopyWith<_$CustomBalanceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
