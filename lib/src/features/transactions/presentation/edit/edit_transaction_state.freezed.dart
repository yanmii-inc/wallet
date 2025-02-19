// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_transaction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditTransactionState {
  DateTime? get date => throw _privateConstructorUsedError;
  AsyncValue<List<WalletEntity>> get walletOptions =>
      throw _privateConstructorUsedError;
  WalletEntity? get wallet => throw _privateConstructorUsedError;
  WalletEntity? get destWallet => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  AsyncValue<List<CategoryEntity>> get categoryOptions =>
      throw _privateConstructorUsedError;
  CategoryEntity? get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  bool get isFormValid => throw _privateConstructorUsedError;
  FormzSubmissionStatus? get submissionStatus =>
      throw _privateConstructorUsedError;

  /// Create a copy of EditTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditTransactionStateCopyWith<EditTransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditTransactionStateCopyWith<$Res> {
  factory $EditTransactionStateCopyWith(EditTransactionState value,
          $Res Function(EditTransactionState) then) =
      _$EditTransactionStateCopyWithImpl<$Res, EditTransactionState>;
  @useResult
  $Res call(
      {DateTime? date,
      AsyncValue<List<WalletEntity>> walletOptions,
      WalletEntity? wallet,
      WalletEntity? destWallet,
      String name,
      int amount,
      AsyncValue<List<CategoryEntity>> categoryOptions,
      CategoryEntity? category,
      String description,
      TransactionType type,
      bool isFormValid,
      FormzSubmissionStatus? submissionStatus});

  $WalletEntityCopyWith<$Res>? get wallet;
  $WalletEntityCopyWith<$Res>? get destWallet;
  $CategoryEntityCopyWith<$Res>? get category;
}

/// @nodoc
class _$EditTransactionStateCopyWithImpl<$Res,
        $Val extends EditTransactionState>
    implements $EditTransactionStateCopyWith<$Res> {
  _$EditTransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? walletOptions = null,
    Object? wallet = freezed,
    Object? destWallet = freezed,
    Object? name = null,
    Object? amount = null,
    Object? categoryOptions = null,
    Object? category = freezed,
    Object? description = null,
    Object? type = null,
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
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletEntity?,
      destWallet: freezed == destWallet
          ? _value.destWallet
          : destWallet // ignore: cast_nullable_to_non_nullable
              as WalletEntity?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      categoryOptions: null == categoryOptions
          ? _value.categoryOptions
          : categoryOptions // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<CategoryEntity>>,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryEntity?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
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

  /// Create a copy of EditTransactionState
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

  /// Create a copy of EditTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletEntityCopyWith<$Res>? get destWallet {
    if (_value.destWallet == null) {
      return null;
    }

    return $WalletEntityCopyWith<$Res>(_value.destWallet!, (value) {
      return _then(_value.copyWith(destWallet: value) as $Val);
    });
  }

  /// Create a copy of EditTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryEntityCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryEntityCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditTransactionStateImplCopyWith<$Res>
    implements $EditTransactionStateCopyWith<$Res> {
  factory _$$EditTransactionStateImplCopyWith(_$EditTransactionStateImpl value,
          $Res Function(_$EditTransactionStateImpl) then) =
      __$$EditTransactionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? date,
      AsyncValue<List<WalletEntity>> walletOptions,
      WalletEntity? wallet,
      WalletEntity? destWallet,
      String name,
      int amount,
      AsyncValue<List<CategoryEntity>> categoryOptions,
      CategoryEntity? category,
      String description,
      TransactionType type,
      bool isFormValid,
      FormzSubmissionStatus? submissionStatus});

  @override
  $WalletEntityCopyWith<$Res>? get wallet;
  @override
  $WalletEntityCopyWith<$Res>? get destWallet;
  @override
  $CategoryEntityCopyWith<$Res>? get category;
}

