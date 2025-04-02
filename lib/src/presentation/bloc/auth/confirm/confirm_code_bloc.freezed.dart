// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_code_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConfirmCodeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) phoneChanged,
    required TResult Function(String value) sendAgain,
    required TResult Function() updateFcmTokenAndPlatformType,
    required TResult Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)
        loginWithOption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? phoneChanged,
    TResult? Function(String value)? sendAgain,
    TResult? Function()? updateFcmTokenAndPlatformType,
    TResult? Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)?
        loginWithOption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? phoneChanged,
    TResult Function(String value)? sendAgain,
    TResult Function()? updateFcmTokenAndPlatformType,
    TResult Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)?
        loginWithOption,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConfirmCodeEventInitial value) initial,
    required TResult Function(ConfirmCodePhoneChangeEvent value) phoneChanged,
    required TResult Function(ConfirmCodeSendAgainEvent value) sendAgain,
    required TResult Function(UpdateFcmTokenAndPlatformType value)
        updateFcmTokenAndPlatformType,
    required TResult Function(ConfirmCodeCheckMessageEvent value)
        loginWithOption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConfirmCodeEventInitial value)? initial,
    TResult? Function(ConfirmCodePhoneChangeEvent value)? phoneChanged,
    TResult? Function(ConfirmCodeSendAgainEvent value)? sendAgain,
    TResult? Function(UpdateFcmTokenAndPlatformType value)?
        updateFcmTokenAndPlatformType,
    TResult? Function(ConfirmCodeCheckMessageEvent value)? loginWithOption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConfirmCodeEventInitial value)? initial,
    TResult Function(ConfirmCodePhoneChangeEvent value)? phoneChanged,
    TResult Function(ConfirmCodeSendAgainEvent value)? sendAgain,
    TResult Function(UpdateFcmTokenAndPlatformType value)?
        updateFcmTokenAndPlatformType,
    TResult Function(ConfirmCodeCheckMessageEvent value)? loginWithOption,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmCodeEventCopyWith<$Res> {
  factory $ConfirmCodeEventCopyWith(
          ConfirmCodeEvent value, $Res Function(ConfirmCodeEvent) then) =
      _$ConfirmCodeEventCopyWithImpl<$Res, ConfirmCodeEvent>;
}

