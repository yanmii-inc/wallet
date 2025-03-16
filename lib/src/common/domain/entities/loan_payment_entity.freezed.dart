// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_payment_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoanPaymentEntity {
  String get date => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  int get loanId => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  int? get walletId => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Create a copy of LoanPaymentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoanPaymentEntityCopyWith<LoanPaymentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanPaymentEntityCopyWith<$Res> {
  factory $LoanPaymentEntityCopyWith(
          LoanPaymentEntity value, $Res Function(LoanPaymentEntity) then) =
      _$LoanPaymentEntityCopyWithImpl<$Res, LoanPaymentEntity>;
  @useResult
  $Res call(
      {String date,
      int amount,
      int loanId,
      int? id,
      int? walletId,
      String? note});
}

/// @nodoc
class _$LoanPaymentEntityCopyWithImpl<$Res, $Val extends LoanPaymentEntity>
    implements $LoanPaymentEntityCopyWith<$Res> {
  _$LoanPaymentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoanPaymentEntity
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
abstract class _$$LoanPaymentEntityImplCopyWith<$Res>
    implements $LoanPaymentEntityCopyWith<$Res> {
  factory _$$LoanPaymentEntityImplCopyWith(_$LoanPaymentEntityImpl value,
          $Res Function(_$LoanPaymentEntityImpl) then) =
      __$$LoanPaymentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      int amount,
      int loanId,
      int? id,
      int? walletId,
      String? note});
}

/// @nodoc
class __$$LoanPaymentEntityImplCopyWithImpl<$Res>
    extends _$LoanPaymentEntityCopyWithImpl<$Res, _$LoanPaymentEntityImpl>
    implements _$$LoanPaymentEntityImplCopyWith<$Res> {
  __$$LoanPaymentEntityImplCopyWithImpl(_$LoanPaymentEntityImpl _value,
      $Res Function(_$LoanPaymentEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoanPaymentEntity
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
    return _then(_$LoanPaymentEntityImpl(
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

class _$LoanPaymentEntityImpl implements _LoanPaymentEntity {
  const _$LoanPaymentEntityImpl(
      {required this.date,
      required this.amount,
      required this.loanId,
      this.id,
      this.walletId,
      this.note});

  @override
  final String date;
  @override
  final int amount;
  @override
  final int loanId;
  @override
  final int? id;
  @override
  final int? walletId;
  @override
  final String? note;

  @override
  String toString() {
    return 'LoanPaymentEntity(date: $date, amount: $amount, loanId: $loanId, id: $id, walletId: $walletId, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoanPaymentEntityImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.loanId, loanId) || other.loanId == loanId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, date, amount, loanId, id, walletId, note);

  /// Create a copy of LoanPaymentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoanPaymentEntityImplCopyWith<_$LoanPaymentEntityImpl> get copyWith =>
      __$$LoanPaymentEntityImplCopyWithImpl<_$LoanPaymentEntityImpl>(
          this, _$identity);
}

abstract class _LoanPaymentEntity implements LoanPaymentEntity {
  const factory _LoanPaymentEntity(
      {required final String date,
      required final int amount,
      required final int loanId,
      final int? id,
      final int? walletId,
      final String? note}) = _$LoanPaymentEntityImpl;

  @override
  String get date;
  @override
  int get amount;
  @override
  int get loanId;
  @override
  int? get id;
  @override
  int? get walletId;
  @override
  String? get note;

  /// Create a copy of LoanPaymentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoanPaymentEntityImplCopyWith<_$LoanPaymentEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
