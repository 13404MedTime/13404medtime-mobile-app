import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/connectivity/network_info.dart';
import '../../../core/constants/constants.dart';
import '../../../core/either_dart/either.dart';
import '../../../data/models/home/notification/notifications_response.dart';
import '../../network/api_client.dart';
import '../../network/failure.dart';
import '../../network/server_error.dart';

part 'notification_repository_impl.dart';

abstract class NotificationRepository {
  const NotificationRepository();

  Future<Either<Failure, dynamic>> readNotifications(
    Map<String, dynamic> request,
  );

  Future<Either<Failure, NotificationsResponse>> getNotifications({
    required Map<String, dynamic> request,
  });
}
