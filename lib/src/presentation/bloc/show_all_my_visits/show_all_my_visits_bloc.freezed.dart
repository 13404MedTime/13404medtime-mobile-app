// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'show_all_my_visits_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShowAllMyVisitsEvent {
  String get searchText => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) searchDoctor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? searchDoctor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? searchDoctor,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchDoctorEvent value) searchDoctor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchDoctorEvent value)? searchDoctor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchDoctorEvent value)? searchDoctor,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShowAllMyVisitsEventCopyWith<ShowAllMyVisitsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowAllMyVisitsEventCopyWith<$Res> {
  factory $ShowAllMyVisitsEventCopyWith(ShowAllMyVisitsEvent value,
          $Res Function(ShowAllMyVisitsEvent) then) =
      _$ShowAllMyVisitsEventCopyWithImpl<$Res, ShowAllMyVisitsEvent>;
  @useResult
  $Res call({String searchText});
}

/// @nodoc
class _$ShowAllMyVisitsEventCopyWithImpl<$Res,
        $Val extends ShowAllMyVisitsEvent>
    implements $ShowAllMyVisitsEventCopyWith<$Res> {
  _$ShowAllMyVisitsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
  }) {
    return _then(_value.copyWith(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchDoctorEventImplCopyWith<$Res>
    implements $ShowAllMyVisitsEventCopyWith<$Res> {
  factory _$$SearchDoctorEventImplCopyWith(_$SearchDoctorEventImpl value,
          $Res Function(_$SearchDoctorEventImpl) then) =
      __$$SearchDoctorEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String searchText});
}

/// @nodoc
class __$$SearchDoctorEventImplCopyWithImpl<$Res>
    extends _$ShowAllMyVisitsEventCopyWithImpl<$Res, _$SearchDoctorEventImpl>
    implements _$$SearchDoctorEventImplCopyWith<$Res> {
  __$$SearchDoctorEventImplCopyWithImpl(_$SearchDoctorEventImpl _value,
      $Res Function(_$SearchDoctorEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
  }) {
    return _then(_$SearchDoctorEventImpl(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchDoctorEventImpl implements SearchDoctorEvent {
  const _$SearchDoctorEventImpl({required this.searchText});

  @override
  final String searchText;

  @override
  String toString() {
    return 'ShowAllMyVisitsEvent.searchDoctor(searchText: $searchText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchDoctorEventImpl &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchDoctorEventImplCopyWith<_$SearchDoctorEventImpl> get copyWith =>
      __$$SearchDoctorEventImplCopyWithImpl<_$SearchDoctorEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) searchDoctor,
  }) {
    return searchDoctor(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? searchDoctor,
  }) {
    return searchDoctor?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? searchDoctor,
    required TResult orElse(),
  }) {
    if (searchDoctor != null) {
      return searchDoctor(searchText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchDoctorEvent value) searchDoctor,
  }) {
    return searchDoctor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchDoctorEvent value)? searchDoctor,
  }) {
    return searchDoctor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchDoctorEvent value)? searchDoctor,
    required TResult orElse(),
  }) {
    if (searchDoctor != null) {
      return searchDoctor(this);
    }
    return orElse();
  }
}

abstract class SearchDoctorEvent implements ShowAllMyVisitsEvent {
  const factory SearchDoctorEvent({required final String searchText}) =
      _$SearchDoctorEventImpl;

  @override
  String get searchText;
  @override
  @JsonKey(ignore: true)
  _$$SearchDoctorEventImplCopyWith<_$SearchDoctorEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShowAllMyVisitsState {
  List<MyVisitModel> get doctors => throw _privateConstructorUsedError;
  ShowAllMyVisitsStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShowAllMyVisitsStateCopyWith<ShowAllMyVisitsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowAllMyVisitsStateCopyWith<$Res> {
  factory $ShowAllMyVisitsStateCopyWith(ShowAllMyVisitsState value,
          $Res Function(ShowAllMyVisitsState) then) =
      _$ShowAllMyVisitsStateCopyWithImpl<$Res, ShowAllMyVisitsState>;
  @useResult
  $Res call({List<MyVisitModel> doctors, ShowAllMyVisitsStatus status});
}

/// @nodoc
class _$ShowAllMyVisitsStateCopyWithImpl<$Res,
        $Val extends ShowAllMyVisitsState>
    implements $ShowAllMyVisitsStateCopyWith<$Res> {
  _$ShowAllMyVisitsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctors = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      doctors: null == doctors
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<MyVisitModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ShowAllMyVisitsStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShowAllMyVisitsStateImplCopyWith<$Res>
    implements $ShowAllMyVisitsStateCopyWith<$Res> {
  factory _$$ShowAllMyVisitsStateImplCopyWith(_$ShowAllMyVisitsStateImpl value,
          $Res Function(_$ShowAllMyVisitsStateImpl) then) =
      __$$ShowAllMyVisitsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MyVisitModel> doctors, ShowAllMyVisitsStatus status});
}

/// @nodoc
class __$$ShowAllMyVisitsStateImplCopyWithImpl<$Res>
    extends _$ShowAllMyVisitsStateCopyWithImpl<$Res, _$ShowAllMyVisitsStateImpl>
    implements _$$ShowAllMyVisitsStateImplCopyWith<$Res> {
  __$$ShowAllMyVisitsStateImplCopyWithImpl(_$ShowAllMyVisitsStateImpl _value,
      $Res Function(_$ShowAllMyVisitsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctors = null,
    Object? status = null,
  }) {
    return _then(_$ShowAllMyVisitsStateImpl(
      doctors: null == doctors
          ? _value._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<MyVisitModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ShowAllMyVisitsStatus,
    ));
  }
}

/// @nodoc

class _$ShowAllMyVisitsStateImpl implements _ShowAllMyVisitsState {
  const _$ShowAllMyVisitsStateImpl(
      {final List<MyVisitModel> doctors = const [],
      this.status = ShowAllMyVisitsStatus.initial})
      : _doctors = doctors;

  final List<MyVisitModel> _doctors;
  @override
  @JsonKey()
  List<MyVisitModel> get doctors {
    if (_doctors is EqualUnmodifiableListView) return _doctors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctors);
  }

  @override
  @JsonKey()
  final ShowAllMyVisitsStatus status;

  @override
  String toString() {
    return 'ShowAllMyVisitsState(doctors: $doctors, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowAllMyVisitsStateImpl &&
            const DeepCollectionEquality().equals(other._doctors, _doctors) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_doctors), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowAllMyVisitsStateImplCopyWith<_$ShowAllMyVisitsStateImpl>
      get copyWith =>
          __$$ShowAllMyVisitsStateImplCopyWithImpl<_$ShowAllMyVisitsStateImpl>(
              this, _$identity);
}

abstract class _ShowAllMyVisitsState implements ShowAllMyVisitsState {
  const factory _ShowAllMyVisitsState(
      {final List<MyVisitModel> doctors,
      final ShowAllMyVisitsStatus status}) = _$ShowAllMyVisitsStateImpl;

  @override
  List<MyVisitModel> get doctors;
  @override
  ShowAllMyVisitsStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$ShowAllMyVisitsStateImplCopyWith<_$ShowAllMyVisitsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