/// @nodoc
class _$ConfirmCodeEventCopyWithImpl<$Res, $Val extends ConfirmCodeEvent>
    implements $ConfirmCodeEventCopyWith<$Res> {
  _$ConfirmCodeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ConfirmCodeEventInitialImplCopyWith<$Res> {
  factory _$$ConfirmCodeEventInitialImplCopyWith(
          _$ConfirmCodeEventInitialImpl value,
          $Res Function(_$ConfirmCodeEventInitialImpl) then) =
      __$$ConfirmCodeEventInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConfirmCodeEventInitialImplCopyWithImpl<$Res>
    extends _$ConfirmCodeEventCopyWithImpl<$Res, _$ConfirmCodeEventInitialImpl>
    implements _$$ConfirmCodeEventInitialImplCopyWith<$Res> {
  __$$ConfirmCodeEventInitialImplCopyWithImpl(
      _$ConfirmCodeEventInitialImpl _value,
      $Res Function(_$ConfirmCodeEventInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConfirmCodeEventInitialImpl implements ConfirmCodeEventInitial {
  const _$ConfirmCodeEventInitialImpl();

  @override
  String toString() {
    return 'ConfirmCodeEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmCodeEventInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) phoneChanged,
    required TResult Function(String value) sendAgain,
    required TResult Function() updateFcmTokenAndPlatformType,
    required TResult Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)
        loginWithOption,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? phoneChanged,
    TResult? Function(String value)? sendAgain,
    TResult? Function()? updateFcmTokenAndPlatformType,
    TResult? Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)?
        loginWithOption,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? phoneChanged,
    TResult Function(String value)? sendAgain,
    TResult Function()? updateFcmTokenAndPlatformType,
    TResult Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)?
        loginWithOption,
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
    required TResult Function(ConfirmCodeEventInitial value) initial,
    required TResult Function(ConfirmCodePhoneChangeEvent value) phoneChanged,
    required TResult Function(ConfirmCodeSendAgainEvent value) sendAgain,
    required TResult Function(UpdateFcmTokenAndPlatformType value)
        updateFcmTokenAndPlatformType,
    required TResult Function(ConfirmCodeCheckMessageEvent value)
        loginWithOption,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConfirmCodeEventInitial value)? initial,
    TResult? Function(ConfirmCodePhoneChangeEvent value)? phoneChanged,
    TResult? Function(ConfirmCodeSendAgainEvent value)? sendAgain,
    TResult? Function(UpdateFcmTokenAndPlatformType value)?
        updateFcmTokenAndPlatformType,
    TResult? Function(ConfirmCodeCheckMessageEvent value)? loginWithOption,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConfirmCodeEventInitial value)? initial,
    TResult Function(ConfirmCodePhoneChangeEvent value)? phoneChanged,
    TResult Function(ConfirmCodeSendAgainEvent value)? sendAgain,
    TResult Function(UpdateFcmTokenAndPlatformType value)?
        updateFcmTokenAndPlatformType,
    TResult Function(ConfirmCodeCheckMessageEvent value)? loginWithOption,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ConfirmCodeEventInitial implements ConfirmCodeEvent {
  const factory ConfirmCodeEventInitial() = _$ConfirmCodeEventInitialImpl;
}

/// @nodoc
abstract class _$$ConfirmCodePhoneChangeEventImplCopyWith<$Res> {
  factory _$$ConfirmCodePhoneChangeEventImplCopyWith(
          _$ConfirmCodePhoneChangeEventImpl value,
          $Res Function(_$ConfirmCodePhoneChangeEventImpl) then) =
      __$$ConfirmCodePhoneChangeEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$ConfirmCodePhoneChangeEventImplCopyWithImpl<$Res>
    extends _$ConfirmCodeEventCopyWithImpl<$Res,
        _$ConfirmCodePhoneChangeEventImpl>
    implements _$$ConfirmCodePhoneChangeEventImplCopyWith<$Res> {
  __$$ConfirmCodePhoneChangeEventImplCopyWithImpl(
      _$ConfirmCodePhoneChangeEventImpl _value,
      $Res Function(_$ConfirmCodePhoneChangeEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ConfirmCodePhoneChangeEventImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConfirmCodePhoneChangeEventImpl implements ConfirmCodePhoneChangeEvent {
  const _$ConfirmCodePhoneChangeEventImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'ConfirmCodeEvent.phoneChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmCodePhoneChangeEventImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmCodePhoneChangeEventImplCopyWith<_$ConfirmCodePhoneChangeEventImpl>
      get copyWith => __$$ConfirmCodePhoneChangeEventImplCopyWithImpl<
          _$ConfirmCodePhoneChangeEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) phoneChanged,
    required TResult Function(String value) sendAgain,
    required TResult Function() updateFcmTokenAndPlatformType,
    required TResult Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)
        loginWithOption,
  }) {
    return phoneChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? phoneChanged,
    TResult? Function(String value)? sendAgain,
    TResult? Function()? updateFcmTokenAndPlatformType,
    TResult? Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)?
        loginWithOption,
  }) {
    return phoneChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? phoneChanged,
    TResult Function(String value)? sendAgain,
    TResult Function()? updateFcmTokenAndPlatformType,
    TResult Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)?
        loginWithOption,
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
    required TResult Function(ConfirmCodeEventInitial value) initial,
    required TResult Function(ConfirmCodePhoneChangeEvent value) phoneChanged,
    required TResult Function(ConfirmCodeSendAgainEvent value) sendAgain,
    required TResult Function(UpdateFcmTokenAndPlatformType value)
        updateFcmTokenAndPlatformType,
    required TResult Function(ConfirmCodeCheckMessageEvent value)
        loginWithOption,
  }) {
    return phoneChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConfirmCodeEventInitial value)? initial,
    TResult? Function(ConfirmCodePhoneChangeEvent value)? phoneChanged,
    TResult? Function(ConfirmCodeSendAgainEvent value)? sendAgain,
    TResult? Function(UpdateFcmTokenAndPlatformType value)?
        updateFcmTokenAndPlatformType,
    TResult? Function(ConfirmCodeCheckMessageEvent value)? loginWithOption,
  }) {
    return phoneChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConfirmCodeEventInitial value)? initial,
    TResult Function(ConfirmCodePhoneChangeEvent value)? phoneChanged,
    TResult Function(ConfirmCodeSendAgainEvent value)? sendAgain,
    TResult Function(UpdateFcmTokenAndPlatformType value)?
        updateFcmTokenAndPlatformType,
    TResult Function(ConfirmCodeCheckMessageEvent value)? loginWithOption,
    required TResult orElse(),
  }) {
    if (phoneChanged != null) {
      return phoneChanged(this);
    }
    return orElse();
  }
}

