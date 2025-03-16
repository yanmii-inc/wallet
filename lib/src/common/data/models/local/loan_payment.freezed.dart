// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoanPayment _$LoanPaymentFromJson(Map<String, dynamic> json) {
  return _LoanPayment.fromJson(json);
}

/// @nodoc
mixin _$LoanPayment {
  String get date => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'loan_id')
  int get loanId => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'wallet_id')
  int? get walletId => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this LoanPayment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoanPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoanPaymentCopyWith<LoanPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanPaymentCopyWith<$Res> {
  factory $LoanPaymentCopyWith(
          LoanPayment value, $Res Function(LoanPayment) then) =
      _$LoanPaymentCopyWithImpl<$Res, LoanPayment>;
  @useResult
  $Res call(
      {String date,
      int amount,
      @JsonKey(name: 'loan_id') int loanId,
      int? id,
      @JsonKey(name: 'wallet_id') int? walletId,
      String? note});
}

/// @nodoc
class _$LoanPaymentCopyWithImpl<$Res, $Val extends LoanPayment>
    implements $LoanPaymentCopyWith<$Res> {
  _$LoanPaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoanPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? amount = null,
    Object? loanId = null,
    Object? id = freezed,
    Object? walletId = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      loanId: null == loanId
          ? _value.loanId
          : loanId // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoanPaymentImplCopyWith<$Res>
    implements $LoanPaymentCopyWith<$Res> {
  factory _$$LoanPaymentImplCopyWith(
          _$LoanPaymentImpl value, $Res Function(_$LoanPaymentImpl) then) =
      __$$LoanPaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      int amount,
      @JsonKey(name: 'loan_id') int loanId,
      int? id,
      @JsonKey(name: 'wallet_id') int? walletId,
      String? note});
}

/// @nodoc
class __$$LoanPaymentImplCopyWithImpl<$Res>
    extends _$LoanPaymentCopyWithImpl<$Res, _$LoanPaymentImpl>
    implements _$$LoanPaymentImplCopyWith<$Res> {
  __$$LoanPaymentImplCopyWithImpl(
      _$LoanPaymentImpl _value, $Res Function(_$LoanPaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoanPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? amount = null,
    Object? loanId = null,
    Object? id = freezed,
    Object? walletId = freezed,
    Object? note = freezed,
  }) {
    return _then(_$LoanPaymentImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      loanId: null == loanId
          ? _value.loanId
          : loanId // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoanPaymentImpl implements _LoanPayment {
  const _$LoanPaymentImpl(
      {required this.date,
      required this.amount,
      @JsonKey(name: 'loan_id') required this.loanId,
      this.id,
      @JsonKey(name: 'wallet_id') this.walletId,
      this.note});

  factory _$LoanPaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoanPaymentImplFromJson(json);

  @override
  final String date;
  @override
  final int amount;
  @override
  @JsonKey(name: 'loan_id')
  final int loanId;
  @override
  final int? id;
  @override
  @JsonKey(name: 'wallet_id')
  final int? walletId;
  @override
  final String? note;

  @override
  String toString() {
    return 'LoanPayment(date: $date, amount: $amount, loanId: $loanId, id: $id, walletId: $walletId, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoanPaymentImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.loanId, loanId) || other.loanId == loanId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, amount, loanId, id, walletId, note);

  /// Create a copy of LoanPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoanPaymentImplCopyWith<_$LoanPaymentImpl> get copyWith =>
      __$$LoanPaymentImplCopyWithImpl<_$LoanPaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoanPaymentImplToJson(
      this,
    );
  }
}

abstract class _LoanPayment implements LoanPayment {
  const factory _LoanPayment(
      {required final String date,
      required final int amount,
      @JsonKey(name: 'loan_id') required final int loanId,
      final int? id,
      @JsonKey(name: 'wallet_id') final int? walletId,
      final String? note}) = _$LoanPaymentImpl;

  factory _LoanPayment.fromJson(Map<String, dynamic> json) =
      _$LoanPaymentImpl.fromJson;

  @override
  String get date;
  @override
  int get amount;
  @override
  @JsonKey(name: 'loan_id')
  int get loanId;
  @override
  int? get id;
  @override
  @JsonKey(name: 'wallet_id')
  int? get walletId;
  @override
  String? get note;

  /// Create a copy of LoanPayment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoanPaymentImplCopyWith<_$LoanPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
