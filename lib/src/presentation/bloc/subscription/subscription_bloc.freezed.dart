// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubscriptionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSubscriptionTypes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSubscriptionTypes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSubscriptionTypes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSubscriptionEvent value) getSubscriptionTypes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSubscriptionEvent value)? getSubscriptionTypes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSubscriptionEvent value)? getSubscriptionTypes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionEventCopyWith<$Res> {
  factory $SubscriptionEventCopyWith(
          SubscriptionEvent value, $Res Function(SubscriptionEvent) then) =
      _$SubscriptionEventCopyWithImpl<$Res, SubscriptionEvent>;
}

/// @nodoc
class _$SubscriptionEventCopyWithImpl<$Res, $Val extends SubscriptionEvent>
    implements $SubscriptionEventCopyWith<$Res> {
  _$SubscriptionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetSubscriptionEventImplCopyWith<$Res> {
  factory _$$GetSubscriptionEventImplCopyWith(_$GetSubscriptionEventImpl value,
          $Res Function(_$GetSubscriptionEventImpl) then) =
      __$$GetSubscriptionEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetSubscriptionEventImplCopyWithImpl<$Res>
    extends _$SubscriptionEventCopyWithImpl<$Res, _$GetSubscriptionEventImpl>
    implements _$$GetSubscriptionEventImplCopyWith<$Res> {
  __$$GetSubscriptionEventImplCopyWithImpl(_$GetSubscriptionEventImpl _value,
      $Res Function(_$GetSubscriptionEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetSubscriptionEventImpl implements GetSubscriptionEvent {
  const _$GetSubscriptionEventImpl();

  @override
  String toString() {
    return 'SubscriptionEvent.getSubscriptionTypes()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSubscriptionEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSubscriptionTypes,
  }) {
    return getSubscriptionTypes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSubscriptionTypes,
  }) {
    return getSubscriptionTypes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSubscriptionTypes,
    required TResult orElse(),
  }) {
    if (getSubscriptionTypes != null) {
      return getSubscriptionTypes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSubscriptionEvent value) getSubscriptionTypes,
  }) {
    return getSubscriptionTypes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSubscriptionEvent value)? getSubscriptionTypes,
  }) {
    return getSubscriptionTypes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSubscriptionEvent value)? getSubscriptionTypes,
    required TResult orElse(),
  }) {
    if (getSubscriptionTypes != null) {
      return getSubscriptionTypes(this);
    }
    return orElse();
  }
}

abstract class GetSubscriptionEvent implements SubscriptionEvent {
  const factory GetSubscriptionEvent() = _$GetSubscriptionEventImpl;
}

/// @nodoc
mixin _$SubscriptionState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<SubscriptionItem> get subscriptions =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubscriptionStateCopyWith<SubscriptionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionStateCopyWith<$Res> {
  factory $SubscriptionStateCopyWith(
          SubscriptionState value, $Res Function(SubscriptionState) then) =
      _$SubscriptionStateCopyWithImpl<$Res, SubscriptionState>;
  @useResult
  $Res call({bool isLoading, List<SubscriptionItem> subscriptions});
}

/// @nodoc
class _$SubscriptionStateCopyWithImpl<$Res, $Val extends SubscriptionState>
    implements $SubscriptionStateCopyWith<$Res> {
  _$SubscriptionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? subscriptions = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      subscriptions: null == subscriptions
          ? _value.subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionStateImplCopyWith<$Res>
    implements $SubscriptionStateCopyWith<$Res> {
  factory _$$SubscriptionStateImplCopyWith(_$SubscriptionStateImpl value,
          $Res Function(_$SubscriptionStateImpl) then) =
      __$$SubscriptionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<SubscriptionItem> subscriptions});
}

/// @nodoc
class __$$SubscriptionStateImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$SubscriptionStateImpl>
    implements _$$SubscriptionStateImplCopyWith<$Res> {
  __$$SubscriptionStateImplCopyWithImpl(_$SubscriptionStateImpl _value,
      $Res Function(_$SubscriptionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? subscriptions = null,
  }) {
    return _then(_$SubscriptionStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      subscriptions: null == subscriptions
          ? _value._subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionItem>,
    ));
  }
}

/// @nodoc

class _$SubscriptionStateImpl implements _SubscriptionState {
  const _$SubscriptionStateImpl(
      {this.isLoading = false,
      final List<SubscriptionItem> subscriptions = const []})
      : _subscriptions = subscriptions;

  @override
  @JsonKey()
  final bool isLoading;
  final List<SubscriptionItem> _subscriptions;
  @override
  @JsonKey()
  List<SubscriptionItem> get subscriptions {
    if (_subscriptions is EqualUnmodifiableListView) return _subscriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subscriptions);
  }

  @override
  String toString() {
    return 'SubscriptionState(isLoading: $isLoading, subscriptions: $subscriptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._subscriptions, _subscriptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_subscriptions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionStateImplCopyWith<_$SubscriptionStateImpl> get copyWith =>
      __$$SubscriptionStateImplCopyWithImpl<_$SubscriptionStateImpl>(
          this, _$identity);
}

abstract class _SubscriptionState implements SubscriptionState {
  const factory _SubscriptionState(
      {final bool isLoading,
      final List<SubscriptionItem> subscriptions}) = _$SubscriptionStateImpl;

  @override
  bool get isLoading;
  @override
  List<SubscriptionItem> get subscriptions;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionStateImplCopyWith<_$SubscriptionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
