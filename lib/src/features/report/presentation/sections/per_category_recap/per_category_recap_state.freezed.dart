// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'per_category_recap_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PerCategoryRecapState {
  AsyncValue<List<ReportEntity>> get categoryReports =>
      throw _privateConstructorUsedError;

  /// Create a copy of PerCategoryRecapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerCategoryRecapStateCopyWith<PerCategoryRecapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerCategoryRecapStateCopyWith<$Res> {
  factory $PerCategoryRecapStateCopyWith(PerCategoryRecapState value,
          $Res Function(PerCategoryRecapState) then) =
      _$PerCategoryRecapStateCopyWithImpl<$Res, PerCategoryRecapState>;
  @useResult
  $Res call({AsyncValue<List<ReportEntity>> categoryReports});
}

/// @nodoc
class _$PerCategoryRecapStateCopyWithImpl<$Res,
        $Val extends PerCategoryRecapState>
    implements $PerCategoryRecapStateCopyWith<$Res> {
  _$PerCategoryRecapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerCategoryRecapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryReports = null,
  }) {
    return _then(_value.copyWith(
      categoryReports: null == categoryReports
          ? _value.categoryReports
          : categoryReports // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ReportEntity>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerCategoryRecapStateImplCopyWith<$Res>
    implements $PerCategoryRecapStateCopyWith<$Res> {
  factory _$$PerCategoryRecapStateImplCopyWith(
          _$PerCategoryRecapStateImpl value,
          $Res Function(_$PerCategoryRecapStateImpl) then) =
      __$$PerCategoryRecapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<ReportEntity>> categoryReports});
}

/// @nodoc
class __$$PerCategoryRecapStateImplCopyWithImpl<$Res>
    extends _$PerCategoryRecapStateCopyWithImpl<$Res,
        _$PerCategoryRecapStateImpl>
    implements _$$PerCategoryRecapStateImplCopyWith<$Res> {
  __$$PerCategoryRecapStateImplCopyWithImpl(_$PerCategoryRecapStateImpl _value,
      $Res Function(_$PerCategoryRecapStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PerCategoryRecapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryReports = null,
  }) {
    return _then(_$PerCategoryRecapStateImpl(
      categoryReports: null == categoryReports
          ? _value.categoryReports
          : categoryReports // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ReportEntity>>,
    ));
  }
}

/// @nodoc

class _$PerCategoryRecapStateImpl implements _PerCategoryRecapState {
  const _$PerCategoryRecapStateImpl(
      {this.categoryReports = const AsyncLoading<List<ReportEntity>>()});

  @override
  @JsonKey()
  final AsyncValue<List<ReportEntity>> categoryReports;

  @override
  String toString() {
    return 'PerCategoryRecapState(categoryReports: $categoryReports)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerCategoryRecapStateImpl &&
            (identical(other.categoryReports, categoryReports) ||
                other.categoryReports == categoryReports));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryReports);

  /// Create a copy of PerCategoryRecapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerCategoryRecapStateImplCopyWith<_$PerCategoryRecapStateImpl>
      get copyWith => __$$PerCategoryRecapStateImplCopyWithImpl<
          _$PerCategoryRecapStateImpl>(this, _$identity);
}

abstract class _PerCategoryRecapState implements PerCategoryRecapState {
  const factory _PerCategoryRecapState(
          {final AsyncValue<List<ReportEntity>> categoryReports}) =
      _$PerCategoryRecapStateImpl;

  @override
  AsyncValue<List<ReportEntity>> get categoryReports;

  /// Create a copy of PerCategoryRecapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerCategoryRecapStateImplCopyWith<_$PerCategoryRecapStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
