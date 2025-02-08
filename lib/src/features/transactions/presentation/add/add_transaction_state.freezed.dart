// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_transaction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddTransactionState {
  DateTime? get date => throw _privateConstructorUsedError;
  String get wallet => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  bool get isFormValid => throw _privateConstructorUsedError;

  /// Create a copy of AddTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddTransactionStateCopyWith<AddTransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTransactionStateCopyWith<$Res> {
  factory $AddTransactionStateCopyWith(
          AddTransactionState value, $Res Function(AddTransactionState) then) =
      _$AddTransactionStateCopyWithImpl<$Res, AddTransactionState>;
  @useResult
  $Res call(
      {DateTime? date,
      String wallet,
      String name,
      int amount,
      String category,
      String description,
      TransactionType type,
      bool isFormValid});
}

/// @nodoc
class _$AddTransactionStateCopyWithImpl<$Res, $Val extends AddTransactionState>
    implements $AddTransactionStateCopyWith<$Res> {
  _$AddTransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? wallet = null,
    Object? name = null,
    Object? amount = null,
    Object? category = null,
    Object? description = null,
    Object? type = null,
    Object? isFormValid = null,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddTransactionStateImplCopyWith<$Res>
    implements $AddTransactionStateCopyWith<$Res> {
  factory _$$AddTransactionStateImplCopyWith(_$AddTransactionStateImpl value,
          $Res Function(_$AddTransactionStateImpl) then) =
      __$$AddTransactionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? date,
      String wallet,
      String name,
      int amount,
      String category,
      String description,
      TransactionType type,
      bool isFormValid});
}

/// @nodoc
class __$$AddTransactionStateImplCopyWithImpl<$Res>
    extends _$AddTransactionStateCopyWithImpl<$Res, _$AddTransactionStateImpl>
    implements _$$AddTransactionStateImplCopyWith<$Res> {
  __$$AddTransactionStateImplCopyWithImpl(_$AddTransactionStateImpl _value,
      $Res Function(_$AddTransactionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? wallet = null,
    Object? name = null,
    Object? amount = null,
    Object? category = null,
    Object? description = null,
    Object? type = null,
    Object? isFormValid = null,
  }) {
    return _then(_$AddTransactionStateImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// @nodoc

class _$AddTransactionStateImpl implements _AddTransactionState {
  const _$AddTransactionStateImpl(
      {this.date = null,
      this.wallet = '',
      this.name = '',
      this.amount = 0,
      this.category = '',
      this.description = '',
      this.type = TransactionType.expense,
      this.isFormValid = false});

  @override
  @JsonKey()
  final DateTime? date;
  @override
  @JsonKey()
  final String wallet;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int amount;
  @override
  @JsonKey()
  final String category;
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
  String toString() {
    return 'AddTransactionState(date: $date, wallet: $wallet, name: $name, amount: $amount, category: $category, description: $description, type: $type, isFormValid: $isFormValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTransactionStateImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, wallet, name, amount,
      category, description, type, isFormValid);

  /// Create a copy of AddTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTransactionStateImplCopyWith<_$AddTransactionStateImpl> get copyWith =>
      __$$AddTransactionStateImplCopyWithImpl<_$AddTransactionStateImpl>(
          this, _$identity);
}

abstract class _AddTransactionState implements AddTransactionState {
  const factory _AddTransactionState(
      {final DateTime? date,
      final String wallet,
      final String name,
      final int amount,
      final String category,
      final String description,
      final TransactionType type,
      final bool isFormValid}) = _$AddTransactionStateImpl;

  @override
  DateTime? get date;
  @override
  String get wallet;
  @override
  String get name;
  @override
  int get amount;
  @override
  String get category;
  @override
  String get description;
  @override
  TransactionType get type;
  @override
  bool get isFormValid;

  /// Create a copy of AddTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddTransactionStateImplCopyWith<_$AddTransactionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
