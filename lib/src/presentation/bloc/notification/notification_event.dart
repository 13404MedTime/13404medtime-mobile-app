part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.getNotifications({
    required Function onSuccess,
  }) = GetNotificationsEvent;

  const factory NotificationEvent.readNotifications() = ReadNotificationsEvent;

  const factory NotificationEvent.paginationNotifications({
    @Default(0) int offset,
    @Default(10) int limit,
  }) = PaginationNotificationsEvent;
}
