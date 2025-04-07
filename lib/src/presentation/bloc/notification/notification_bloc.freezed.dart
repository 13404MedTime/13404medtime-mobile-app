// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Function onSuccess) getNotifications,
    required TResult Function() readNotifications,
    required TResult Function(int offset, int limit) paginationNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Function onSuccess)? getNotifications,
    TResult? Function()? readNotifications,
    TResult? Function(int offset, int limit)? paginationNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Function onSuccess)? getNotifications,
    TResult Function()? readNotifications,
    TResult Function(int offset, int limit)? paginationNotifications,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotificationsEvent value) getNotifications,
    required TResult Function(ReadNotificationsEvent value) readNotifications,
    required TResult Function(PaginationNotificationsEvent value)
        paginationNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotificationsEvent value)? getNotifications,
    TResult? Function(ReadNotificationsEvent value)? readNotifications,
    TResult? Function(PaginationNotificationsEvent value)?
        paginationNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotificationsEvent value)? getNotifications,
    TResult Function(ReadNotificationsEvent value)? readNotifications,
    TResult Function(PaginationNotificationsEvent value)?
        paginationNotifications,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res, NotificationEvent>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res, $Val extends NotificationEvent>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetNotificationsEventImplCopyWith<$Res> {
  factory _$$GetNotificationsEventImplCopyWith(
          _$GetNotificationsEventImpl value,
          $Res Function(_$GetNotificationsEventImpl) then) =
      __$$GetNotificationsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Function onSuccess});
}

/// @nodoc
class __$$GetNotificationsEventImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$GetNotificationsEventImpl>
    implements _$$GetNotificationsEventImplCopyWith<$Res> {
  __$$GetNotificationsEventImplCopyWithImpl(_$GetNotificationsEventImpl _value,
      $Res Function(_$GetNotificationsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onSuccess = null,
  }) {
    return _then(_$GetNotificationsEventImpl(
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as Function,
    ));
  }
}

/// @nodoc

class _$GetNotificationsEventImpl implements GetNotificationsEvent {
  const _$GetNotificationsEventImpl({required this.onSuccess});

  @override
  final Function onSuccess;

  @override
  String toString() {
    return 'NotificationEvent.getNotifications(onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationsEventImpl &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNotificationsEventImplCopyWith<_$GetNotificationsEventImpl>
      get copyWith => __$$GetNotificationsEventImplCopyWithImpl<
          _$GetNotificationsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Function onSuccess) getNotifications,
    required TResult Function() readNotifications,
    required TResult Function(int offset, int limit) paginationNotifications,
  }) {
    return getNotifications(onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Function onSuccess)? getNotifications,
    TResult? Function()? readNotifications,
    TResult? Function(int offset, int limit)? paginationNotifications,
  }) {
    return getNotifications?.call(onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Function onSuccess)? getNotifications,
    TResult Function()? readNotifications,
    TResult Function(int offset, int limit)? paginationNotifications,
    required TResult orElse(),
  }) {
    if (getNotifications != null) {
      return getNotifications(onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotificationsEvent value) getNotifications,
    required TResult Function(ReadNotificationsEvent value) readNotifications,
    required TResult Function(PaginationNotificationsEvent value)
        paginationNotifications,
  }) {
    return getNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotificationsEvent value)? getNotifications,
    TResult? Function(ReadNotificationsEvent value)? readNotifications,
    TResult? Function(PaginationNotificationsEvent value)?
        paginationNotifications,
  }) {
    return getNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotificationsEvent value)? getNotifications,
    TResult Function(ReadNotificationsEvent value)? readNotifications,
    TResult Function(PaginationNotificationsEvent value)?
        paginationNotifications,
    required TResult orElse(),
  }) {
    if (getNotifications != null) {
      return getNotifications(this);
    }
    return orElse();
  }
}

abstract class GetNotificationsEvent implements NotificationEvent {
  const factory GetNotificationsEvent({required final Function onSuccess}) =
      _$GetNotificationsEventImpl;