abstract class ConfirmCodePhoneChangeEvent implements ConfirmCodeEvent {
  const factory ConfirmCodePhoneChangeEvent(final String value) =
      _$ConfirmCodePhoneChangeEventImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$ConfirmCodePhoneChangeEventImplCopyWith<_$ConfirmCodePhoneChangeEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmCodeSendAgainEventImplCopyWith<$Res> {
  factory _$$ConfirmCodeSendAgainEventImplCopyWith(
          _$ConfirmCodeSendAgainEventImpl value,
          $Res Function(_$ConfirmCodeSendAgainEventImpl) then) =
      __$$ConfirmCodeSendAgainEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$ConfirmCodeSendAgainEventImplCopyWithImpl<$Res>
    extends _$ConfirmCodeEventCopyWithImpl<$Res,
        _$ConfirmCodeSendAgainEventImpl>
    implements _$$ConfirmCodeSendAgainEventImplCopyWith<$Res> {
  __$$ConfirmCodeSendAgainEventImplCopyWithImpl(
      _$ConfirmCodeSendAgainEventImpl _value,
      $Res Function(_$ConfirmCodeSendAgainEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ConfirmCodeSendAgainEventImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConfirmCodeSendAgainEventImpl implements ConfirmCodeSendAgainEvent {
  const _$ConfirmCodeSendAgainEventImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'ConfirmCodeEvent.sendAgain(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmCodeSendAgainEventImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmCodeSendAgainEventImplCopyWith<_$ConfirmCodeSendAgainEventImpl>
      get copyWith => __$$ConfirmCodeSendAgainEventImplCopyWithImpl<
          _$ConfirmCodeSendAgainEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) phoneChanged,
    required TResult Function(String value) sendAgain,
    required TResult Function() updateFcmTokenAndPlatformType,
    required TResult Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)
        loginWithOption,
  }) {
    return sendAgain(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? phoneChanged,
    TResult? Function(String value)? sendAgain,
    TResult? Function()? updateFcmTokenAndPlatformType,
    TResult? Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)?
        loginWithOption,
  }) {
    return sendAgain?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? phoneChanged,
    TResult Function(String value)? sendAgain,
    TResult Function()? updateFcmTokenAndPlatformType,
    TResult Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)?
        loginWithOption,
    required TResult orElse(),
  }) {
    if (sendAgain != null) {
      return sendAgain(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConfirmCodeEventInitial value) initial,
    required TResult Function(ConfirmCodePhoneChangeEvent value) phoneChanged,
    required TResult Function(ConfirmCodeSendAgainEvent value) sendAgain,
    required TResult Function(UpdateFcmTokenAndPlatformType value)
        updateFcmTokenAndPlatformType,
    required TResult Function(ConfirmCodeCheckMessageEvent value)
        loginWithOption,
  }) {
    return sendAgain(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConfirmCodeEventInitial value)? initial,
    TResult? Function(ConfirmCodePhoneChangeEvent value)? phoneChanged,
    TResult? Function(ConfirmCodeSendAgainEvent value)? sendAgain,
    TResult? Function(UpdateFcmTokenAndPlatformType value)?
        updateFcmTokenAndPlatformType,
    TResult? Function(ConfirmCodeCheckMessageEvent value)? loginWithOption,
  }) {
    return sendAgain?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConfirmCodeEventInitial value)? initial,
    TResult Function(ConfirmCodePhoneChangeEvent value)? phoneChanged,
    TResult Function(ConfirmCodeSendAgainEvent value)? sendAgain,
    TResult Function(UpdateFcmTokenAndPlatformType value)?
        updateFcmTokenAndPlatformType,
    TResult Function(ConfirmCodeCheckMessageEvent value)? loginWithOption,
    required TResult orElse(),
  }) {
    if (sendAgain != null) {
      return sendAgain(this);
    }
    return orElse();
  }
}

