// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConsultationEvent {
  String get searchText => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) searchDoctorsTypes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? searchDoctorsTypes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? searchDoctorsTypes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchDoctorsTypesEvent value) searchDoctorsTypes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchDoctorsTypesEvent value)? searchDoctorsTypes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchDoctorsTypesEvent value)? searchDoctorsTypes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConsultationEventCopyWith<ConsultationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationEventCopyWith<$Res> {
  factory $ConsultationEventCopyWith(
          ConsultationEvent value, $Res Function(ConsultationEvent) then) =
      _$ConsultationEventCopyWithImpl<$Res, ConsultationEvent>;
  @useResult
  $Res call({String searchText});
}

/// @nodoc
class _$ConsultationEventCopyWithImpl<$Res, $Val extends ConsultationEvent>
    implements $ConsultationEventCopyWith<$Res> {
  _$ConsultationEventCopyWithImpl(this._value, this._then);

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
abstract class _$$SearchDoctorsTypesEventImplCopyWith<$Res>
    implements $ConsultationEventCopyWith<$Res> {
  factory _$$SearchDoctorsTypesEventImplCopyWith(
          _$SearchDoctorsTypesEventImpl value,
          $Res Function(_$SearchDoctorsTypesEventImpl) then) =
      __$$SearchDoctorsTypesEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String searchText});
}

/// @nodoc
class __$$SearchDoctorsTypesEventImplCopyWithImpl<$Res>
    extends _$ConsultationEventCopyWithImpl<$Res, _$SearchDoctorsTypesEventImpl>
    implements _$$SearchDoctorsTypesEventImplCopyWith<$Res> {
  __$$SearchDoctorsTypesEventImplCopyWithImpl(
      _$SearchDoctorsTypesEventImpl _value,
      $Res Function(_$SearchDoctorsTypesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
  }) {
    return _then(_$SearchDoctorsTypesEventImpl(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchDoctorsTypesEventImpl implements SearchDoctorsTypesEvent {
  const _$SearchDoctorsTypesEventImpl({this.searchText = ''});

  @override
  @JsonKey()
  final String searchText;

  @override
  String toString() {
    return 'ConsultationEvent.searchDoctorsTypes(searchText: $searchText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchDoctorsTypesEventImpl &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchDoctorsTypesEventImplCopyWith<_$SearchDoctorsTypesEventImpl>
      get copyWith => __$$SearchDoctorsTypesEventImplCopyWithImpl<
          _$SearchDoctorsTypesEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) searchDoctorsTypes,
  }) {
    return searchDoctorsTypes(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText)? searchDoctorsTypes,
  }) {
    return searchDoctorsTypes?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? searchDoctorsTypes,
    required TResult orElse(),
  }) {
    if (searchDoctorsTypes != null) {
      return searchDoctorsTypes(searchText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchDoctorsTypesEvent value) searchDoctorsTypes,
  }) {
    return searchDoctorsTypes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchDoctorsTypesEvent value)? searchDoctorsTypes,
  }) {
    return searchDoctorsTypes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchDoctorsTypesEvent value)? searchDoctorsTypes,
    required TResult orElse(),
  }) {
    if (searchDoctorsTypes != null) {
      return searchDoctorsTypes(this);
    }
    return orElse();
  }
}

abstract class SearchDoctorsTypesEvent implements ConsultationEvent {
  const factory SearchDoctorsTypesEvent({final String searchText}) =
      _$SearchDoctorsTypesEventImpl;

  @override
  String get searchText;
  @override
  @JsonKey(ignore: true)
  _$$SearchDoctorsTypesEventImplCopyWith<_$SearchDoctorsTypesEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ConsultationState {
  List<DoctorTypeModel> get doctorsTypes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConsultationStateCopyWith<ConsultationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationStateCopyWith<$Res> {
  factory $ConsultationStateCopyWith(
          ConsultationState value, $Res Function(ConsultationState) then) =
      _$ConsultationStateCopyWithImpl<$Res, ConsultationState>;
  @useResult
  $Res call({List<DoctorTypeModel> doctorsTypes});
}

/// @nodoc
class _$ConsultationStateCopyWithImpl<$Res, $Val extends ConsultationState>
    implements $ConsultationStateCopyWith<$Res> {
  _$ConsultationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorsTypes = null,
  }) {
    return _then(_value.copyWith(
      doctorsTypes: null == doctorsTypes
          ? _value.doctorsTypes
          : doctorsTypes // ignore: cast_nullable_to_non_nullable
              as List<DoctorTypeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsultationStatelImplCopyWith<$Res>
    implements $ConsultationStateCopyWith<$Res> {
  factory _$$ConsultationStatelImplCopyWith(_$ConsultationStatelImpl value,
          $Res Function(_$ConsultationStatelImpl) then) =
      __$$ConsultationStatelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DoctorTypeModel> doctorsTypes});
}

/// @nodoc
class __$$ConsultationStatelImplCopyWithImpl<$Res>
    extends _$ConsultationStateCopyWithImpl<$Res, _$ConsultationStatelImpl>
    implements _$$ConsultationStatelImplCopyWith<$Res> {
  __$$ConsultationStatelImplCopyWithImpl(_$ConsultationStatelImpl _value,
      $Res Function(_$ConsultationStatelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorsTypes = null,
  }) {
    return _then(_$ConsultationStatelImpl(
      doctorsTypes: null == doctorsTypes
          ? _value._doctorsTypes
          : doctorsTypes // ignore: cast_nullable_to_non_nullable
              as List<DoctorTypeModel>,
    ));
  }
}

/// @nodoc

class _$ConsultationStatelImpl implements _ConsultationStatel {
  const _$ConsultationStatelImpl(
      {final List<DoctorTypeModel> doctorsTypes = const []})
      : _doctorsTypes = doctorsTypes;

  final List<DoctorTypeModel> _doctorsTypes;
  @override
  @JsonKey()
  List<DoctorTypeModel> get doctorsTypes {
    if (_doctorsTypes is EqualUnmodifiableListView) return _doctorsTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctorsTypes);
  }

  @override
  String toString() {
    return 'ConsultationState(doctorsTypes: $doctorsTypes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultationStatelImpl &&
            const DeepCollectionEquality()
                .equals(other._doctorsTypes, _doctorsTypes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_doctorsTypes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultationStatelImplCopyWith<_$ConsultationStatelImpl> get copyWith =>
      __$$ConsultationStatelImplCopyWithImpl<_$ConsultationStatelImpl>(
          this, _$identity);
}

abstract class _ConsultationStatel implements ConsultationState {
  const factory _ConsultationStatel(
      {final List<DoctorTypeModel> doctorsTypes}) = _$ConsultationStatelImpl;

  @override
  List<DoctorTypeModel> get doctorsTypes;
  @override
  @JsonKey(ignore: true)
  _$$ConsultationStatelImplCopyWith<_$ConsultationStatelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
