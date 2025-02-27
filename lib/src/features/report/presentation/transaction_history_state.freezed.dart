// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionHistoryState {
  AsyncValue<List<TransactionEntity>> get transactions =>
      throw _privateConstructorUsedError;

  /// Create a copy of TransactionHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionHistoryStateCopyWith<TransactionHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryStateCopyWith<$Res> {
  factory $TransactionHistoryStateCopyWith(TransactionHistoryState value,
          $Res Function(TransactionHistoryState) then) =
      _$TransactionHistoryStateCopyWithImpl<$Res, TransactionHistoryState>;
  @useResult
  $Res call({AsyncValue<List<TransactionEntity>> transactions});
}

/// @nodoc
class _$TransactionHistoryStateCopyWithImpl<$Res,
        $Val extends TransactionHistoryState>
    implements $TransactionHistoryStateCopyWith<$Res> {
  _$TransactionHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_value.copyWith(
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<TransactionEntity>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionHistoryStateImplCopyWith<$Res>
    implements $TransactionHistoryStateCopyWith<$Res> {
  factory _$$TransactionHistoryStateImplCopyWith(
          _$TransactionHistoryStateImpl value,
          $Res Function(_$TransactionHistoryStateImpl) then) =
      __$$TransactionHistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<TransactionEntity>> transactions});
}

/// @nodoc
class __$$TransactionHistoryStateImplCopyWithImpl<$Res>
    extends _$TransactionHistoryStateCopyWithImpl<$Res,
        _$TransactionHistoryStateImpl>
    implements _$$TransactionHistoryStateImplCopyWith<$Res> {
  __$$TransactionHistoryStateImplCopyWithImpl(
      _$TransactionHistoryStateImpl _value,
      $Res Function(_$TransactionHistoryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_$TransactionHistoryStateImpl(
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<TransactionEntity>>,
    ));
  }
}

/// @nodoc

class _$TransactionHistoryStateImpl implements _TransactionHistoryState {
  const _$TransactionHistoryStateImpl(
      {this.transactions = const AsyncLoading<List<TransactionEntity>>()});

  @override
  @JsonKey()
  final AsyncValue<List<TransactionEntity>> transactions;

  @override
  String toString() {
    return 'TransactionHistoryState(transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionHistoryStateImpl &&
            (identical(other.transactions, transactions) ||
                other.transactions == transactions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactions);

  /// Create a copy of TransactionHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionHistoryStateImplCopyWith<_$TransactionHistoryStateImpl>
      get copyWith => __$$TransactionHistoryStateImplCopyWithImpl<
          _$TransactionHistoryStateImpl>(this, _$identity);
}

abstract class _TransactionHistoryState implements TransactionHistoryState {
  const factory _TransactionHistoryState(
          {final AsyncValue<List<TransactionEntity>> transactions}) =
      _$TransactionHistoryStateImpl;

  @override
  AsyncValue<List<TransactionEntity>> get transactions;

  /// Create a copy of TransactionHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionHistoryStateImplCopyWith<_$TransactionHistoryStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
