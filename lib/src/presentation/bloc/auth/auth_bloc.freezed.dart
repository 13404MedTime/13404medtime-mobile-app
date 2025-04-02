// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) phoneChanged,
    required TResult Function(String phone) checkMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? phoneChanged,
    TResult? Function(String phone)? checkMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? phoneChanged,
    TResult Function(String phone)? checkMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitial value) initial,
    required TResult Function(AuthPhoneChangeEvent value) phoneChanged,
    required TResult Function(AuthCheckMessageEvent value) checkMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventInitial value)? initial,
    TResult? Function(AuthPhoneChangeEvent value)? phoneChanged,
    TResult? Function(AuthCheckMessageEvent value)? checkMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initial,
    TResult Function(AuthPhoneChangeEvent value)? phoneChanged,
    TResult Function(AuthCheckMessageEvent value)? checkMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthEventInitialImplCopyWith<$Res> {
  factory _$$AuthEventInitialImplCopyWith(_$AuthEventInitialImpl value,
          $Res Function(_$AuthEventInitialImpl) then) =
      __$$AuthEventInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventInitialImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventInitialImpl>
    implements _$$AuthEventInitialImplCopyWith<$Res> {
  __$$AuthEventInitialImplCopyWithImpl(_$AuthEventInitialImpl _value,
      $Res Function(_$AuthEventInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthEventInitialImpl implements AuthEventInitial {
  const _$AuthEventInitialImpl();

  @override
  String toString() {
    return 'AuthEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthEventInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) phoneChanged,
    required TResult Function(String phone) checkMessage,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? phoneChanged,
    TResult? Function(String phone)? checkMessage,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? phoneChanged,
    TResult Function(String phone)? checkMessage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitial value) initial,
    required TResult Function(AuthPhoneChangeEvent value) phoneChanged,
    required TResult Function(AuthCheckMessageEvent value) checkMessage,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventInitial value)? initial,
    TResult? Function(AuthPhoneChangeEvent value)? phoneChanged,
    TResult? Function(AuthCheckMessageEvent value)? checkMessage,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initial,
    TResult Function(AuthPhoneChangeEvent value)? phoneChanged,
    TResult Function(AuthCheckMessageEvent value)? checkMessage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthEventInitial implements AuthEvent {
  const factory AuthEventInitial() = _$AuthEventInitialImpl;
}

/// @nodoc
abstract class _$$AuthPhoneChangeEventImplCopyWith<$Res> {
  factory _$$AuthPhoneChangeEventImplCopyWith(_$AuthPhoneChangeEventImpl value,
          $Res Function(_$AuthPhoneChangeEventImpl) then) =
      __$$AuthPhoneChangeEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$AuthPhoneChangeEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthPhoneChangeEventImpl>
    implements _$$AuthPhoneChangeEventImplCopyWith<$Res> {
  __$$AuthPhoneChangeEventImplCopyWithImpl(_$AuthPhoneChangeEventImpl _value,
      $Res Function(_$AuthPhoneChangeEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$AuthPhoneChangeEventImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthPhoneChangeEventImpl implements AuthPhoneChangeEvent {
  const _$AuthPhoneChangeEventImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'AuthEvent.phoneChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthPhoneChangeEventImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthPhoneChangeEventImplCopyWith<_$AuthPhoneChangeEventImpl>
      get copyWith =>
          __$$AuthPhoneChangeEventImplCopyWithImpl<_$AuthPhoneChangeEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) phoneChanged,
    required TResult Function(String phone) checkMessage,
  }) {
    return phoneChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? phoneChanged,
    TResult? Function(String phone)? checkMessage,
  }) {
    return phoneChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? phoneChanged,
    TResult Function(String phone)? checkMessage,
    required TResult orElse(),
  }) {
    if (phoneChanged != null) {
      return phoneChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitial value) initial,
    required TResult Function(AuthPhoneChangeEvent value) phoneChanged,
    required TResult Function(AuthCheckMessageEvent value) checkMessage,
  }) {
    return phoneChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventInitial value)? initial,
    TResult? Function(AuthPhoneChangeEvent value)? phoneChanged,
    TResult? Function(AuthCheckMessageEvent value)? checkMessage,
  }) {
    return phoneChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initial,
    TResult Function(AuthPhoneChangeEvent value)? phoneChanged,
    TResult Function(AuthCheckMessageEvent value)? checkMessage,
    required TResult orElse(),
  }) {
    if (phoneChanged != null) {
      return phoneChanged(this);
    }
    return orElse();
  }
}

