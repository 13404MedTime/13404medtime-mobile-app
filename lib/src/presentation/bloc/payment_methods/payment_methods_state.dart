part of 'payment_methods_bloc.dart';

@freezed
class PaymentMethodsState with _$PaymentMethodsState {
  const factory PaymentMethodsState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default(false) bool isPaymentSuccess,
    @Default([]) List<PaymentItem> paymentTypes,
    @Default('') String name,
    @Default(0) num price,
    @Default(0) int consultationDays,
    @Default('') String afterPriceText,
    @Default([]) List<String> features,
    @Default('') String paymentLink,
  }) = _PaymentMethodsState;
}
