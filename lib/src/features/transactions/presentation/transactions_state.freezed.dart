// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionsState {
  AsyncValue<TransactionItemEntity?> get transactionItemEntity =>
      throw _privateConstructorUsedError;

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionsStateCopyWith<TransactionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsStateCopyWith<$Res> {
  factory $TransactionsStateCopyWith(
          TransactionsState value, $Res Function(TransactionsState) then) =
      _$TransactionsStateCopyWithImpl<$Res, TransactionsState>;
  @useResult
  $Res call({AsyncValue<TransactionItemEntity?> transactionItemEntity});
}

/// @nodoc
class _$TransactionsStateCopyWithImpl<$Res, $Val extends TransactionsState>
    implements $TransactionsStateCopyWith<$Res> {
  _$TransactionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionItemEntity = null,
  }) {
    return _then(_value.copyWith(
      transactionItemEntity: null == transactionItemEntity
          ? _value.transactionItemEntity
          : transactionItemEntity // ignore: cast_nullable_to_non_nullable
              as AsyncValue<TransactionItemEntity?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionsStateImplCopyWith<$Res>
    implements $TransactionsStateCopyWith<$Res> {
  factory _$$TransactionsStateImplCopyWith(_$TransactionsStateImpl value,
          $Res Function(_$TransactionsStateImpl) then) =
      __$$TransactionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<TransactionItemEntity?> transactionItemEntity});
}

/// @nodoc
class __$$TransactionsStateImplCopyWithImpl<$Res>
    extends _$TransactionsStateCopyWithImpl<$Res, _$TransactionsStateImpl>
    implements _$$TransactionsStateImplCopyWith<$Res> {
  __$$TransactionsStateImplCopyWithImpl(_$TransactionsStateImpl _value,
      $Res Function(_$TransactionsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionItemEntity = null,
  }) {
    return _then(_$TransactionsStateImpl(
      transactionItemEntity: null == transactionItemEntity
          ? _value.transactionItemEntity
          : transactionItemEntity // ignore: cast_nullable_to_non_nullable
              as AsyncValue<TransactionItemEntity?>,
    ));
  }
}

/// @nodoc

class _$TransactionsStateImpl implements _TransactionsState {
  const _$TransactionsStateImpl(
      {this.transactionItemEntity = const AsyncValue.data(null)});

  @override
  @JsonKey()
  final AsyncValue<TransactionItemEntity?> transactionItemEntity;

  @override
  String toString() {
    return 'TransactionsState(transactionItemEntity: $transactionItemEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsStateImpl &&
            (identical(other.transactionItemEntity, transactionItemEntity) ||
                other.transactionItemEntity == transactionItemEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionItemEntity);

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsStateImplCopyWith<_$TransactionsStateImpl> get copyWith =>
      __$$TransactionsStateImplCopyWithImpl<_$TransactionsStateImpl>(
          this, _$identity);
}

abstract class _TransactionsState implements TransactionsState {
  const factory _TransactionsState(
          {final AsyncValue<TransactionItemEntity?> transactionItemEntity}) =
      _$TransactionsStateImpl;

  @override
  AsyncValue<TransactionItemEntity?> get transactionItemEntity;

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionsStateImplCopyWith<_$TransactionsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
