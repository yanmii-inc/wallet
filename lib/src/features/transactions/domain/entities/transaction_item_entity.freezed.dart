// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionItemEntity {
// TODO: Change the field id
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;

  /// Create a copy of TransactionItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionItemEntityCopyWith<TransactionItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionItemEntityCopyWith<$Res> {
  factory $TransactionItemEntityCopyWith(TransactionItemEntity value,
          $Res Function(TransactionItemEntity) then) =
      _$TransactionItemEntityCopyWithImpl<$Res, TransactionItemEntity>;
  @useResult
  $Res call({@HiveField(0) String? id});
}

/// @nodoc
class _$TransactionItemEntityCopyWithImpl<$Res,
        $Val extends TransactionItemEntity>
    implements $TransactionItemEntityCopyWith<$Res> {
  _$TransactionItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionItemEntityImplCopyWith<$Res>
    implements $TransactionItemEntityCopyWith<$Res> {
  factory _$$TransactionItemEntityImplCopyWith(
          _$TransactionItemEntityImpl value,
          $Res Function(_$TransactionItemEntityImpl) then) =
      __$$TransactionItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String? id});
}

/// @nodoc
class __$$TransactionItemEntityImplCopyWithImpl<$Res>
    extends _$TransactionItemEntityCopyWithImpl<$Res,
        _$TransactionItemEntityImpl>
    implements _$$TransactionItemEntityImplCopyWith<$Res> {
  __$$TransactionItemEntityImplCopyWithImpl(_$TransactionItemEntityImpl _value,
      $Res Function(_$TransactionItemEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$TransactionItemEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TransactionItemEntityImpl implements _TransactionItemEntity {
  const _$TransactionItemEntityImpl({@HiveField(0) this.id});

// TODO: Change the field id
  @override
  @HiveField(0)
  final String? id;

  @override
  String toString() {
    return 'TransactionItemEntity(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionItemEntityImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of TransactionItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionItemEntityImplCopyWith<_$TransactionItemEntityImpl>
      get copyWith => __$$TransactionItemEntityImplCopyWithImpl<
          _$TransactionItemEntityImpl>(this, _$identity);
}

abstract class _TransactionItemEntity implements TransactionItemEntity {
  const factory _TransactionItemEntity({@HiveField(0) final String? id}) =
      _$TransactionItemEntityImpl;

// TODO: Change the field id
  @override
  @HiveField(0)
  String? get id;

  /// Create a copy of TransactionItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionItemEntityImplCopyWith<_$TransactionItemEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
