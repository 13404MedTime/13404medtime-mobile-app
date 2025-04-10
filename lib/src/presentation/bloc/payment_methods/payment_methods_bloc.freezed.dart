// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_methods_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentMethodsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPaymentMethods,
    required TResult Function() checkPaymentStatus,
    required TResult Function(bool hasError) changeErrorStatus,
    required TResult Function(num subscriptionPrice) payForSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPaymentMethods,
    TResult? Function()? checkPaymentStatus,
    TResult? Function(bool hasError)? changeErrorStatus,
    TResult? Function(num subscriptionPrice)? payForSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPaymentMethods,
    TResult Function()? checkPaymentStatus,
    TResult Function(bool hasError)? changeErrorStatus,
    TResult Function(num subscriptionPrice)? payForSubscription,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPaymentMethodsEvent value) getPaymentMethods,
    required TResult Function(CheckPaymentStatusEvent value) checkPaymentStatus,
    required TResult Function(ChangeErrorStatusEvent value) changeErrorStatus,
    required TResult Function(PayForSubscriptionEvent value) payForSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPaymentMethodsEvent value)? getPaymentMethods,
    TResult? Function(CheckPaymentStatusEvent value)? checkPaymentStatus,
    TResult? Function(ChangeErrorStatusEvent value)? changeErrorStatus,
    TResult? Function(PayForSubscriptionEvent value)? payForSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPaymentMethodsEvent value)? getPaymentMethods,
    TResult Function(CheckPaymentStatusEvent value)? checkPaymentStatus,
    TResult Function(ChangeErrorStatusEvent value)? changeErrorStatus,
    TResult Function(PayForSubscriptionEvent value)? payForSubscription,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodsEventCopyWith<$Res> {
  factory $PaymentMethodsEventCopyWith(
          PaymentMethodsEvent value, $Res Function(PaymentMethodsEvent) then) =
      _$PaymentMethodsEventCopyWithImpl<$Res, PaymentMethodsEvent>;
}

/// @nodoc
class _$PaymentMethodsEventCopyWithImpl<$Res, $Val extends PaymentMethodsEvent>
    implements $PaymentMethodsEventCopyWith<$Res> {
  _$PaymentMethodsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetPaymentMethodsEventImplCopyWith<$Res> {
  factory _$$GetPaymentMethodsEventImplCopyWith(
          _$GetPaymentMethodsEventImpl value,
          $Res Function(_$GetPaymentMethodsEventImpl) then) =
      __$$GetPaymentMethodsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPaymentMethodsEventImplCopyWithImpl<$Res>
    extends _$PaymentMethodsEventCopyWithImpl<$Res,
        _$GetPaymentMethodsEventImpl>
    implements _$$GetPaymentMethodsEventImplCopyWith<$Res> {
  __$$GetPaymentMethodsEventImplCopyWithImpl(
      _$GetPaymentMethodsEventImpl _value,
      $Res Function(_$GetPaymentMethodsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetPaymentMethodsEventImpl implements GetPaymentMethodsEvent {
  const _$GetPaymentMethodsEventImpl();

  @override
  String toString() {
    return 'PaymentMethodsEvent.getPaymentMethods()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPaymentMethodsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPaymentMethods,
    required TResult Function() checkPaymentStatus,
    required TResult Function(bool hasError) changeErrorStatus,
    required TResult Function(num subscriptionPrice) payForSubscription,
  }) {
    return getPaymentMethods();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPaymentMethods,
    TResult? Function()? checkPaymentStatus,
    TResult? Function(bool hasError)? changeErrorStatus,
    TResult? Function(num subscriptionPrice)? payForSubscription,
  }) {
    return getPaymentMethods?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPaymentMethods,
    TResult Function()? checkPaymentStatus,
    TResult Function(bool hasError)? changeErrorStatus,
    TResult Function(num subscriptionPrice)? payForSubscription,
    required TResult orElse(),
  }) {
    if (getPaymentMethods != null) {
      return getPaymentMethods();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPaymentMethodsEvent value) getPaymentMethods,
    required TResult Function(CheckPaymentStatusEvent value) checkPaymentStatus,
    required TResult Function(ChangeErrorStatusEvent value) changeErrorStatus,
    required TResult Function(PayForSubscriptionEvent value) payForSubscription,
  }) {
    return getPaymentMethods(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPaymentMethodsEvent value)? getPaymentMethods,
    TResult? Function(CheckPaymentStatusEvent value)? checkPaymentStatus,
    TResult? Function(ChangeErrorStatusEvent value)? changeErrorStatus,
    TResult? Function(PayForSubscriptionEvent value)? payForSubscription,
  }) {
    return getPaymentMethods?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPaymentMethodsEvent value)? getPaymentMethods,
    TResult Function(CheckPaymentStatusEvent value)? checkPaymentStatus,
    TResult Function(ChangeErrorStatusEvent value)? changeErrorStatus,
    TResult Function(PayForSubscriptionEvent value)? payForSubscription,
    required TResult orElse(),
  }) {
    if (getPaymentMethods != null) {
      return getPaymentMethods(this);
    }
    return orElse();
  }
}