abstract class AuthPhoneChangeEvent implements AuthEvent {
  const factory AuthPhoneChangeEvent(final String value) =
      _$AuthPhoneChangeEventImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$AuthPhoneChangeEventImplCopyWith<_$AuthPhoneChangeEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthCheckMessageEventImplCopyWith<$Res> {
  factory _$$AuthCheckMessageEventImplCopyWith(
          _$AuthCheckMessageEventImpl value,
          $Res Function(_$AuthCheckMessageEventImpl) then) =
      __$$AuthCheckMessageEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phone});
}

/// @nodoc
class __$$AuthCheckMessageEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthCheckMessageEventImpl>
    implements _$$AuthCheckMessageEventImplCopyWith<$Res> {
  __$$AuthCheckMessageEventImplCopyWithImpl(_$AuthCheckMessageEventImpl _value,
      $Res Function(_$AuthCheckMessageEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_$AuthCheckMessageEventImpl(
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthCheckMessageEventImpl implements AuthCheckMessageEvent {
  const _$AuthCheckMessageEventImpl(this.phone);

  @override
  final String phone;

  @override
  String toString() {
    return 'AuthEvent.checkMessage(phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthCheckMessageEventImpl &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthCheckMessageEventImplCopyWith<_$AuthCheckMessageEventImpl>
      get copyWith => __$$AuthCheckMessageEventImplCopyWithImpl<
          _$AuthCheckMessageEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) phoneChanged,
    required TResult Function(String phone) checkMessage,
  }) {
    return checkMessage(phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? phoneChanged,
    TResult? Function(String phone)? checkMessage,
  }) {
    return checkMessage?.call(phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? phoneChanged,
    TResult Function(String phone)? checkMessage,
    required TResult orElse(),
  }) {
    if (checkMessage != null) {
      return checkMessage(phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitial value) initial,
    required TResult Function(AuthPhoneChangeEvent value) phoneChanged,
    required TResult Function(AuthCheckMessageEvent value) checkMessage,
  }) {
    return checkMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventInitial value)? initial,
    TResult? Function(AuthPhoneChangeEvent value)? phoneChanged,
    TResult? Function(AuthCheckMessageEvent value)? checkMessage,
  }) {
    return checkMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initial,
    TResult Function(AuthPhoneChangeEvent value)? phoneChanged,
    TResult Function(AuthCheckMessageEvent value)? checkMessage,
    required TResult orElse(),
  }) {
    if (checkMessage != null) {
      return checkMessage(this);
    }
    return orElse();
  }
}

abstract class AuthCheckMessageEvent implements AuthEvent {
  const factory AuthCheckMessageEvent(final String phone) =
      _$AuthCheckMessageEventImpl;

  String get phone;
  @JsonKey(ignore: true)
  _$$AuthCheckMessageEventImplCopyWith<_$AuthCheckMessageEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)
        success,
    required TResult Function() loading,
    required TResult Function(String phone) phone,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult? Function()? loading,
    TResult? Function(String phone)? phone,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult Function()? loading,
    TResult Function(String phone)? phone,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthSuccessState value) success,
    required TResult Function(AuthLaodingState value) loading,
    required TResult Function(AuthPhoneState value) phone,
    required TResult Function(AuthErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthSuccessState value)? success,
    TResult? Function(AuthLaodingState value)? loading,
    TResult? Function(AuthPhoneState value)? phone,
    TResult? Function(AuthErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthSuccessState value)? success,
    TResult Function(AuthLaodingState value)? loading,
    TResult Function(AuthPhoneState value)? phone,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl();

  @override
  String toString() {
    return 'AuthState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)
        success,
    required TResult Function() loading,
    required TResult Function(String phone) phone,
    required TResult Function() error,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult? Function()? loading,
    TResult? Function(String phone)? phone,
    TResult? Function()? error,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult Function()? loading,
    TResult Function(String phone)? phone,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthSuccessState value) success,
    required TResult Function(AuthLaodingState value) loading,
    required TResult Function(AuthPhoneState value) phone,
    required TResult Function(AuthErrorState value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthSuccessState value)? success,
    TResult? Function(AuthLaodingState value)? loading,
    TResult? Function(AuthPhoneState value)? phone,
    TResult? Function(AuthErrorState value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthSuccessState value)? success,
    TResult Function(AuthLaodingState value)? loading,
    TResult Function(AuthPhoneState value)? phone,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _AuthState implements AuthState {
  const factory _AuthState() = _$AuthStateImpl;
}