abstract class ConfirmCodeSendAgainEvent implements ConfirmCodeEvent {
  const factory ConfirmCodeSendAgainEvent(final String value) =
      _$ConfirmCodeSendAgainEventImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$ConfirmCodeSendAgainEventImplCopyWith<_$ConfirmCodeSendAgainEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateFcmTokenAndPlatformTypeImplCopyWith<$Res> {
  factory _$$UpdateFcmTokenAndPlatformTypeImplCopyWith(
          _$UpdateFcmTokenAndPlatformTypeImpl value,
          $Res Function(_$UpdateFcmTokenAndPlatformTypeImpl) then) =
      __$$UpdateFcmTokenAndPlatformTypeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateFcmTokenAndPlatformTypeImplCopyWithImpl<$Res>
    extends _$ConfirmCodeEventCopyWithImpl<$Res,
        _$UpdateFcmTokenAndPlatformTypeImpl>
    implements _$$UpdateFcmTokenAndPlatformTypeImplCopyWith<$Res> {
  __$$UpdateFcmTokenAndPlatformTypeImplCopyWithImpl(
      _$UpdateFcmTokenAndPlatformTypeImpl _value,
      $Res Function(_$UpdateFcmTokenAndPlatformTypeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateFcmTokenAndPlatformTypeImpl
    implements UpdateFcmTokenAndPlatformType {
  const _$UpdateFcmTokenAndPlatformTypeImpl();

  @override
  String toString() {
    return 'ConfirmCodeEvent.updateFcmTokenAndPlatformType()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFcmTokenAndPlatformTypeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) phoneChanged,
    required TResult Function(String value) sendAgain,
    required TResult Function() updateFcmTokenAndPlatformType,
    required TResult Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)
        loginWithOption,
  }) {
    return updateFcmTokenAndPlatformType();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? phoneChanged,
    TResult? Function(String value)? sendAgain,
    TResult? Function()? updateFcmTokenAndPlatformType,
    TResult? Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)?
        loginWithOption,
  }) {
    return updateFcmTokenAndPlatformType?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? phoneChanged,
    TResult Function(String value)? sendAgain,
    TResult Function()? updateFcmTokenAndPlatformType,
    TResult Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)?
        loginWithOption,
    required TResult orElse(),
  }) {
    if (updateFcmTokenAndPlatformType != null) {
      return updateFcmTokenAndPlatformType();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConfirmCodeEventInitial value) initial,
    required TResult Function(ConfirmCodePhoneChangeEvent value) phoneChanged,
    required TResult Function(ConfirmCodeSendAgainEvent value) sendAgain,
    required TResult Function(UpdateFcmTokenAndPlatformType value)
        updateFcmTokenAndPlatformType,
    required TResult Function(ConfirmCodeCheckMessageEvent value)
        loginWithOption,
  }) {
    return updateFcmTokenAndPlatformType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConfirmCodeEventInitial value)? initial,
    TResult? Function(ConfirmCodePhoneChangeEvent value)? phoneChanged,
    TResult? Function(ConfirmCodeSendAgainEvent value)? sendAgain,
    TResult? Function(UpdateFcmTokenAndPlatformType value)?
        updateFcmTokenAndPlatformType,
    TResult? Function(ConfirmCodeCheckMessageEvent value)? loginWithOption,
  }) {
    return updateFcmTokenAndPlatformType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConfirmCodeEventInitial value)? initial,
    TResult Function(ConfirmCodePhoneChangeEvent value)? phoneChanged,
    TResult Function(ConfirmCodeSendAgainEvent value)? sendAgain,
    TResult Function(UpdateFcmTokenAndPlatformType value)?
        updateFcmTokenAndPlatformType,
    TResult Function(ConfirmCodeCheckMessageEvent value)? loginWithOption,
    required TResult orElse(),
  }) {
    if (updateFcmTokenAndPlatformType != null) {
      return updateFcmTokenAndPlatformType(this);
    }
    return orElse();
  }
}

abstract class UpdateFcmTokenAndPlatformType implements ConfirmCodeEvent {
  const factory UpdateFcmTokenAndPlatformType() =
      _$UpdateFcmTokenAndPlatformTypeImpl;
}

