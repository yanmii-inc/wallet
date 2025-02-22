// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_total.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryTotal _$CategoryTotalFromJson(Map<String, dynamic> json) {
  return _CategoryTotal.fromJson(json);
}

/// @nodoc
mixin _$CategoryTotal {
  String get label => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this CategoryTotal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryTotal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryTotalCopyWith<CategoryTotal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryTotalCopyWith<$Res> {
  factory $CategoryTotalCopyWith(
          CategoryTotal value, $Res Function(CategoryTotal) then) =
      _$CategoryTotalCopyWithImpl<$Res, CategoryTotal>;
  @useResult
  $Res call({String label, int id, int total});
}

/// @nodoc
class _$CategoryTotalCopyWithImpl<$Res, $Val extends CategoryTotal>
    implements $CategoryTotalCopyWith<$Res> {
  _$CategoryTotalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryTotal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? id = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryTotalImplCopyWith<$Res>
    implements $CategoryTotalCopyWith<$Res> {
  factory _$$CategoryTotalImplCopyWith(
          _$CategoryTotalImpl value, $Res Function(_$CategoryTotalImpl) then) =
      __$$CategoryTotalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, int id, int total});
}

/// @nodoc
class __$$CategoryTotalImplCopyWithImpl<$Res>
    extends _$CategoryTotalCopyWithImpl<$Res, _$CategoryTotalImpl>
    implements _$$CategoryTotalImplCopyWith<$Res> {
  __$$CategoryTotalImplCopyWithImpl(
      _$CategoryTotalImpl _value, $Res Function(_$CategoryTotalImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryTotal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? id = null,
    Object? total = null,
  }) {
    return _then(_$CategoryTotalImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryTotalImpl implements _CategoryTotal {
  const _$CategoryTotalImpl(
      {required this.label, required this.id, required this.total});

  factory _$CategoryTotalImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryTotalImplFromJson(json);

  @override
  final String label;
  @override
  final int id;
  @override
  final int total;

  @override
  String toString() {
    return 'CategoryTotal(label: $label, id: $id, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryTotalImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, id, total);

  /// Create a copy of CategoryTotal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryTotalImplCopyWith<_$CategoryTotalImpl> get copyWith =>
      __$$CategoryTotalImplCopyWithImpl<_$CategoryTotalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryTotalImplToJson(
      this,
    );
  }
}

abstract class _CategoryTotal implements CategoryTotal {
  const factory _CategoryTotal(
      {required final String label,
      required final int id,
      required final int total}) = _$CategoryTotalImpl;

  factory _CategoryTotal.fromJson(Map<String, dynamic> json) =
      _$CategoryTotalImpl.fromJson;

  @override
  String get label;
  @override
  int get id;
  @override
  int get total;

  /// Create a copy of CategoryTotal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryTotalImplCopyWith<_$CategoryTotalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