  Function get onSuccess;
  @JsonKey(ignore: true)
  _$$GetNotificationsEventImplCopyWith<_$GetNotificationsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReadNotificationsEventImplCopyWith<$Res> {
  factory _$$ReadNotificationsEventImplCopyWith(
          _$ReadNotificationsEventImpl value,
          $Res Function(_$ReadNotificationsEventImpl) then) =
      __$$ReadNotificationsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReadNotificationsEventImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$ReadNotificationsEventImpl>
    implements _$$ReadNotificationsEventImplCopyWith<$Res> {
  __$$ReadNotificationsEventImplCopyWithImpl(
      _$ReadNotificationsEventImpl _value,
      $Res Function(_$ReadNotificationsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReadNotificationsEventImpl implements ReadNotificationsEvent {
  const _$ReadNotificationsEventImpl();

  @override
  String toString() {
    return 'NotificationEvent.readNotifications()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadNotificationsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Function onSuccess) getNotifications,
    required TResult Function() readNotifications,
    required TResult Function(int offset, int limit) paginationNotifications,
  }) {
    return readNotifications();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Function onSuccess)? getNotifications,
    TResult? Function()? readNotifications,
    TResult? Function(int offset, int limit)? paginationNotifications,
  }) {
    return readNotifications?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Function onSuccess)? getNotifications,
    TResult Function()? readNotifications,
    TResult Function(int offset, int limit)? paginationNotifications,
    required TResult orElse(),
  }) {
    if (readNotifications != null) {
      return readNotifications();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotificationsEvent value) getNotifications,
    required TResult Function(ReadNotificationsEvent value) readNotifications,
    required TResult Function(PaginationNotificationsEvent value)
        paginationNotifications,
  }) {
    return readNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotificationsEvent value)? getNotifications,
    TResult? Function(ReadNotificationsEvent value)? readNotifications,
    TResult? Function(PaginationNotificationsEvent value)?
        paginationNotifications,
  }) {
    return readNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotificationsEvent value)? getNotifications,
    TResult Function(ReadNotificationsEvent value)? readNotifications,
    TResult Function(PaginationNotificationsEvent value)?
        paginationNotifications,
    required TResult orElse(),
  }) {
    if (readNotifications != null) {
      return readNotifications(this);
    }
    return orElse();
  }
}

abstract class ReadNotificationsEvent implements NotificationEvent {
  const factory ReadNotificationsEvent() = _$ReadNotificationsEventImpl;
}

/// @nodoc
abstract class _$$PaginationNotificationsEventImplCopyWith<$Res> {
  factory _$$PaginationNotificationsEventImplCopyWith(
          _$PaginationNotificationsEventImpl value,
          $Res Function(_$PaginationNotificationsEventImpl) then) =
      __$$PaginationNotificationsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int offset, int limit});
}

/// @nodoc
class __$$PaginationNotificationsEventImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res,
        _$PaginationNotificationsEventImpl>
    implements _$$PaginationNotificationsEventImplCopyWith<$Res> {
  __$$PaginationNotificationsEventImplCopyWithImpl(
      _$PaginationNotificationsEventImpl _value,
      $Res Function(_$PaginationNotificationsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offset = null,
    Object? limit = null,
  }) {
    return _then(_$PaginationNotificationsEventImpl(
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PaginationNotificationsEventImpl
    implements PaginationNotificationsEvent {
  const _$PaginationNotificationsEventImpl({this.offset = 0, this.limit = 10});

  @override
  @JsonKey()
  final int offset;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'NotificationEvent.paginationNotifications(offset: $offset, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationNotificationsEventImpl &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, offset, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationNotificationsEventImplCopyWith<
          _$PaginationNotificationsEventImpl>
      get copyWith => __$$PaginationNotificationsEventImplCopyWithImpl<
          _$PaginationNotificationsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Function onSuccess) getNotifications,
    required TResult Function() readNotifications,
    required TResult Function(int offset, int limit) paginationNotifications,
  }) {
    return paginationNotifications(offset, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Function onSuccess)? getNotifications,
    TResult? Function()? readNotifications,
    TResult? Function(int offset, int limit)? paginationNotifications,
  }) {
    return paginationNotifications?.call(offset, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Function onSuccess)? getNotifications,
    TResult Function()? readNotifications,
    TResult Function(int offset, int limit)? paginationNotifications,
    required TResult orElse(),
  }) {
    if (paginationNotifications != null) {
      return paginationNotifications(offset, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotificationsEvent value) getNotifications,
    required TResult Function(ReadNotificationsEvent value) readNotifications,
    required TResult Function(PaginationNotificationsEvent value)
        paginationNotifications,
  }) {
    return paginationNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotificationsEvent value)? getNotifications,
    TResult? Function(ReadNotificationsEvent value)? readNotifications,
    TResult? Function(PaginationNotificationsEvent value)?
        paginationNotifications,
  }) {
    return paginationNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotificationsEvent value)? getNotifications,
    TResult Function(ReadNotificationsEvent value)? readNotifications,
    TResult Function(PaginationNotificationsEvent value)?
        paginationNotifications,
    required TResult orElse(),
  }) {
    if (paginationNotifications != null) {
      return paginationNotifications(this);
    }
    return orElse();
  }
}