abstract class GetPaymentMethodsEvent implements PaymentMethodsEvent {
  const factory GetPaymentMethodsEvent() = _$GetPaymentMethodsEventImpl;
}

/// @nodoc
abstract class _$$CheckPaymentStatusEventImplCopyWith<$Res> {
  factory _$$CheckPaymentStatusEventImplCopyWith(
          _$CheckPaymentStatusEventImpl value,
          $Res Function(_$CheckPaymentStatusEventImpl) then) =
      __$$CheckPaymentStatusEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckPaymentStatusEventImplCopyWithImpl<$Res>
    extends _$PaymentMethodsEventCopyWithImpl<$Res,
        _$CheckPaymentStatusEventImpl>
    implements _$$CheckPaymentStatusEventImplCopyWith<$Res> {
  __$$CheckPaymentStatusEventImplCopyWithImpl(
      _$CheckPaymentStatusEventImpl _value,
      $Res Function(_$CheckPaymentStatusEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckPaymentStatusEventImpl implements CheckPaymentStatusEvent {
  const _$CheckPaymentStatusEventImpl();

  @override
  String toString() {
    return 'PaymentMethodsEvent.checkPaymentStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckPaymentStatusEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPaymentMethods,
    required TResult Function() checkPaymentStatus,
    required TResult Function(bool hasError) changeErrorStatus,
    required TResult Function(num subscriptionPrice) payForSubscription,
  }) {
    return checkPaymentStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPaymentMethods,
    TResult? Function()? checkPaymentStatus,
    TResult? Function(bool hasError)? changeErrorStatus,
    TResult? Function(num subscriptionPrice)? payForSubscription,
  }) {
    return checkPaymentStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPaymentMethods,
    TResult Function()? checkPaymentStatus,
    TResult Function(bool hasError)? changeErrorStatus,
    TResult Function(num subscriptionPrice)? payForSubscription,
    required TResult orElse(),
  }) {
    if (checkPaymentStatus != null) {
      return checkPaymentStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPaymentMethodsEvent value) getPaymentMethods,
    required TResult Function(CheckPaymentStatusEvent value) checkPaymentStatus,
    required TResult Function(ChangeErrorStatusEvent value) changeErrorStatus,
    required TResult Function(PayForSubscriptionEvent value) payForSubscription,
  }) {
    return checkPaymentStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPaymentMethodsEvent value)? getPaymentMethods,
    TResult? Function(CheckPaymentStatusEvent value)? checkPaymentStatus,
    TResult? Function(ChangeErrorStatusEvent value)? changeErrorStatus,
    TResult? Function(PayForSubscriptionEvent value)? payForSubscription,
  }) {
    return checkPaymentStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPaymentMethodsEvent value)? getPaymentMethods,
    TResult Function(CheckPaymentStatusEvent value)? checkPaymentStatus,
    TResult Function(ChangeErrorStatusEvent value)? changeErrorStatus,
    TResult Function(PayForSubscriptionEvent value)? payForSubscription,
    required TResult orElse(),
  }) {
    if (checkPaymentStatus != null) {
      return checkPaymentStatus(this);
    }
    return orElse();
  }
}

