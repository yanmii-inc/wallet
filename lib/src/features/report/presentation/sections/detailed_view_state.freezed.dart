// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detailed_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailedViewState {
  DateTime? get startDateTime => throw _privateConstructorUsedError;
  AsyncValue<List<ReportEntity>> get categories =>
      throw _privateConstructorUsedError;

  /// Create a copy of DetailedViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailedViewStateCopyWith<DetailedViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailedViewStateCopyWith<$Res> {
  factory $DetailedViewStateCopyWith(
          DetailedViewState value, $Res Function(DetailedViewState) then) =
      _$DetailedViewStateCopyWithImpl<$Res, DetailedViewState>;
  @useResult
  $Res call(
      {DateTime? startDateTime, AsyncValue<List<ReportEntity>> categories});
}

/// @nodoc
class _$DetailedViewStateCopyWithImpl<$Res, $Val extends DetailedViewState>
    implements $DetailedViewStateCopyWith<$Res> {
  _$DetailedViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailedViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDateTime = freezed,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      startDateTime: freezed == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ReportEntity>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailedViewStateImplCopyWith<$Res>
    implements $DetailedViewStateCopyWith<$Res> {
  factory _$$DetailedViewStateImplCopyWith(_$DetailedViewStateImpl value,
          $Res Function(_$DetailedViewStateImpl) then) =
      __$$DetailedViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? startDateTime, AsyncValue<List<ReportEntity>> categories});
}

/// @nodoc
class __$$DetailedViewStateImplCopyWithImpl<$Res>
    extends _$DetailedViewStateCopyWithImpl<$Res, _$DetailedViewStateImpl>
    implements _$$DetailedViewStateImplCopyWith<$Res> {
  __$$DetailedViewStateImplCopyWithImpl(_$DetailedViewStateImpl _value,
      $Res Function(_$DetailedViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailedViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDateTime = freezed,
    Object? categories = null,
  }) {
    return _then(_$DetailedViewStateImpl(
      startDateTime: freezed == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ReportEntity>>,
    ));
  }
}

/// @nodoc

class _$DetailedViewStateImpl implements _DetailedViewState {
  const _$DetailedViewStateImpl(
      {this.startDateTime = null,
      this.categories = const AsyncLoading<List<ReportEntity>>()});

  @override
  @JsonKey()
  final DateTime? startDateTime;
  @override
  @JsonKey()
  final AsyncValue<List<ReportEntity>> categories;

  @override
  String toString() {
    return 'DetailedViewState(startDateTime: $startDateTime, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailedViewStateImpl &&
            (identical(other.startDateTime, startDateTime) ||
                other.startDateTime == startDateTime) &&
            (identical(other.categories, categories) ||
                other.categories == categories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDateTime, categories);

  /// Create a copy of DetailedViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailedViewStateImplCopyWith<_$DetailedViewStateImpl> get copyWith =>
      __$$DetailedViewStateImplCopyWithImpl<_$DetailedViewStateImpl>(
          this, _$identity);
}

abstract class _DetailedViewState implements DetailedViewState {
  const factory _DetailedViewState(
          {final DateTime? startDateTime,
          final AsyncValue<List<ReportEntity>> categories}) =
      _$DetailedViewStateImpl;

  @override
  DateTime? get startDateTime;
  @override
  AsyncValue<List<ReportEntity>> get categories;

  /// Create a copy of DetailedViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailedViewStateImplCopyWith<_$DetailedViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
