// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoanEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  LoanType get type => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  WalletEntity? get wallet => throw _privateConstructorUsedError;
  int? get walletId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Create a copy of LoanEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoanEntityCopyWith<LoanEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanEntityCopyWith<$Res> {
  factory $LoanEntityCopyWith(
          LoanEntity value, $Res Function(LoanEntity) then) =
      _$LoanEntityCopyWithImpl<$Res, LoanEntity>;
  @useResult
  $Res call(
      {int id,
      String name,
      int amount,
      LoanType type,
      DateTime date,
      WalletEntity? wallet,
      int? walletId,
      String? description});

  $WalletEntityCopyWith<$Res>? get wallet;
}

/// @nodoc
class _$LoanEntityCopyWithImpl<$Res, $Val extends LoanEntity>
    implements $LoanEntityCopyWith<$Res> {
  _$LoanEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoanEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? type = null,
    Object? date = null,
    Object? wallet = freezed,
    Object? walletId = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LoanType,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletEntity?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of LoanEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletEntityCopyWith<$Res>? get wallet {
    if (_value.wallet == null) {
      return null;
    }

    return $WalletEntityCopyWith<$Res>(_value.wallet!, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoanEntityImplCopyWith<$Res>
    implements $LoanEntityCopyWith<$Res> {
  factory _$$LoanEntityImplCopyWith(
          _$LoanEntityImpl value, $Res Function(_$LoanEntityImpl) then) =
      __$$LoanEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int amount,
      LoanType type,
      DateTime date,
      WalletEntity? wallet,
      int? walletId,
      String? description});

  @override
  $WalletEntityCopyWith<$Res>? get wallet;
}

/// @nodoc
class __$$LoanEntityImplCopyWithImpl<$Res>
    extends _$LoanEntityCopyWithImpl<$Res, _$LoanEntityImpl>
    implements _$$LoanEntityImplCopyWith<$Res> {
  __$$LoanEntityImplCopyWithImpl(
      _$LoanEntityImpl _value, $Res Function(_$LoanEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoanEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? type = null,
    Object? date = null,
    Object? wallet = freezed,
    Object? walletId = freezed,
    Object? description = freezed,
  }) {
    return _then(_$LoanEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LoanType,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletEntity?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoanEntityImpl implements _LoanEntity {
  const _$LoanEntityImpl(
      {required this.id,
      required this.name,
      required this.amount,
      required this.type,
      required this.date,
      this.wallet = null,
      this.walletId = null,
      this.description = null});

  @override
  final int id;
  @override
  final String name;
  @override
  final int amount;
  @override
  final LoanType type;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final WalletEntity? wallet;
  @override
  @JsonKey()
  final int? walletId;
  @override
  @JsonKey()
  final String? description;

  @override
  String toString() {
    return 'LoanEntity(id: $id, name: $name, amount: $amount, type: $type, date: $date, wallet: $wallet, walletId: $walletId, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoanEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, amount, type, date, wallet, walletId, description);

  /// Create a copy of LoanEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoanEntityImplCopyWith<_$LoanEntityImpl> get copyWith =>
      __$$LoanEntityImplCopyWithImpl<_$LoanEntityImpl>(this, _$identity);
}

abstract class _LoanEntity implements LoanEntity {
  const factory _LoanEntity(
      {required final int id,
      required final String name,
      required final int amount,
      required final LoanType type,
      required final DateTime date,
      final WalletEntity? wallet,
      final int? walletId,
      final String? description}) = _$LoanEntityImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  int get amount;
  @override
  LoanType get type;
  @override
  DateTime get date;
  @override
  WalletEntity? get wallet;
  @override
  int? get walletId;
  @override
  String? get description;

  /// Create a copy of LoanEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoanEntityImplCopyWith<_$LoanEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