/// @nodoc
abstract class _$$ConfirmCodeCheckMessageEventImplCopyWith<$Res> {
  factory _$$ConfirmCodeCheckMessageEventImplCopyWith(
          _$ConfirmCodeCheckMessageEventImpl value,
          $Res Function(_$ConfirmCodeCheckMessageEventImpl) then) =
      __$$ConfirmCodeCheckMessageEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String otp, String smsId, String phone, Map<dynamic, dynamic> data});
}

/// @nodoc
class __$$ConfirmCodeCheckMessageEventImplCopyWithImpl<$Res>
    extends _$ConfirmCodeEventCopyWithImpl<$Res,
        _$ConfirmCodeCheckMessageEventImpl>
    implements _$$ConfirmCodeCheckMessageEventImplCopyWith<$Res> {
  __$$ConfirmCodeCheckMessageEventImplCopyWithImpl(
      _$ConfirmCodeCheckMessageEventImpl _value,
      $Res Function(_$ConfirmCodeCheckMessageEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
    Object? smsId = null,
    Object? phone = null,
    Object? data = null,
  }) {
    return _then(_$ConfirmCodeCheckMessageEventImpl(
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      smsId: null == smsId
          ? _value.smsId
          : smsId // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ));
  }
}

/// @nodoc

class _$ConfirmCodeCheckMessageEventImpl
    implements ConfirmCodeCheckMessageEvent {
  const _$ConfirmCodeCheckMessageEventImpl(
      {required this.otp,
      required this.smsId,
      required this.phone,
      required final Map<dynamic, dynamic> data})
      : _data = data;

  @override
  final String otp;
  @override
  final String smsId;
  @override
  final String phone;
  final Map<dynamic, dynamic> _data;
  @override
  Map<dynamic, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'ConfirmCodeEvent.loginWithOption(otp: $otp, smsId: $smsId, phone: $phone, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmCodeCheckMessageEventImpl &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.smsId, smsId) || other.smsId == smsId) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, otp, smsId, phone,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmCodeCheckMessageEventImplCopyWith<
          _$ConfirmCodeCheckMessageEventImpl>
      get copyWith => __$$ConfirmCodeCheckMessageEventImplCopyWithImpl<
          _$ConfirmCodeCheckMessageEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) phoneChanged,
    required TResult Function(String value) sendAgain,
    required TResult Function() updateFcmTokenAndPlatformType,
    required TResult Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)
        loginWithOption,
  }) {
    return loginWithOption(otp, smsId, phone, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? phoneChanged,
    TResult? Function(String value)? sendAgain,
    TResult? Function()? updateFcmTokenAndPlatformType,
    TResult? Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)?
        loginWithOption,
  }) {
    return loginWithOption?.call(otp, smsId, phone, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? phoneChanged,
    TResult Function(String value)? sendAgain,
    TResult Function()? updateFcmTokenAndPlatformType,
    TResult Function(
            String otp, String smsId, String phone, Map<dynamic, dynamic> data)?
        loginWithOption,
    required TResult orElse(),
  }) {
    if (loginWithOption != null) {
      return loginWithOption(otp, smsId, phone, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConfirmCodeEventInitial value) initial,
    required TResult Function(ConfirmCodePhoneChangeEvent value) phoneChanged,
    required TResult Function(ConfirmCodeSendAgainEvent value) sendAgain,
    required TResult Function(UpdateFcmTokenAndPlatformType value)
        updateFcmTokenAndPlatformType,
    required TResult Function(ConfirmCodeCheckMessageEvent value)
        loginWithOption,
  }) {
    return loginWithOption(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConfirmCodeEventInitial value)? initial,
    TResult? Function(ConfirmCodePhoneChangeEvent value)? phoneChanged,
    TResult? Function(ConfirmCodeSendAgainEvent value)? sendAgain,
    TResult? Function(UpdateFcmTokenAndPlatformType value)?
        updateFcmTokenAndPlatformType,
    TResult? Function(ConfirmCodeCheckMessageEvent value)? loginWithOption,
  }) {
    return loginWithOption?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConfirmCodeEventInitial value)? initial,
    TResult Function(ConfirmCodePhoneChangeEvent value)? phoneChanged,
    TResult Function(ConfirmCodeSendAgainEvent value)? sendAgain,
    TResult Function(UpdateFcmTokenAndPlatformType value)?
        updateFcmTokenAndPlatformType,
    TResult Function(ConfirmCodeCheckMessageEvent value)? loginWithOption,
    required TResult orElse(),
  }) {
    if (loginWithOption != null) {
      return loginWithOption(this);
    }
    return orElse();
  }
}