abstract class CheckPaymentStatusEvent implements PaymentMethodsEvent {
  const factory CheckPaymentStatusEvent() = _$CheckPaymentStatusEventImpl;
}

/// @nodoc
abstract class _$$ChangeErrorStatusEventImplCopyWith<$Res> {
  factory _$$ChangeErrorStatusEventImplCopyWith(
          _$ChangeErrorStatusEventImpl value,
          $Res Function(_$ChangeErrorStatusEventImpl) then) =
      __$$ChangeErrorStatusEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool hasError});
}

/// @nodoc
class __$$ChangeErrorStatusEventImplCopyWithImpl<$Res>
    extends _$PaymentMethodsEventCopyWithImpl<$Res,
        _$ChangeErrorStatusEventImpl>
    implements _$$ChangeErrorStatusEventImplCopyWith<$Res> {
  __$$ChangeErrorStatusEventImplCopyWithImpl(
      _$ChangeErrorStatusEventImpl _value,
      $Res Function(_$ChangeErrorStatusEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasError = null,
  }) {
    return _then(_$ChangeErrorStatusEventImpl(
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChangeErrorStatusEventImpl implements ChangeErrorStatusEvent {
  const _$ChangeErrorStatusEventImpl({required this.hasError});

  @override
  final bool hasError;

  @override
  String toString() {
    return 'PaymentMethodsEvent.changeErrorStatus(hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeErrorStatusEventImpl &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hasError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeErrorStatusEventImplCopyWith<_$ChangeErrorStatusEventImpl>
      get copyWith => __$$ChangeErrorStatusEventImplCopyWithImpl<
          _$ChangeErrorStatusEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPaymentMethods,
    required TResult Function() checkPaymentStatus,
    required TResult Function(bool hasError) changeErrorStatus,
    required TResult Function(num subscriptionPrice) payForSubscription,
  }) {
    return changeErrorStatus(hasError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPaymentMethods,
    TResult? Function()? checkPaymentStatus,
    TResult? Function(bool hasError)? changeErrorStatus,
    TResult? Function(num subscriptionPrice)? payForSubscription,
  }) {
    return changeErrorStatus?.call(hasError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPaymentMethods,
    TResult Function()? checkPaymentStatus,
    TResult Function(bool hasError)? changeErrorStatus,
    TResult Function(num subscriptionPrice)? payForSubscription,
    required TResult orElse(),
  }) {
    if (changeErrorStatus != null) {
      return changeErrorStatus(hasError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPaymentMethodsEvent value) getPaymentMethods,
    required TResult Function(CheckPaymentStatusEvent value) checkPaymentStatus,
    required TResult Function(ChangeErrorStatusEvent value) changeErrorStatus,
    required TResult Function(PayForSubscriptionEvent value) payForSubscription,
  }) {
    return changeErrorStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPaymentMethodsEvent value)? getPaymentMethods,
    TResult? Function(CheckPaymentStatusEvent value)? checkPaymentStatus,
    TResult? Function(ChangeErrorStatusEvent value)? changeErrorStatus,
    TResult? Function(PayForSubscriptionEvent value)? payForSubscription,
  }) {
    return changeErrorStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPaymentMethodsEvent value)? getPaymentMethods,
    TResult Function(CheckPaymentStatusEvent value)? checkPaymentStatus,
    TResult Function(ChangeErrorStatusEvent value)? changeErrorStatus,
    TResult Function(PayForSubscriptionEvent value)? payForSubscription,
    required TResult orElse(),
  }) {
    if (changeErrorStatus != null) {
      return changeErrorStatus(this);
    }
    return orElse();
  }
}

