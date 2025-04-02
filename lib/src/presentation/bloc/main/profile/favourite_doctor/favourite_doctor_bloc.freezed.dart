// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_doctor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavouriteDoctorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getFavouriteDoctor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getFavouriteDoctor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getFavouriteDoctor,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetFavouriteDoctorEvent value) getFavouriteDoctor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetFavouriteDoctorEvent value)? getFavouriteDoctor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetFavouriteDoctorEvent value)? getFavouriteDoctor,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteDoctorEventCopyWith<$Res> {
  factory $FavouriteDoctorEventCopyWith(FavouriteDoctorEvent value,
          $Res Function(FavouriteDoctorEvent) then) =
      _$FavouriteDoctorEventCopyWithImpl<$Res, FavouriteDoctorEvent>;
}

/// @nodoc
class _$FavouriteDoctorEventCopyWithImpl<$Res,
        $Val extends FavouriteDoctorEvent>
    implements $FavouriteDoctorEventCopyWith<$Res> {
  _$FavouriteDoctorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetFavouriteDoctorEventImplCopyWith<$Res> {
  factory _$$GetFavouriteDoctorEventImplCopyWith(
          _$GetFavouriteDoctorEventImpl value,
          $Res Function(_$GetFavouriteDoctorEventImpl) then) =
      __$$GetFavouriteDoctorEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetFavouriteDoctorEventImplCopyWithImpl<$Res>
    extends _$FavouriteDoctorEventCopyWithImpl<$Res,
        _$GetFavouriteDoctorEventImpl>
    implements _$$GetFavouriteDoctorEventImplCopyWith<$Res> {
  __$$GetFavouriteDoctorEventImplCopyWithImpl(
      _$GetFavouriteDoctorEventImpl _value,
      $Res Function(_$GetFavouriteDoctorEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetFavouriteDoctorEventImpl implements GetFavouriteDoctorEvent {
  const _$GetFavouriteDoctorEventImpl();

  @override
  String toString() {
    return 'FavouriteDoctorEvent.getFavouriteDoctor()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFavouriteDoctorEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getFavouriteDoctor,
  }) {
    return getFavouriteDoctor();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getFavouriteDoctor,
  }) {
    return getFavouriteDoctor?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getFavouriteDoctor,
    required TResult orElse(),
  }) {
    if (getFavouriteDoctor != null) {
      return getFavouriteDoctor();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetFavouriteDoctorEvent value) getFavouriteDoctor,
  }) {
    return getFavouriteDoctor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetFavouriteDoctorEvent value)? getFavouriteDoctor,
  }) {
    return getFavouriteDoctor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetFavouriteDoctorEvent value)? getFavouriteDoctor,
    required TResult orElse(),
  }) {
    if (getFavouriteDoctor != null) {
      return getFavouriteDoctor(this);
    }
    return orElse();
  }
}

abstract class GetFavouriteDoctorEvent implements FavouriteDoctorEvent {
  const factory GetFavouriteDoctorEvent() = _$GetFavouriteDoctorEventImpl;
}

/// @nodoc
mixin _$FavouriteDoctorState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<DoctorIdData> get favouriteDoctorList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavouriteDoctorStateCopyWith<FavouriteDoctorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteDoctorStateCopyWith<$Res> {
  factory $FavouriteDoctorStateCopyWith(FavouriteDoctorState value,
          $Res Function(FavouriteDoctorState) then) =
      _$FavouriteDoctorStateCopyWithImpl<$Res, FavouriteDoctorState>;
  @useResult
  $Res call({bool isLoading, List<DoctorIdData> favouriteDoctorList});
}

/// @nodoc
class _$FavouriteDoctorStateCopyWithImpl<$Res,
        $Val extends FavouriteDoctorState>
    implements $FavouriteDoctorStateCopyWith<$Res> {
  _$FavouriteDoctorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? favouriteDoctorList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      favouriteDoctorList: null == favouriteDoctorList
          ? _value.favouriteDoctorList
          : favouriteDoctorList // ignore: cast_nullable_to_non_nullable
              as List<DoctorIdData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavouriteDoctorStateImplCopyWith<$Res>
    implements $FavouriteDoctorStateCopyWith<$Res> {
  factory _$$FavouriteDoctorStateImplCopyWith(_$FavouriteDoctorStateImpl value,
          $Res Function(_$FavouriteDoctorStateImpl) then) =
      __$$FavouriteDoctorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<DoctorIdData> favouriteDoctorList});
}

/// @nodoc
class __$$FavouriteDoctorStateImplCopyWithImpl<$Res>
    extends _$FavouriteDoctorStateCopyWithImpl<$Res, _$FavouriteDoctorStateImpl>
    implements _$$FavouriteDoctorStateImplCopyWith<$Res> {
  __$$FavouriteDoctorStateImplCopyWithImpl(_$FavouriteDoctorStateImpl _value,
      $Res Function(_$FavouriteDoctorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? favouriteDoctorList = null,
  }) {
    return _then(_$FavouriteDoctorStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      favouriteDoctorList: null == favouriteDoctorList
          ? _value._favouriteDoctorList
          : favouriteDoctorList // ignore: cast_nullable_to_non_nullable
              as List<DoctorIdData>,
    ));
  }
}

/// @nodoc

class _$FavouriteDoctorStateImpl implements _FavouriteDoctorState {
  const _$FavouriteDoctorStateImpl(
      {this.isLoading = false,
      final List<DoctorIdData> favouriteDoctorList = const []})
      : _favouriteDoctorList = favouriteDoctorList;

  @override
  @JsonKey()
  final bool isLoading;
  final List<DoctorIdData> _favouriteDoctorList;
  @override
  @JsonKey()
  List<DoctorIdData> get favouriteDoctorList {
    if (_favouriteDoctorList is EqualUnmodifiableListView)
      return _favouriteDoctorList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favouriteDoctorList);
  }

  @override
  String toString() {
    return 'FavouriteDoctorState(isLoading: $isLoading, favouriteDoctorList: $favouriteDoctorList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouriteDoctorStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._favouriteDoctorList, _favouriteDoctorList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_favouriteDoctorList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouriteDoctorStateImplCopyWith<_$FavouriteDoctorStateImpl>
      get copyWith =>
          __$$FavouriteDoctorStateImplCopyWithImpl<_$FavouriteDoctorStateImpl>(
              this, _$identity);
}

abstract class _FavouriteDoctorState implements FavouriteDoctorState {
  const factory _FavouriteDoctorState(
          {final bool isLoading,
          final List<DoctorIdData> favouriteDoctorList}) =
      _$FavouriteDoctorStateImpl;

  @override
  bool get isLoading;
  @override
  List<DoctorIdData> get favouriteDoctorList;
  @override
  @JsonKey(ignore: true)
  _$$FavouriteDoctorStateImplCopyWith<_$FavouriteDoctorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
