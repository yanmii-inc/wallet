// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'per_title_recap_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PerTitleRecapState {
  AsyncValue<List<TitleReportEntity>> get titleReports =>
      throw _privateConstructorUsedError;

  /// Create a copy of PerTitleRecapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerTitleRecapStateCopyWith<PerTitleRecapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerTitleRecapStateCopyWith<$Res> {
  factory $PerTitleRecapStateCopyWith(
          PerTitleRecapState value, $Res Function(PerTitleRecapState) then) =
      _$PerTitleRecapStateCopyWithImpl<$Res, PerTitleRecapState>;
  @useResult
  $Res call({AsyncValue<List<TitleReportEntity>> titleReports});
}

/// @nodoc
class _$PerTitleRecapStateCopyWithImpl<$Res, $Val extends PerTitleRecapState>
    implements $PerTitleRecapStateCopyWith<$Res> {
  _$PerTitleRecapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerTitleRecapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titleReports = null,
  }) {
    return _then(_value.copyWith(
      titleReports: null == titleReports
          ? _value.titleReports
          : titleReports // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<TitleReportEntity>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BreakdownViewStateImplCopyWith<$Res>
    implements $PerTitleRecapStateCopyWith<$Res> {
  factory _$$BreakdownViewStateImplCopyWith(_$BreakdownViewStateImpl value,
          $Res Function(_$BreakdownViewStateImpl) then) =
      __$$BreakdownViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<TitleReportEntity>> titleReports});
}

/// @nodoc
class __$$BreakdownViewStateImplCopyWithImpl<$Res>
    extends _$PerTitleRecapStateCopyWithImpl<$Res, _$BreakdownViewStateImpl>
    implements _$$BreakdownViewStateImplCopyWith<$Res> {
  __$$BreakdownViewStateImplCopyWithImpl(_$BreakdownViewStateImpl _value,
      $Res Function(_$BreakdownViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PerTitleRecapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titleReports = null,
  }) {
    return _then(_$BreakdownViewStateImpl(
      titleReports: null == titleReports
          ? _value.titleReports
          : titleReports // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<TitleReportEntity>>,
    ));
  }
}

/// @nodoc

class _$BreakdownViewStateImpl implements _BreakdownViewState {
  const _$BreakdownViewStateImpl(
      {this.titleReports = const AsyncLoading<List<TitleReportEntity>>()});

  @override
  @JsonKey()
  final AsyncValue<List<TitleReportEntity>> titleReports;

  @override
  String toString() {
    return 'PerTitleRecapState(titleReports: $titleReports)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreakdownViewStateImpl &&
            (identical(other.titleReports, titleReports) ||
                other.titleReports == titleReports));
  }

  @override
  int get hashCode => Object.hash(runtimeType, titleReports);

  /// Create a copy of PerTitleRecapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BreakdownViewStateImplCopyWith<_$BreakdownViewStateImpl> get copyWith =>
      __$$BreakdownViewStateImplCopyWithImpl<_$BreakdownViewStateImpl>(
          this, _$identity);
}

abstract class _BreakdownViewState implements PerTitleRecapState {
  const factory _BreakdownViewState(
          {final AsyncValue<List<TitleReportEntity>> titleReports}) =
      _$BreakdownViewStateImpl;

  @override
  AsyncValue<List<TitleReportEntity>> get titleReports;

  /// Create a copy of PerTitleRecapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BreakdownViewStateImplCopyWith<_$BreakdownViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