abstract class ChangeErrorStatusEvent implements PaymentMethodsEvent {
  const factory ChangeErrorStatusEvent({required final bool hasError}) =
      _$ChangeErrorStatusEventImpl;

  bool get hasError;
  @JsonKey(ignore: true)
  _$$ChangeErrorStatusEventImplCopyWith<_$ChangeErrorStatusEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PayForSubscriptionEventImplCopyWith<$Res> {
  factory _$$PayForSubscriptionEventImplCopyWith(
          _$PayForSubscriptionEventImpl value,
          $Res Function(_$PayForSubscriptionEventImpl) then) =
      __$$PayForSubscriptionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({num subscriptionPrice});
}

/// @nodoc
class __$$PayForSubscriptionEventImplCopyWithImpl<$Res>
    extends _$PaymentMethodsEventCopyWithImpl<$Res,
        _$PayForSubscriptionEventImpl>
    implements _$$PayForSubscriptionEventImplCopyWith<$Res> {
  __$$PayForSubscriptionEventImplCopyWithImpl(
      _$PayForSubscriptionEventImpl _value,
      $Res Function(_$PayForSubscriptionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscriptionPrice = null,
  }) {
    return _then(_$PayForSubscriptionEventImpl(
      subscriptionPrice: null == subscriptionPrice
          ? _value.subscriptionPrice
          : subscriptionPrice // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$PayForSubscriptionEventImpl implements PayForSubscriptionEvent {
  const _$PayForSubscriptionEventImpl({required this.subscriptionPrice});

  @override
  final num subscriptionPrice;

  @override
  String toString() {
    return 'PaymentMethodsEvent.payForSubscription(subscriptionPrice: $subscriptionPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayForSubscriptionEventImpl &&
            (identical(other.subscriptionPrice, subscriptionPrice) ||
                other.subscriptionPrice == subscriptionPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subscriptionPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayForSubscriptionEventImplCopyWith<_$PayForSubscriptionEventImpl>
      get copyWith => __$$PayForSubscriptionEventImplCopyWithImpl<
          _$PayForSubscriptionEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPaymentMethods,
    required TResult Function() checkPaymentStatus,
    required TResult Function(bool hasError) changeErrorStatus,
    required TResult Function(num subscriptionPrice) payForSubscription,
  }) {
    return payForSubscription(subscriptionPrice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPaymentMethods,
    TResult? Function()? checkPaymentStatus,
    TResult? Function(bool hasError)? changeErrorStatus,
    TResult? Function(num subscriptionPrice)? payForSubscription,
  }) {
    return payForSubscription?.call(subscriptionPrice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPaymentMethods,
    TResult Function()? checkPaymentStatus,
    TResult Function(bool hasError)? changeErrorStatus,
    TResult Function(num subscriptionPrice)? payForSubscription,
    required TResult orElse(),
  }) {
    if (payForSubscription != null) {
      return payForSubscription(subscriptionPrice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPaymentMethodsEvent value) getPaymentMethods,
    required TResult Function(CheckPaymentStatusEvent value) checkPaymentStatus,
    required TResult Function(ChangeErrorStatusEvent value) changeErrorStatus,
    required TResult Function(PayForSubscriptionEvent value) payForSubscription,
  }) {
    return payForSubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPaymentMethodsEvent value)? getPaymentMethods,
    TResult? Function(CheckPaymentStatusEvent value)? checkPaymentStatus,
    TResult? Function(ChangeErrorStatusEvent value)? changeErrorStatus,
    TResult? Function(PayForSubscriptionEvent value)? payForSubscription,
  }) {
    return payForSubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPaymentMethodsEvent value)? getPaymentMethods,
    TResult Function(CheckPaymentStatusEvent value)? checkPaymentStatus,
    TResult Function(ChangeErrorStatusEvent value)? changeErrorStatus,
    TResult Function(PayForSubscriptionEvent value)? payForSubscription,
    required TResult orElse(),
  }) {
    if (payForSubscription != null) {
      return payForSubscription(this);
    }
    return orElse();
  }
}

