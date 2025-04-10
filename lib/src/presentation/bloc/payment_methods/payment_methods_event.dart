part of 'payment_methods_bloc.dart';

@freezed
class PaymentMethodsEvent with _$PaymentMethodsEvent {
  const factory PaymentMethodsEvent.getPaymentMethods() = GetPaymentMethodsEvent;

  const factory PaymentMethodsEvent.checkPaymentStatus() = CheckPaymentStatusEvent;

  const factory PaymentMethodsEvent.changeErrorStatus({
    required bool hasError,
  }) = ChangeErrorStatusEvent;

  const factory PaymentMethodsEvent.payForSubscription({
    required num subscriptionPrice,
  }) = PayForSubscriptionEvent;
}
