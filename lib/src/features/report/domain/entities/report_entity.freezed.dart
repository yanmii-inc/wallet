// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReportEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  int get percentage => throw _privateConstructorUsedError;

  /// Create a copy of ReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportEntityCopyWith<ReportEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportEntityCopyWith<$Res> {
  factory $ReportEntityCopyWith(
          ReportEntity value, $Res Function(ReportEntity) then) =
      _$ReportEntityCopyWithImpl<$Res, ReportEntity>;
  @useResult
  $Res call({int id, String name, int count, int percentage});
}

/// @nodoc
class _$ReportEntityCopyWithImpl<$Res, $Val extends ReportEntity>
    implements $ReportEntityCopyWith<$Res> {
  _$ReportEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? count = null,
    Object? percentage = null,
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
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportEntityImplCopyWith<$Res>
    implements $ReportEntityCopyWith<$Res> {
  factory _$$ReportEntityImplCopyWith(
          _$ReportEntityImpl value, $Res Function(_$ReportEntityImpl) then) =
      __$$ReportEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int count, int percentage});
}

/// @nodoc
class __$$ReportEntityImplCopyWithImpl<$Res>
    extends _$ReportEntityCopyWithImpl<$Res, _$ReportEntityImpl>
    implements _$$ReportEntityImplCopyWith<$Res> {
  __$$ReportEntityImplCopyWithImpl(
      _$ReportEntityImpl _value, $Res Function(_$ReportEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? count = null,
    Object? percentage = null,
  }) {
    return _then(_$ReportEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReportEntityImpl implements _ReportEntity {
  const _$ReportEntityImpl(
      {required this.id,
      required this.name,
      required this.count,
      required this.percentage});

  @override
  final int id;
  @override
  final String name;
  @override
  final int count;
  @override
  final int percentage;

  @override
  String toString() {
    return 'ReportEntity(id: $id, name: $name, count: $count, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, count, percentage);

  /// Create a copy of ReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportEntityImplCopyWith<_$ReportEntityImpl> get copyWith =>
      __$$ReportEntityImplCopyWithImpl<_$ReportEntityImpl>(this, _$identity);
}

abstract class _ReportEntity implements ReportEntity {
  const factory _ReportEntity(
      {required final int id,
      required final String name,
      required final int count,
      required final int percentage}) = _$ReportEntityImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  int get count;
  @override
  int get percentage;

  /// Create a copy of ReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportEntityImplCopyWith<_$ReportEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