abstract class PayForSubscriptionEvent implements PaymentMethodsEvent {
  const factory PayForSubscriptionEvent(
      {required final num subscriptionPrice}) = _$PayForSubscriptionEventImpl;

  num get subscriptionPrice;
  @JsonKey(ignore: true)
  _$$PayForSubscriptionEventImplCopyWith<_$PayForSubscriptionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentMethodsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get isPaymentSuccess => throw _privateConstructorUsedError;
  List<PaymentItem> get paymentTypes => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  num get price => throw _privateConstructorUsedError;
  int get consultationDays => throw _privateConstructorUsedError;
  String get afterPriceText => throw _privateConstructorUsedError;
  List<String> get features => throw _privateConstructorUsedError;
  String get paymentLink => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentMethodsStateCopyWith<PaymentMethodsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodsStateCopyWith<$Res> {
  factory $PaymentMethodsStateCopyWith(
          PaymentMethodsState value, $Res Function(PaymentMethodsState) then) =
      _$PaymentMethodsStateCopyWithImpl<$Res, PaymentMethodsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      bool isPaymentSuccess,
      List<PaymentItem> paymentTypes,
      String name,
      num price,
      int consultationDays,
      String afterPriceText,
      List<String> features,
      String paymentLink});
}

/// @nodoc
class _$PaymentMethodsStateCopyWithImpl<$Res, $Val extends PaymentMethodsState>
    implements $PaymentMethodsStateCopyWith<$Res> {
  _$PaymentMethodsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? isPaymentSuccess = null,
    Object? paymentTypes = null,
    Object? name = null,
    Object? price = null,
    Object? consultationDays = null,
    Object? afterPriceText = null,
    Object? features = null,
    Object? paymentLink = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentSuccess: null == isPaymentSuccess
          ? _value.isPaymentSuccess
          : isPaymentSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentTypes: null == paymentTypes
          ? _value.paymentTypes
          : paymentTypes // ignore: cast_nullable_to_non_nullable
              as List<PaymentItem>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      consultationDays: null == consultationDays
          ? _value.consultationDays
          : consultationDays // ignore: cast_nullable_to_non_nullable
              as int,
      afterPriceText: null == afterPriceText
          ? _value.afterPriceText
          : afterPriceText // ignore: cast_nullable_to_non_nullable
              as String,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      paymentLink: null == paymentLink
          ? _value.paymentLink
          : paymentLink // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodsStateImplCopyWith<$Res>
    implements $PaymentMethodsStateCopyWith<$Res> {
  factory _$$PaymentMethodsStateImplCopyWith(_$PaymentMethodsStateImpl value,
          $Res Function(_$PaymentMethodsStateImpl) then) =
      __$$PaymentMethodsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      bool isPaymentSuccess,
      List<PaymentItem> paymentTypes,
      String name,
      num price,
      int consultationDays,
      String afterPriceText,
      List<String> features,
      String paymentLink});
}

