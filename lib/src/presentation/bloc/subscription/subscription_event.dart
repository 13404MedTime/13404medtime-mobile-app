part of 'subscription_bloc.dart';

@freezed
class SubscriptionEvent with _$SubscriptionEvent {
  const factory SubscriptionEvent.getSubscriptionTypes() = GetSubscriptionEvent;
}
