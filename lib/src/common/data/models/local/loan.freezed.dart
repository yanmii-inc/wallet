// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Loan _$LoanFromJson(Map<String, dynamic> json) {
  return _Loan.fromJson(json);
}

/// @nodoc
mixin _$Loan {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeIfNull: false)
  Wallet? get wallet => throw _privateConstructorUsedError;
  int? get walletId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this Loan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Loan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoanCopyWith<Loan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanCopyWith<$Res> {
  factory $LoanCopyWith(Loan value, $Res Function(Loan) then) =
      _$LoanCopyWithImpl<$Res, Loan>;
  @useResult
  $Res call(
      {String id,
      String name,
      double amount,
      DateTime date,
      @JsonKey(includeToJson: false, includeIfNull: false) Wallet? wallet,
      int? walletId,
      String? description});

  $WalletCopyWith<$Res>? get wallet;
}

/// @nodoc
class _$LoanCopyWithImpl<$Res, $Val extends Loan>
    implements $LoanCopyWith<$Res> {
  _$LoanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Loan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? date = null,
    Object? wallet = freezed,
    Object? walletId = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
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

  /// Create a copy of Loan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletCopyWith<$Res>? get wallet {
    if (_value.wallet == null) {
      return null;
    }

    return $WalletCopyWith<$Res>(_value.wallet!, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoanImplCopyWith<$Res> implements $LoanCopyWith<$Res> {
  factory _$$LoanImplCopyWith(
          _$LoanImpl value, $Res Function(_$LoanImpl) then) =
      __$$LoanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double amount,
      DateTime date,
      @JsonKey(includeToJson: false, includeIfNull: false) Wallet? wallet,
      int? walletId,
      String? description});

  @override
  $WalletCopyWith<$Res>? get wallet;
}

/// @nodoc
class __$$LoanImplCopyWithImpl<$Res>
    extends _$LoanCopyWithImpl<$Res, _$LoanImpl>
    implements _$$LoanImplCopyWith<$Res> {
  __$$LoanImplCopyWithImpl(_$LoanImpl _value, $Res Function(_$LoanImpl) _then)
      : super(_value, _then);

  /// Create a copy of Loan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? date = null,
    Object? wallet = freezed,
    Object? walletId = freezed,
    Object? description = freezed,
  }) {
    return _then(_$LoanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
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
@JsonSerializable()
class _$LoanImpl implements _Loan {
  const _$LoanImpl(
      {required this.id,
      required this.name,
      required this.amount,
      required this.date,
      @JsonKey(includeToJson: false, includeIfNull: false) this.wallet = null,
      this.walletId = null,
      this.description = null});

  factory _$LoanImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoanImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double amount;
  @override
  final DateTime date;
  @override
  @JsonKey(includeToJson: false, includeIfNull: false)
  final Wallet? wallet;
  @override
  @JsonKey()
  final int? walletId;
  @override
  @JsonKey()
  final String? description;

  @override
  String toString() {
    return 'Loan(id: $id, name: $name, amount: $amount, date: $date, wallet: $wallet, walletId: $walletId, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, amount, date, wallet, walletId, description);

  /// Create a copy of Loan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoanImplCopyWith<_$LoanImpl> get copyWith =>
      __$$LoanImplCopyWithImpl<_$LoanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoanImplToJson(
      this,
    );
  }
}

abstract class _Loan implements Loan {
  const factory _Loan(
      {required final String id,
      required final String name,
      required final double amount,
      required final DateTime date,
      @JsonKey(includeToJson: false, includeIfNull: false) final Wallet? wallet,
      final int? walletId,
      final String? description}) = _$LoanImpl;

  factory _Loan.fromJson(Map<String, dynamic> json) = _$LoanImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get amount;
  @override
  DateTime get date;
  @override
  @JsonKey(includeToJson: false, includeIfNull: false)
  Wallet? get wallet;
  @override
  int? get walletId;
  @override
  String? get description;

  /// Create a copy of Loan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoanImplCopyWith<_$LoanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