/// @nodoc
class __$$PaymentMethodsStateImplCopyWithImpl<$Res>
    extends _$PaymentMethodsStateCopyWithImpl<$Res, _$PaymentMethodsStateImpl>
    implements _$$PaymentMethodsStateImplCopyWith<$Res> {
  __$$PaymentMethodsStateImplCopyWithImpl(_$PaymentMethodsStateImpl _value,
      $Res Function(_$PaymentMethodsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? isPaymentSuccess = null,
    Object? paymentTypes = null,
    Object? name = null,
    Object? price = null,
    Object? consultationDays = null,
    Object? afterPriceText = null,
    Object? features = null,
    Object? paymentLink = null,
  }) {
    return _then(_$PaymentMethodsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentSuccess: null == isPaymentSuccess
          ? _value.isPaymentSuccess
          : isPaymentSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentTypes: null == paymentTypes
          ? _value._paymentTypes
          : paymentTypes // ignore: cast_nullable_to_non_nullable
              as List<PaymentItem>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      consultationDays: null == consultationDays
          ? _value.consultationDays
          : consultationDays // ignore: cast_nullable_to_non_nullable
              as int,
      afterPriceText: null == afterPriceText
          ? _value.afterPriceText
          : afterPriceText // ignore: cast_nullable_to_non_nullable
              as String,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      paymentLink: null == paymentLink
          ? _value.paymentLink
          : paymentLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PaymentMethodsStateImpl implements _PaymentMethodsState {
  const _$PaymentMethodsStateImpl(
      {this.isLoading = false,
      this.hasError = false,
      this.isPaymentSuccess = false,
      final List<PaymentItem> paymentTypes = const [],
      this.name = '',
      this.price = 0,
      this.consultationDays = 0,
      this.afterPriceText = '',
      final List<String> features = const [],
      this.paymentLink = ''})
      : _paymentTypes = paymentTypes,
        _features = features;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final bool isPaymentSuccess;
  final List<PaymentItem> _paymentTypes;
  @override
  @JsonKey()
  List<PaymentItem> get paymentTypes {
    if (_paymentTypes is EqualUnmodifiableListView) return _paymentTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentTypes);
  }

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final num price;
  @override
  @JsonKey()
  final int consultationDays;
  @override
  @JsonKey()
  final String afterPriceText;
  final List<String> _features;
  @override
  @JsonKey()
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  @JsonKey()
  final String paymentLink;

  @override
  String toString() {
    return 'PaymentMethodsState(isLoading: $isLoading, hasError: $hasError, isPaymentSuccess: $isPaymentSuccess, paymentTypes: $paymentTypes, name: $name, price: $price, consultationDays: $consultationDays, afterPriceText: $afterPriceText, features: $features, paymentLink: $paymentLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.isPaymentSuccess, isPaymentSuccess) ||
                other.isPaymentSuccess == isPaymentSuccess) &&
            const DeepCollectionEquality()
                .equals(other._paymentTypes, _paymentTypes) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.consultationDays, consultationDays) ||
                other.consultationDays == consultationDays) &&
            (identical(other.afterPriceText, afterPriceText) ||
                other.afterPriceText == afterPriceText) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.paymentLink, paymentLink) ||
                other.paymentLink == paymentLink));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      hasError,
      isPaymentSuccess,
      const DeepCollectionEquality().hash(_paymentTypes),
      name,
      price,
      consultationDays,
      afterPriceText,
      const DeepCollectionEquality().hash(_features),
      paymentLink);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodsStateImplCopyWith<_$PaymentMethodsStateImpl> get copyWith =>
      __$$PaymentMethodsStateImplCopyWithImpl<_$PaymentMethodsStateImpl>(
          this, _$identity);
}

abstract class _PaymentMethodsState implements PaymentMethodsState {
  const factory _PaymentMethodsState(
      {final bool isLoading,
      final bool hasError,
      final bool isPaymentSuccess,
      final List<PaymentItem> paymentTypes,
      final String name,
      final num price,
      final int consultationDays,
      final String afterPriceText,
      final List<String> features,
      final String paymentLink}) = _$PaymentMethodsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  bool get isPaymentSuccess;
  @override
  List<PaymentItem> get paymentTypes;
  @override
  String get name;
  @override
  num get price;
  @override
  int get consultationDays;
  @override
  String get afterPriceText;
  @override
  List<String> get features;
  @override
  String get paymentLink;
  @override
  @JsonKey(ignore: true)
  _$$PaymentMethodsStateImplCopyWith<_$PaymentMethodsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
