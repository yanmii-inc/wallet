// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditPaymentState {
  AsyncValue<LoanPaymentEntity> get payment =>
      throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  AsyncValue<List<WalletEntity>> get walletOptions =>
      throw _privateConstructorUsedError;
  WalletEntity? get wallet => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  bool get isFormValid => throw _privateConstructorUsedError;
  FormzSubmissionStatus? get submissionStatus =>
      throw _privateConstructorUsedError;

  /// Create a copy of EditPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditPaymentStateCopyWith<EditPaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditPaymentStateCopyWith<$Res> {
  factory $EditPaymentStateCopyWith(
          EditPaymentState value, $Res Function(EditPaymentState) then) =
      _$EditPaymentStateCopyWithImpl<$Res, EditPaymentState>;
  @useResult
  $Res call(
      {AsyncValue<LoanPaymentEntity> payment,
      DateTime? date,
      AsyncValue<List<WalletEntity>> walletOptions,
      WalletEntity? wallet,
      int amount,
      String note,
      bool isFormValid,
      FormzSubmissionStatus? submissionStatus});

  $WalletEntityCopyWith<$Res>? get wallet;
}

/// @nodoc
class _$EditPaymentStateCopyWithImpl<$Res, $Val extends EditPaymentState>
    implements $EditPaymentStateCopyWith<$Res> {
  _$EditPaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payment = null,
    Object? date = freezed,
    Object? walletOptions = null,
    Object? wallet = freezed,
    Object? amount = null,
    Object? note = null,
    Object? isFormValid = null,
    Object? submissionStatus = freezed,
  }) {
    return _then(_value.copyWith(
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as AsyncValue<LoanPaymentEntity>,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      walletOptions: null == walletOptions
          ? _value.walletOptions
          : walletOptions // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<WalletEntity>>,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletEntity?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      isFormValid: null == isFormValid
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
      submissionStatus: freezed == submissionStatus
          ? _value.submissionStatus
          : submissionStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus?,
    ) as $Val);
  }

  /// Create a copy of EditPaymentState
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
abstract class _$$EditPaymentStateImplCopyWith<$Res>
    implements $EditPaymentStateCopyWith<$Res> {
  factory _$$EditPaymentStateImplCopyWith(_$EditPaymentStateImpl value,
          $Res Function(_$EditPaymentStateImpl) then) =
      __$$EditPaymentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<LoanPaymentEntity> payment,
      DateTime? date,
      AsyncValue<List<WalletEntity>> walletOptions,
      WalletEntity? wallet,
      int amount,
      String note,
      bool isFormValid,
      FormzSubmissionStatus? submissionStatus});

  @override
  $WalletEntityCopyWith<$Res>? get wallet;
}

/// @nodoc
class __$$EditPaymentStateImplCopyWithImpl<$Res>
    extends _$EditPaymentStateCopyWithImpl<$Res, _$EditPaymentStateImpl>
    implements _$$EditPaymentStateImplCopyWith<$Res> {
  __$$EditPaymentStateImplCopyWithImpl(_$EditPaymentStateImpl _value,
      $Res Function(_$EditPaymentStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payment = null,
    Object? date = freezed,
    Object? walletOptions = null,
    Object? wallet = freezed,
    Object? amount = null,
    Object? note = null,
    Object? isFormValid = null,
    Object? submissionStatus = freezed,
  }) {
    return _then(_$EditPaymentStateImpl(
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as AsyncValue<LoanPaymentEntity>,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      walletOptions: null == walletOptions
          ? _value.walletOptions
          : walletOptions // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<WalletEntity>>,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletEntity?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      isFormValid: null == isFormValid
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
      submissionStatus: freezed == submissionStatus
          ? _value.submissionStatus
          : submissionStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus?,
    ));
  }
}

/// @nodoc

class _$EditPaymentStateImpl
    with DiagnosticableTreeMixin
    implements _EditPaymentState {
  const _$EditPaymentStateImpl(
      {this.payment = const AsyncLoading<LoanPaymentEntity>(),
      this.date = null,
      this.walletOptions = const AsyncLoading<List<WalletEntity>>(),
      this.wallet = null,
      this.amount = 0,
      this.note = '',
      this.isFormValid = false,
      this.submissionStatus = FormzSubmissionStatus.initial});

  @override
  @JsonKey()
  final AsyncValue<LoanPaymentEntity> payment;
  @override
  @JsonKey()
  final DateTime? date;
  @override
  @JsonKey()
  final AsyncValue<List<WalletEntity>> walletOptions;
  @override
  @JsonKey()
  final WalletEntity? wallet;
  @override
  @JsonKey()
  final int amount;
  @override
  @JsonKey()
  final String note;
  @override
  @JsonKey()
  final bool isFormValid;
  @override
  @JsonKey()
  final FormzSubmissionStatus? submissionStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditPaymentState(payment: $payment, date: $date, walletOptions: $walletOptions, wallet: $wallet, amount: $amount, note: $note, isFormValid: $isFormValid, submissionStatus: $submissionStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditPaymentState'))
      ..add(DiagnosticsProperty('payment', payment))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('walletOptions', walletOptions))
      ..add(DiagnosticsProperty('wallet', wallet))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('isFormValid', isFormValid))
      ..add(DiagnosticsProperty('submissionStatus', submissionStatus));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditPaymentStateImpl &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.walletOptions, walletOptions) ||
                other.walletOptions == walletOptions) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid) &&
            (identical(other.submissionStatus, submissionStatus) ||
                other.submissionStatus == submissionStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payment, date, walletOptions,
      wallet, amount, note, isFormValid, submissionStatus);

  /// Create a copy of EditPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditPaymentStateImplCopyWith<_$EditPaymentStateImpl> get copyWith =>
      __$$EditPaymentStateImplCopyWithImpl<_$EditPaymentStateImpl>(
          this, _$identity);
}

abstract class _EditPaymentState implements EditPaymentState {
  const factory _EditPaymentState(
      {final AsyncValue<LoanPaymentEntity> payment,
      final DateTime? date,
      final AsyncValue<List<WalletEntity>> walletOptions,
      final WalletEntity? wallet,
      final int amount,
      final String note,
      final bool isFormValid,
      final FormzSubmissionStatus? submissionStatus}) = _$EditPaymentStateImpl;

  @override
  AsyncValue<LoanPaymentEntity> get payment;
  @override
  DateTime? get date;
  @override
  AsyncValue<List<WalletEntity>> get walletOptions;
  @override
  WalletEntity? get wallet;
  @override
  int get amount;
  @override
  String get note;
  @override
  bool get isFormValid;
  @override
  FormzSubmissionStatus? get submissionStatus;

  /// Create a copy of EditPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditPaymentStateImplCopyWith<_$EditPaymentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
