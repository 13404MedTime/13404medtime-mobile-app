part of 'subscription_bloc.dart';

@freezed
class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState({
    @Default(false) bool isLoading,
    @Default([]) List<SubscriptionItem> subscriptions,
  }) = _SubscriptionState;
}
