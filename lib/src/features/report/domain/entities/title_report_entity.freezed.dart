// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'title_report_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TitleReportEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  /// Create a copy of TitleReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TitleReportEntityCopyWith<TitleReportEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TitleReportEntityCopyWith<$Res> {
  factory $TitleReportEntityCopyWith(
          TitleReportEntity value, $Res Function(TitleReportEntity) then) =
      _$TitleReportEntityCopyWithImpl<$Res, TitleReportEntity>;
  @useResult
  $Res call({int id, String name, int amount});
}

/// @nodoc
class _$TitleReportEntityCopyWithImpl<$Res, $Val extends TitleReportEntity>
    implements $TitleReportEntityCopyWith<$Res> {
  _$TitleReportEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TitleReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
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
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TitleReportEntityImplCopyWith<$Res>
    implements $TitleReportEntityCopyWith<$Res> {
  factory _$$TitleReportEntityImplCopyWith(_$TitleReportEntityImpl value,
          $Res Function(_$TitleReportEntityImpl) then) =
      __$$TitleReportEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int amount});
}

/// @nodoc
class __$$TitleReportEntityImplCopyWithImpl<$Res>
    extends _$TitleReportEntityCopyWithImpl<$Res, _$TitleReportEntityImpl>
    implements _$$TitleReportEntityImplCopyWith<$Res> {
  __$$TitleReportEntityImplCopyWithImpl(_$TitleReportEntityImpl _value,
      $Res Function(_$TitleReportEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TitleReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
  }) {
    return _then(_$TitleReportEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TitleReportEntityImpl implements _TitleReportEntity {
  const _$TitleReportEntityImpl(
      {required this.id, required this.name, required this.amount});

  @override
  final int id;
  @override
  final String name;
  @override
  final int amount;

  @override
  String toString() {
    return 'TitleReportEntity(id: $id, name: $name, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TitleReportEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, amount);

  /// Create a copy of TitleReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TitleReportEntityImplCopyWith<_$TitleReportEntityImpl> get copyWith =>
      __$$TitleReportEntityImplCopyWithImpl<_$TitleReportEntityImpl>(
          this, _$identity);
}

abstract class _TitleReportEntity implements TitleReportEntity {
  const factory _TitleReportEntity(
      {required final int id,
      required final String name,
      required final int amount}) = _$TitleReportEntityImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  int get amount;

  /// Create a copy of TitleReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TitleReportEntityImplCopyWith<_$TitleReportEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