/// @nodoc
abstract class _$$AuthSuccessStateImplCopyWith<$Res> {
  factory _$$AuthSuccessStateImplCopyWith(_$AuthSuccessStateImpl value,
          $Res Function(_$AuthSuccessStateImpl) then) =
      __$$AuthSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String smsId, String phone, String uiPhone, Map<dynamic, dynamic> data});
}

/// @nodoc
class __$$AuthSuccessStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthSuccessStateImpl>
    implements _$$AuthSuccessStateImplCopyWith<$Res> {
  __$$AuthSuccessStateImplCopyWithImpl(_$AuthSuccessStateImpl _value,
      $Res Function(_$AuthSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smsId = null,
    Object? phone = null,
    Object? uiPhone = null,
    Object? data = null,
  }) {
    return _then(_$AuthSuccessStateImpl(
      null == smsId
          ? _value.smsId
          : smsId // ignore: cast_nullable_to_non_nullable
              as String,
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      null == uiPhone
          ? _value.uiPhone
          : uiPhone // ignore: cast_nullable_to_non_nullable
              as String,
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ));
  }
}

/// @nodoc

class _$AuthSuccessStateImpl implements AuthSuccessState {
  const _$AuthSuccessStateImpl(
      this.smsId, this.phone, this.uiPhone, final Map<dynamic, dynamic> data)
      : _data = data;

