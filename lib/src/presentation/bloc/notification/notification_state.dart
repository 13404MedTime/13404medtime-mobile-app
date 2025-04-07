part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default([]) List<NotificationData> notifications,
    @Default(0) int offset,
    @Default(0) int count,
    @Default(NotificationStatus.initial) NotificationStatus notificationStatus,
  }) = _NotificationState;
}

enum NotificationStatus { initial, loading, error, success, pagination, paginationEnd }
