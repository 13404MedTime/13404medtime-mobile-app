// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specialists_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpecialistsEvent {
  String get searchText => throw _privateConstructorUsedError;
  String get categoryGuid => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText, String categoryGuid)
        searchDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText, String categoryGuid)? searchDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText, String categoryGuid)? searchDoctors,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchDoctorsEvent value) searchDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchDoctorsEvent value)? searchDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchDoctorsEvent value)? searchDoctors,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpecialistsEventCopyWith<SpecialistsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialistsEventCopyWith<$Res> {
  factory $SpecialistsEventCopyWith(
          SpecialistsEvent value, $Res Function(SpecialistsEvent) then) =
      _$SpecialistsEventCopyWithImpl<$Res, SpecialistsEvent>;
  @useResult
  $Res call({String searchText, String categoryGuid});
}

/// @nodoc
class _$SpecialistsEventCopyWithImpl<$Res, $Val extends SpecialistsEvent>
    implements $SpecialistsEventCopyWith<$Res> {
  _$SpecialistsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
    Object? categoryGuid = null,
  }) {
    return _then(_value.copyWith(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      categoryGuid: null == categoryGuid
          ? _value.categoryGuid
          : categoryGuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchDoctorsEventImplCopyWith<$Res>
    implements $SpecialistsEventCopyWith<$Res> {
  factory _$$SearchDoctorsEventImplCopyWith(_$SearchDoctorsEventImpl value,
          $Res Function(_$SearchDoctorsEventImpl) then) =
      __$$SearchDoctorsEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String searchText, String categoryGuid});
}

/// @nodoc
class __$$SearchDoctorsEventImplCopyWithImpl<$Res>
    extends _$SpecialistsEventCopyWithImpl<$Res, _$SearchDoctorsEventImpl>
    implements _$$SearchDoctorsEventImplCopyWith<$Res> {
  __$$SearchDoctorsEventImplCopyWithImpl(_$SearchDoctorsEventImpl _value,
      $Res Function(_$SearchDoctorsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
    Object? categoryGuid = null,
  }) {
    return _then(_$SearchDoctorsEventImpl(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      categoryGuid: null == categoryGuid
          ? _value.categoryGuid
          : categoryGuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchDoctorsEventImpl implements SearchDoctorsEvent {
  const _$SearchDoctorsEventImpl(
      {this.searchText = '', this.categoryGuid = ''});

  @override
  @JsonKey()
  final String searchText;
  @override
  @JsonKey()
  final String categoryGuid;

  @override
  String toString() {
    return 'SpecialistsEvent.searchDoctors(searchText: $searchText, categoryGuid: $categoryGuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchDoctorsEventImpl &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.categoryGuid, categoryGuid) ||
                other.categoryGuid == categoryGuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText, categoryGuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchDoctorsEventImplCopyWith<_$SearchDoctorsEventImpl> get copyWith =>
      __$$SearchDoctorsEventImplCopyWithImpl<_$SearchDoctorsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText, String categoryGuid)
        searchDoctors,
  }) {
    return searchDoctors(searchText, categoryGuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText, String categoryGuid)? searchDoctors,
  }) {
    return searchDoctors?.call(searchText, categoryGuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText, String categoryGuid)? searchDoctors,
    required TResult orElse(),
  }) {
    if (searchDoctors != null) {
      return searchDoctors(searchText, categoryGuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchDoctorsEvent value) searchDoctors,
  }) {
    return searchDoctors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchDoctorsEvent value)? searchDoctors,
  }) {
    return searchDoctors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchDoctorsEvent value)? searchDoctors,
    required TResult orElse(),
  }) {
    if (searchDoctors != null) {
      return searchDoctors(this);
    }
    return orElse();
  }
}

abstract class SearchDoctorsEvent implements SpecialistsEvent {
  const factory SearchDoctorsEvent(
      {final String searchText,
      final String categoryGuid}) = _$SearchDoctorsEventImpl;

  @override
  String get searchText;
  @override
  String get categoryGuid;
  @override
  @JsonKey(ignore: true)
  _$$SearchDoctorsEventImplCopyWith<_$SearchDoctorsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SpecialistsState {
  List<DoctorIdData> get doctors => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpecialistsStateCopyWith<SpecialistsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialistsStateCopyWith<$Res> {
  factory $SpecialistsStateCopyWith(
          SpecialistsState value, $Res Function(SpecialistsState) then) =
      _$SpecialistsStateCopyWithImpl<$Res, SpecialistsState>;
  @useResult
  $Res call({List<DoctorIdData> doctors, bool isLoading});
}

/// @nodoc
class _$SpecialistsStateCopyWithImpl<$Res, $Val extends SpecialistsState>
    implements $SpecialistsStateCopyWith<$Res> {
  _$SpecialistsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctors = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      doctors: null == doctors
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<DoctorIdData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecialistsStateImplCopyWith<$Res>
    implements $SpecialistsStateCopyWith<$Res> {
  factory _$$SpecialistsStateImplCopyWith(_$SpecialistsStateImpl value,
          $Res Function(_$SpecialistsStateImpl) then) =
      __$$SpecialistsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DoctorIdData> doctors, bool isLoading});
}

/// @nodoc
class __$$SpecialistsStateImplCopyWithImpl<$Res>
    extends _$SpecialistsStateCopyWithImpl<$Res, _$SpecialistsStateImpl>
    implements _$$SpecialistsStateImplCopyWith<$Res> {
  __$$SpecialistsStateImplCopyWithImpl(_$SpecialistsStateImpl _value,
      $Res Function(_$SpecialistsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctors = null,
    Object? isLoading = null,
  }) {
    return _then(_$SpecialistsStateImpl(
      doctors: null == doctors
          ? _value._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<DoctorIdData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SpecialistsStateImpl implements _SpecialistsState {
  const _$SpecialistsStateImpl(
      {final List<DoctorIdData> doctors = const [], this.isLoading = false})
      : _doctors = doctors;

  final List<DoctorIdData> _doctors;
  @override
  @JsonKey()
  List<DoctorIdData> get doctors {
    if (_doctors is EqualUnmodifiableListView) return _doctors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctors);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'SpecialistsState(doctors: $doctors, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialistsStateImpl &&
            const DeepCollectionEquality().equals(other._doctors, _doctors) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_doctors), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecialistsStateImplCopyWith<_$SpecialistsStateImpl> get copyWith =>
      __$$SpecialistsStateImplCopyWithImpl<_$SpecialistsStateImpl>(
          this, _$identity);
}

abstract class _SpecialistsState implements SpecialistsState {
  const factory _SpecialistsState(
      {final List<DoctorIdData> doctors,
      final bool isLoading}) = _$SpecialistsStateImpl;

  @override
  List<DoctorIdData> get doctors;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$SpecialistsStateImplCopyWith<_$SpecialistsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
