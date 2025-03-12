// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_loan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddLoanState {
  DateTime? get date => throw _privateConstructorUsedError;
  AsyncValue<List<WalletEntity>> get walletOptions =>
      throw _privateConstructorUsedError;
  LoanType? get type => throw _privateConstructorUsedError;
  WalletEntity? get wallet => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isFormValid => throw _privateConstructorUsedError;
  FormzSubmissionStatus? get submissionStatus =>
      throw _privateConstructorUsedError;

  /// Create a copy of AddLoanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddLoanStateCopyWith<AddLoanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddLoanStateCopyWith<$Res> {
  factory $AddLoanStateCopyWith(
          AddLoanState value, $Res Function(AddLoanState) then) =
      _$AddLoanStateCopyWithImpl<$Res, AddLoanState>;
  @useResult
  $Res call(
      {DateTime? date,
      AsyncValue<List<WalletEntity>> walletOptions,
      LoanType? type,
      WalletEntity? wallet,
      String name,
      int amount,
      String description,
      bool isFormValid,
      FormzSubmissionStatus? submissionStatus});

  $WalletEntityCopyWith<$Res>? get wallet;
}

/// @nodoc
class _$AddLoanStateCopyWithImpl<$Res, $Val extends AddLoanState>
    implements $AddLoanStateCopyWith<$Res> {
  _$AddLoanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddLoanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? walletOptions = null,
    Object? type = freezed,
    Object? wallet = freezed,
    Object? name = null,
    Object? amount = null,
    Object? description = null,
    Object? isFormValid = null,
    Object? submissionStatus = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      walletOptions: null == walletOptions
          ? _value.walletOptions
          : walletOptions // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<WalletEntity>>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LoanType?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletEntity?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of AddLoanState
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
abstract class _$$AddLoanStateImplCopyWith<$Res>
    implements $AddLoanStateCopyWith<$Res> {
  factory _$$AddLoanStateImplCopyWith(
          _$AddLoanStateImpl value, $Res Function(_$AddLoanStateImpl) then) =
      __$$AddLoanStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? date,
      AsyncValue<List<WalletEntity>> walletOptions,
      LoanType? type,
      WalletEntity? wallet,
      String name,
      int amount,
      String description,
      bool isFormValid,
      FormzSubmissionStatus? submissionStatus});

  @override
  $WalletEntityCopyWith<$Res>? get wallet;
}

/// @nodoc
class __$$AddLoanStateImplCopyWithImpl<$Res>
    extends _$AddLoanStateCopyWithImpl<$Res, _$AddLoanStateImpl>
    implements _$$AddLoanStateImplCopyWith<$Res> {
  __$$AddLoanStateImplCopyWithImpl(
      _$AddLoanStateImpl _value, $Res Function(_$AddLoanStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddLoanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? walletOptions = null,
    Object? type = freezed,
    Object? wallet = freezed,
    Object? name = null,
    Object? amount = null,
    Object? description = null,
    Object? isFormValid = null,
    Object? submissionStatus = freezed,
  }) {
    return _then(_$AddLoanStateImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      walletOptions: null == walletOptions
          ? _value.walletOptions
          : walletOptions // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<WalletEntity>>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LoanType?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletEntity?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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

class _$AddLoanStateImpl with DiagnosticableTreeMixin implements _AddLoanState {
  const _$AddLoanStateImpl(
      {this.date = null,
      this.walletOptions = const AsyncLoading<List<WalletEntity>>(),
      this.type = null,
      this.wallet = null,
      this.name = '',
      this.amount = 0,
      this.description = '',
      this.isFormValid = false,
      this.submissionStatus = FormzSubmissionStatus.initial});

  @override
  @JsonKey()
  final DateTime? date;
  @override
  @JsonKey()
  final AsyncValue<List<WalletEntity>> walletOptions;
  @override
  @JsonKey()
  final LoanType? type;
  @override
  @JsonKey()
  final WalletEntity? wallet;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int amount;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final bool isFormValid;
  @override
  @JsonKey()
  final FormzSubmissionStatus? submissionStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddLoanState(date: $date, walletOptions: $walletOptions, type: $type, wallet: $wallet, name: $name, amount: $amount, description: $description, isFormValid: $isFormValid, submissionStatus: $submissionStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddLoanState'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('walletOptions', walletOptions))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('wallet', wallet))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('isFormValid', isFormValid))
      ..add(DiagnosticsProperty('submissionStatus', submissionStatus));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddLoanStateImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.walletOptions, walletOptions) ||
                other.walletOptions == walletOptions) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid) &&
            (identical(other.submissionStatus, submissionStatus) ||
                other.submissionStatus == submissionStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, walletOptions, type,
      wallet, name, amount, description, isFormValid, submissionStatus);

  /// Create a copy of AddLoanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddLoanStateImplCopyWith<_$AddLoanStateImpl> get copyWith =>
      __$$AddLoanStateImplCopyWithImpl<_$AddLoanStateImpl>(this, _$identity);
}

abstract class _AddLoanState implements AddLoanState {
  const factory _AddLoanState(
      {final DateTime? date,
      final AsyncValue<List<WalletEntity>> walletOptions,
      final LoanType? type,
      final WalletEntity? wallet,
      final String name,
      final int amount,
      final String description,
      final bool isFormValid,
      final FormzSubmissionStatus? submissionStatus}) = _$AddLoanStateImpl;

  @override
  DateTime? get date;
  @override
  AsyncValue<List<WalletEntity>> get walletOptions;
  @override
  LoanType? get type;
  @override
  WalletEntity? get wallet;
  @override
  String get name;
  @override
  int get amount;
  @override
  String get description;
  @override
  bool get isFormValid;
  @override
  FormzSubmissionStatus? get submissionStatus;

  /// Create a copy of AddLoanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddLoanStateImplCopyWith<_$AddLoanStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