abstract class PaginationNotificationsEvent implements NotificationEvent {
  const factory PaginationNotificationsEvent(
      {final int offset, final int limit}) = _$PaginationNotificationsEventImpl;

  int get offset;
  int get limit;
  @JsonKey(ignore: true)
  _$$PaginationNotificationsEventImplCopyWith<
          _$PaginationNotificationsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotificationState {
  List<NotificationData> get notifications =>
      throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  NotificationStatus get notificationStatus =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationStateCopyWith<NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
  @useResult
  $Res call(
      {List<NotificationData> notifications,
      int offset,
      int count,
      NotificationStatus notificationStatus});
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? offset = null,
    Object? count = null,
    Object? notificationStatus = null,
  }) {
    return _then(_value.copyWith(
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationData>,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      notificationStatus: null == notificationStatus
          ? _value.notificationStatus
          : notificationStatus // ignore: cast_nullable_to_non_nullable
              as NotificationStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationStateImplCopyWith<$Res>
    implements $NotificationStateCopyWith<$Res> {
  factory _$$NotificationStateImplCopyWith(_$NotificationStateImpl value,
          $Res Function(_$NotificationStateImpl) then) =
      __$$NotificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NotificationData> notifications,
      int offset,
      int count,
      NotificationStatus notificationStatus});
}

/// @nodoc
class __$$NotificationStateImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationStateImpl>
    implements _$$NotificationStateImplCopyWith<$Res> {
  __$$NotificationStateImplCopyWithImpl(_$NotificationStateImpl _value,
      $Res Function(_$NotificationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? offset = null,
    Object? count = null,
    Object? notificationStatus = null,
  }) {
    return _then(_$NotificationStateImpl(
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationData>,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      notificationStatus: null == notificationStatus
          ? _value.notificationStatus
          : notificationStatus // ignore: cast_nullable_to_non_nullable
              as NotificationStatus,
    ));
  }
}

/// @nodoc

class _$NotificationStateImpl implements _NotificationState {
  const _$NotificationStateImpl(
      {final List<NotificationData> notifications = const [],
      this.offset = 0,
      this.count = 0,
      this.notificationStatus = NotificationStatus.initial})
      : _notifications = notifications;

  final List<NotificationData> _notifications;
  @override
  @JsonKey()
  List<NotificationData> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  @JsonKey()
  final int offset;
  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final NotificationStatus notificationStatus;

  @override
  String toString() {
    return 'NotificationState(notifications: $notifications, offset: $offset, count: $count, notificationStatus: $notificationStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationStateImpl &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.notificationStatus, notificationStatus) ||
                other.notificationStatus == notificationStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_notifications),
      offset,
      count,
      notificationStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationStateImplCopyWith<_$NotificationStateImpl> get copyWith =>
      __$$NotificationStateImplCopyWithImpl<_$NotificationStateImpl>(
          this, _$identity);
}

abstract class _NotificationState implements NotificationState {
  const factory _NotificationState(
      {final List<NotificationData> notifications,
      final int offset,
      final int count,
      final NotificationStatus notificationStatus}) = _$NotificationStateImpl;

  @override
  List<NotificationData> get notifications;
  @override
  int get offset;
  @override
  int get count;
  @override
  NotificationStatus get notificationStatus;
  @override
  @JsonKey(ignore: true)
  _$$NotificationStateImplCopyWith<_$NotificationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
