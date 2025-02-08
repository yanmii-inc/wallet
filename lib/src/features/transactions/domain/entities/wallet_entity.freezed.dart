// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalletEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;

  /// Create a copy of WalletEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletEntityCopyWith<WalletEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletEntityCopyWith<$Res> {
  factory $WalletEntityCopyWith(
          WalletEntity value, $Res Function(WalletEntity) then) =
      _$WalletEntityCopyWithImpl<$Res, WalletEntity>;
  @useResult
  $Res call({int id, String name, String? logo});
}

/// @nodoc
class _$WalletEntityCopyWithImpl<$Res, $Val extends WalletEntity>
    implements $WalletEntityCopyWith<$Res> {
  _$WalletEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletEntityImplCopyWith<$Res>
    implements $WalletEntityCopyWith<$Res> {
  factory _$$WalletEntityImplCopyWith(
          _$WalletEntityImpl value, $Res Function(_$WalletEntityImpl) then) =
      __$$WalletEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? logo});
}

/// @nodoc
class __$$WalletEntityImplCopyWithImpl<$Res>
    extends _$WalletEntityCopyWithImpl<$Res, _$WalletEntityImpl>
    implements _$$WalletEntityImplCopyWith<$Res> {
  __$$WalletEntityImplCopyWithImpl(
      _$WalletEntityImpl _value, $Res Function(_$WalletEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logo = freezed,
  }) {
    return _then(_$WalletEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WalletEntityImpl implements _WalletEntity {
  const _$WalletEntityImpl(
      {required this.id, required this.name, this.logo = null});

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey()
  final String? logo;

  @override
  String toString() {
    return 'WalletEntity(id: $id, name: $name, logo: $logo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, logo);

  /// Create a copy of WalletEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletEntityImplCopyWith<_$WalletEntityImpl> get copyWith =>
      __$$WalletEntityImplCopyWithImpl<_$WalletEntityImpl>(this, _$identity);
}

abstract class _WalletEntity implements WalletEntity {
  const factory _WalletEntity(
      {required final int id,
      required final String name,
      final String? logo}) = _$WalletEntityImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get logo;

  /// Create a copy of WalletEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletEntityImplCopyWith<_$WalletEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