  @override
  final String smsId;
  @override
  final String phone;
  @override
  final String uiPhone;
  final Map<dynamic, dynamic> _data;
  @override
  Map<dynamic, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'AuthState.success(smsId: $smsId, phone: $phone, uiPhone: $uiPhone, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSuccessStateImpl &&
            (identical(other.smsId, smsId) || other.smsId == smsId) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.uiPhone, uiPhone) || other.uiPhone == uiPhone) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, smsId, phone, uiPhone,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSuccessStateImplCopyWith<_$AuthSuccessStateImpl> get copyWith =>
      __$$AuthSuccessStateImplCopyWithImpl<_$AuthSuccessStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)
        success,
    required TResult Function() loading,
    required TResult Function(String phone) phone,
    required TResult Function() error,
  }) {
    return success(smsId, this.phone, uiPhone, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult? Function()? loading,
    TResult? Function(String phone)? phone,
    TResult? Function()? error,
  }) {
    return success?.call(smsId, this.phone, uiPhone, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult Function()? loading,
    TResult Function(String phone)? phone,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(smsId, this.phone, uiPhone, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthSuccessState value) success,
    required TResult Function(AuthLaodingState value) loading,
    required TResult Function(AuthPhoneState value) phone,
    required TResult Function(AuthErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthSuccessState value)? success,
    TResult? Function(AuthLaodingState value)? loading,
    TResult? Function(AuthPhoneState value)? phone,
    TResult? Function(AuthErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthSuccessState value)? success,
    TResult Function(AuthLaodingState value)? loading,
    TResult Function(AuthPhoneState value)? phone,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AuthSuccessState implements AuthState {
  const factory AuthSuccessState(
      final String smsId,
      final String phone,
      final String uiPhone,
      final Map<dynamic, dynamic> data) = _$AuthSuccessStateImpl;

  String get smsId;
  String get phone;
  String get uiPhone;
  Map<dynamic, dynamic> get data;
  @JsonKey(ignore: true)
  _$$AuthSuccessStateImplCopyWith<_$AuthSuccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthLaodingStateImplCopyWith<$Res> {
  factory _$$AuthLaodingStateImplCopyWith(_$AuthLaodingStateImpl value,
          $Res Function(_$AuthLaodingStateImpl) then) =
      __$$AuthLaodingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLaodingStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLaodingStateImpl>
    implements _$$AuthLaodingStateImplCopyWith<$Res> {
  __$$AuthLaodingStateImplCopyWithImpl(_$AuthLaodingStateImpl _value,
      $Res Function(_$AuthLaodingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLaodingStateImpl implements AuthLaodingState {
  const _$AuthLaodingStateImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLaodingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)
        success,
    required TResult Function() loading,
    required TResult Function(String phone) phone,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult? Function()? loading,
    TResult? Function(String phone)? phone,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult Function()? loading,
    TResult Function(String phone)? phone,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthSuccessState value) success,
    required TResult Function(AuthLaodingState value) loading,
    required TResult Function(AuthPhoneState value) phone,
    required TResult Function(AuthErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthSuccessState value)? success,
    TResult? Function(AuthLaodingState value)? loading,
    TResult? Function(AuthPhoneState value)? phone,
    TResult? Function(AuthErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthSuccessState value)? success,
    TResult Function(AuthLaodingState value)? loading,
    TResult Function(AuthPhoneState value)? phone,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLaodingState implements AuthState {
  const factory AuthLaodingState() = _$AuthLaodingStateImpl;
}

/// @nodoc
abstract class _$$AuthPhoneStateImplCopyWith<$Res> {
  factory _$$AuthPhoneStateImplCopyWith(_$AuthPhoneStateImpl value,
          $Res Function(_$AuthPhoneStateImpl) then) =
      __$$AuthPhoneStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phone});
}

/// @nodoc
class __$$AuthPhoneStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthPhoneStateImpl>
    implements _$$AuthPhoneStateImplCopyWith<$Res> {
  __$$AuthPhoneStateImplCopyWithImpl(
      _$AuthPhoneStateImpl _value, $Res Function(_$AuthPhoneStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_$AuthPhoneStateImpl(
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthPhoneStateImpl implements AuthPhoneState {
  const _$AuthPhoneStateImpl(this.phone);

  @override
  final String phone;

  @override
  String toString() {
    return 'AuthState.phone(phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthPhoneStateImpl &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthPhoneStateImplCopyWith<_$AuthPhoneStateImpl> get copyWith =>
      __$$AuthPhoneStateImplCopyWithImpl<_$AuthPhoneStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)
        success,
    required TResult Function() loading,
    required TResult Function(String phone) phone,
    required TResult Function() error,
  }) {
    return phone(this.phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult? Function()? loading,
    TResult? Function(String phone)? phone,
    TResult? Function()? error,
  }) {
    return phone?.call(this.phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult Function()? loading,
    TResult Function(String phone)? phone,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (phone != null) {
      return phone(this.phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthSuccessState value) success,
    required TResult Function(AuthLaodingState value) loading,
    required TResult Function(AuthPhoneState value) phone,
    required TResult Function(AuthErrorState value) error,
  }) {
    return phone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthSuccessState value)? success,
    TResult? Function(AuthLaodingState value)? loading,
    TResult? Function(AuthPhoneState value)? phone,
    TResult? Function(AuthErrorState value)? error,
  }) {
    return phone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthSuccessState value)? success,
    TResult Function(AuthLaodingState value)? loading,
    TResult Function(AuthPhoneState value)? phone,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) {
    if (phone != null) {
      return phone(this);
    }
    return orElse();
  }
}

abstract class AuthPhoneState implements AuthState {
  const factory AuthPhoneState(final String phone) = _$AuthPhoneStateImpl;

  String get phone;
  @JsonKey(ignore: true)
  _$$AuthPhoneStateImplCopyWith<_$AuthPhoneStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthErrorStateImplCopyWith<$Res> {
  factory _$$AuthErrorStateImplCopyWith(_$AuthErrorStateImpl value,
          $Res Function(_$AuthErrorStateImpl) then) =
      __$$AuthErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthErrorStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthErrorStateImpl>
    implements _$$AuthErrorStateImplCopyWith<$Res> {
  __$$AuthErrorStateImplCopyWithImpl(
      _$AuthErrorStateImpl _value, $Res Function(_$AuthErrorStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthErrorStateImpl implements AuthErrorState {
  const _$AuthErrorStateImpl();

  @override
  String toString() {
    return 'AuthState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)
        success,
    required TResult Function() loading,
    required TResult Function(String phone) phone,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult? Function()? loading,
    TResult? Function(String phone)? phone,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult Function()? loading,
    TResult Function(String phone)? phone,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthSuccessState value) success,
    required TResult Function(AuthLaodingState value) loading,
    required TResult Function(AuthPhoneState value) phone,
    required TResult Function(AuthErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthSuccessState value)? success,
    TResult? Function(AuthLaodingState value)? loading,
    TResult? Function(AuthPhoneState value)? phone,
    TResult? Function(AuthErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthSuccessState value)? success,
    TResult Function(AuthLaodingState value)? loading,
    TResult Function(AuthPhoneState value)? phone,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthErrorState implements AuthState {
  const factory AuthErrorState() = _$AuthErrorStateImpl;
}