abstract class ConfirmCodeCheckMessageEvent implements ConfirmCodeEvent {
  const factory ConfirmCodeCheckMessageEvent(
          {required final String otp,
          required final String smsId,
          required final String phone,
          required final Map<dynamic, dynamic> data}) =
      _$ConfirmCodeCheckMessageEventImpl;

  String get otp;
  String get smsId;
  String get phone;
  Map<dynamic, dynamic> get data;
  @JsonKey(ignore: true)
  _$$ConfirmCodeCheckMessageEventImplCopyWith<
          _$ConfirmCodeCheckMessageEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ConfirmCodeState {
  String get smsId => throw _privateConstructorUsedError;
  bool get isReverseSendCode => throw _privateConstructorUsedError;
  bool get isUserFound => throw _privateConstructorUsedError;
  bool get shouldUpdateFcmTokenAndPlatformType =>
      throw _privateConstructorUsedError;
  Map<dynamic, dynamic> get data => throw _privateConstructorUsedError;
  ConfirmCodeStatus get confirmCodeStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfirmCodeStateCopyWith<ConfirmCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmCodeStateCopyWith<$Res> {
  factory $ConfirmCodeStateCopyWith(
          ConfirmCodeState value, $Res Function(ConfirmCodeState) then) =
      _$ConfirmCodeStateCopyWithImpl<$Res, ConfirmCodeState>;
  @useResult
  $Res call(
      {String smsId,
      bool isReverseSendCode,
      bool isUserFound,
      bool shouldUpdateFcmTokenAndPlatformType,
      Map<dynamic, dynamic> data,
      ConfirmCodeStatus confirmCodeStatus});
}

/// @nodoc
class _$ConfirmCodeStateCopyWithImpl<$Res, $Val extends ConfirmCodeState>
    implements $ConfirmCodeStateCopyWith<$Res> {
  _$ConfirmCodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smsId = null,
    Object? isReverseSendCode = null,
    Object? isUserFound = null,
    Object? shouldUpdateFcmTokenAndPlatformType = null,
    Object? data = null,
    Object? confirmCodeStatus = null,
  }) {
    return _then(_value.copyWith(
      smsId: null == smsId
          ? _value.smsId
          : smsId // ignore: cast_nullable_to_non_nullable
              as String,
      isReverseSendCode: null == isReverseSendCode
          ? _value.isReverseSendCode
          : isReverseSendCode // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserFound: null == isUserFound
          ? _value.isUserFound
          : isUserFound // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldUpdateFcmTokenAndPlatformType: null ==
              shouldUpdateFcmTokenAndPlatformType
          ? _value.shouldUpdateFcmTokenAndPlatformType
          : shouldUpdateFcmTokenAndPlatformType // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      confirmCodeStatus: null == confirmCodeStatus
          ? _value.confirmCodeStatus
          : confirmCodeStatus // ignore: cast_nullable_to_non_nullable
              as ConfirmCodeStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfirmCodeStateImplCopyWith<$Res>
    implements $ConfirmCodeStateCopyWith<$Res> {
  factory _$$ConfirmCodeStateImplCopyWith(_$ConfirmCodeStateImpl value,
          $Res Function(_$ConfirmCodeStateImpl) then) =
      __$$ConfirmCodeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String smsId,
      bool isReverseSendCode,
      bool isUserFound,
      bool shouldUpdateFcmTokenAndPlatformType,
      Map<dynamic, dynamic> data,
      ConfirmCodeStatus confirmCodeStatus});
}

/// @nodoc
class __$$ConfirmCodeStateImplCopyWithImpl<$Res>
    extends _$ConfirmCodeStateCopyWithImpl<$Res, _$ConfirmCodeStateImpl>
    implements _$$ConfirmCodeStateImplCopyWith<$Res> {
  __$$ConfirmCodeStateImplCopyWithImpl(_$ConfirmCodeStateImpl _value,
      $Res Function(_$ConfirmCodeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smsId = null,
    Object? isReverseSendCode = null,
    Object? isUserFound = null,
    Object? shouldUpdateFcmTokenAndPlatformType = null,
    Object? data = null,
    Object? confirmCodeStatus = null,
  }) {
    return _then(_$ConfirmCodeStateImpl(
      smsId: null == smsId
          ? _value.smsId
          : smsId // ignore: cast_nullable_to_non_nullable
              as String,
      isReverseSendCode: null == isReverseSendCode
          ? _value.isReverseSendCode
          : isReverseSendCode // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserFound: null == isUserFound
          ? _value.isUserFound
          : isUserFound // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldUpdateFcmTokenAndPlatformType: null ==
              shouldUpdateFcmTokenAndPlatformType
          ? _value.shouldUpdateFcmTokenAndPlatformType
          : shouldUpdateFcmTokenAndPlatformType // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      confirmCodeStatus: null == confirmCodeStatus
          ? _value.confirmCodeStatus
          : confirmCodeStatus // ignore: cast_nullable_to_non_nullable
              as ConfirmCodeStatus,
    ));
  }
}

/// @nodoc

class _$ConfirmCodeStateImpl implements _ConfirmCodeState {
  const _$ConfirmCodeStateImpl(
      {this.smsId = '',
      this.isReverseSendCode = false,
      this.isUserFound = false,
      this.shouldUpdateFcmTokenAndPlatformType = false,
      final Map<dynamic, dynamic> data = const {},
      this.confirmCodeStatus = ConfirmCodeStatus.initial})
      : _data = data;

  @override
  @JsonKey()
  final String smsId;
  @override
  @JsonKey()
  final bool isReverseSendCode;
  @override
  @JsonKey()
  final bool isUserFound;
  @override
  @JsonKey()
  final bool shouldUpdateFcmTokenAndPlatformType;
  final Map<dynamic, dynamic> _data;
  @override
  @JsonKey()
  Map<dynamic, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  @JsonKey()
  final ConfirmCodeStatus confirmCodeStatus;

  @override
  String toString() {
    return 'ConfirmCodeState(smsId: $smsId, isReverseSendCode: $isReverseSendCode, isUserFound: $isUserFound, shouldUpdateFcmTokenAndPlatformType: $shouldUpdateFcmTokenAndPlatformType, data: $data, confirmCodeStatus: $confirmCodeStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmCodeStateImpl &&
            (identical(other.smsId, smsId) || other.smsId == smsId) &&
            (identical(other.isReverseSendCode, isReverseSendCode) ||
                other.isReverseSendCode == isReverseSendCode) &&
            (identical(other.isUserFound, isUserFound) ||
                other.isUserFound == isUserFound) &&
            (identical(other.shouldUpdateFcmTokenAndPlatformType,
                    shouldUpdateFcmTokenAndPlatformType) ||
                other.shouldUpdateFcmTokenAndPlatformType ==
                    shouldUpdateFcmTokenAndPlatformType) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.confirmCodeStatus, confirmCodeStatus) ||
                other.confirmCodeStatus == confirmCodeStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      smsId,
      isReverseSendCode,
      isUserFound,
      shouldUpdateFcmTokenAndPlatformType,
      const DeepCollectionEquality().hash(_data),
      confirmCodeStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmCodeStateImplCopyWith<_$ConfirmCodeStateImpl> get copyWith =>
      __$$ConfirmCodeStateImplCopyWithImpl<_$ConfirmCodeStateImpl>(
          this, _$identity);
}

abstract class _ConfirmCodeState implements ConfirmCodeState {
  const factory _ConfirmCodeState(
      {final String smsId,
      final bool isReverseSendCode,
      final bool isUserFound,
      final bool shouldUpdateFcmTokenAndPlatformType,
      final Map<dynamic, dynamic> data,
      final ConfirmCodeStatus confirmCodeStatus}) = _$ConfirmCodeStateImpl;

  @override
  String get smsId;
  @override
  bool get isReverseSendCode;
  @override
  bool get isUserFound;
  @override
  bool get shouldUpdateFcmTokenAndPlatformType;
  @override
  Map<dynamic, dynamic> get data;
  @override
  ConfirmCodeStatus get confirmCodeStatus;
  @override
  @JsonKey(ignore: true)
  _$$ConfirmCodeStateImplCopyWith<_$ConfirmCodeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