/// @nodoc
class __$$EditTransactionStateImplCopyWithImpl<$Res>
    extends _$EditTransactionStateCopyWithImpl<$Res, _$EditTransactionStateImpl>
    implements _$$EditTransactionStateImplCopyWith<$Res> {
  __$$EditTransactionStateImplCopyWithImpl(_$EditTransactionStateImpl _value,
      $Res Function(_$EditTransactionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? walletOptions = null,
    Object? wallet = freezed,
    Object? destWallet = freezed,
    Object? name = null,
    Object? amount = null,
    Object? categoryOptions = null,
    Object? category = freezed,
    Object? description = null,
    Object? type = null,
    Object? isFormValid = null,
    Object? submissionStatus = freezed,
  }) {
    return _then(_$EditTransactionStateImpl(
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
      destWallet: freezed == destWallet
          ? _value.destWallet
          : destWallet // ignore: cast_nullable_to_non_nullable
              as WalletEntity?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      categoryOptions: null == categoryOptions
          ? _value.categoryOptions
          : categoryOptions // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<CategoryEntity>>,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryEntity?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
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

class _$EditTransactionStateImpl
    with DiagnosticableTreeMixin
    implements _EditTransactionState {
  const _$EditTransactionStateImpl(
      {this.date = null,
      this.walletOptions = const AsyncLoading<List<WalletEntity>>(),
      this.wallet = null,
      this.destWallet = null,
      this.name = '',
      this.amount = 0,
      this.categoryOptions = const AsyncLoading<List<CategoryEntity>>(),
      this.category = null,
      this.description = '',
      this.type = TransactionType.expense,
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
  final WalletEntity? wallet;
  @override
  @JsonKey()
  final WalletEntity? destWallet;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int amount;
  @override
  @JsonKey()
  final AsyncValue<List<CategoryEntity>> categoryOptions;
  @override
  @JsonKey()
  final CategoryEntity? category;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final TransactionType type;
  @override
  @JsonKey()
  final bool isFormValid;
  @override
  @JsonKey()
  final FormzSubmissionStatus? submissionStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditTransactionState(date: $date, walletOptions: $walletOptions, wallet: $wallet, destWallet: $destWallet, name: $name, amount: $amount, categoryOptions: $categoryOptions, category: $category, description: $description, type: $type, isFormValid: $isFormValid, submissionStatus: $submissionStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditTransactionState'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('walletOptions', walletOptions))
      ..add(DiagnosticsProperty('wallet', wallet))
      ..add(DiagnosticsProperty('destWallet', destWallet))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('categoryOptions', categoryOptions))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('isFormValid', isFormValid))
      ..add(DiagnosticsProperty('submissionStatus', submissionStatus));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditTransactionStateImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.walletOptions, walletOptions) ||
                other.walletOptions == walletOptions) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.destWallet, destWallet) ||
                other.destWallet == destWallet) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.categoryOptions, categoryOptions) ||
                other.categoryOptions == categoryOptions) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid) &&
            (identical(other.submissionStatus, submissionStatus) ||
                other.submissionStatus == submissionStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      walletOptions,
      wallet,
      destWallet,
      name,
      amount,
      categoryOptions,
      category,
      description,
      type,
      isFormValid,
      submissionStatus);

  /// Create a copy of EditTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditTransactionStateImplCopyWith<_$EditTransactionStateImpl>
      get copyWith =>
          __$$EditTransactionStateImplCopyWithImpl<_$EditTransactionStateImpl>(
              this, _$identity);
}

abstract class _EditTransactionState implements EditTransactionState {
  const factory _EditTransactionState(
          {final DateTime? date,
          final AsyncValue<List<WalletEntity>> walletOptions,
          final WalletEntity? wallet,
          final WalletEntity? destWallet,
          final String name,
          final int amount,
          final AsyncValue<List<CategoryEntity>> categoryOptions,
          final CategoryEntity? category,
          final String description,
          final TransactionType type,
          final bool isFormValid,
          final FormzSubmissionStatus? submissionStatus}) =
      _$EditTransactionStateImpl;

  @override
  DateTime? get date;
  @override
  AsyncValue<List<WalletEntity>> get walletOptions;
  @override
  WalletEntity? get wallet;
  @override
  WalletEntity? get destWallet;
  @override
  String get name;
  @override
  int get amount;
  @override
  AsyncValue<List<CategoryEntity>> get categoryOptions;
  @override
  CategoryEntity? get category;
  @override
  String get description;
  @override
  TransactionType get type;
  @override
  bool get isFormValid;
  @override
  FormzSubmissionStatus? get submissionStatus;

  /// Create a copy of EditTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditTransactionStateImplCopyWith<_$EditTransactionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
