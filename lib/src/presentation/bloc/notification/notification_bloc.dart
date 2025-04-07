import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../config/router/app_routes.dart';
import '../../../core/constants/constants.dart';
import '../../../core/extension/extension.dart';
import '../../../core/utils/base_functions.dart';
import '../../../data/models/home/notification/notifications_response.dart';
import '../../../domain/repositories/notification/notification_repository.dart';

part 'notification_bloc.freezed.dart';
part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc(this.repository) : super(const NotificationState()) {
    on<ReadNotificationsEvent>(_readNotifications);
    on<GetNotificationsEvent>(_getNotifications);
    on<PaginationNotificationsEvent>(_getNotificationsPagination);
  }

  NotificationRepository repository;

  Future<void> _readNotifications(ReadNotificationsEvent event, Emitter<NotificationState> emit) async {
    final response = await repository.readNotifications(
      {
        'data': {
          'app_id': Constants.apiKey,
          'client_id': localSource.userId,
        }
      },
    );
    response.fold(
      (l) {},
      (r) {},
    );
  }

  Future<void> _getNotificationsPagination(
    PaginationNotificationsEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(
      state.copyWith(
        notificationStatus: NotificationStatus.pagination,
        offset: state.offset + 10,
      ),
    );
    final result = await repository.getNotifications(request: {
      'data': {'app_id': Constants.apiKey, 'client_id': localSource.userId, 'offset': state.offset, 'limit': 10},
    }
        // limit: 10,
        // offset: state.offset,
        // data: jsonEncode({
        //   'client_id': localSource.userId,
        //   'time_take': {
        //     '\$lte':
        //         DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(DateTime.now()),
        //   },
        //   'with_relations': true
        // }),
        );
    result.fold((l) {}, (r) {
      if ((r.notificationData ?? []).isNotEmpty) {
        emit(
          state.copyWith(
            notificationStatus: NotificationStatus.success,
            notifications: state.notifications + (r.notificationData ?? []),
          ),
        );
      } else {
        emit(
          state.copyWith(
            notificationStatus: NotificationStatus.paginationEnd,
          ),
        );
      }
    });
  }

  Future<void> _getNotifications(GetNotificationsEvent event, Emitter<NotificationState> emit) async {
    emit(state.copyWith(notificationStatus: NotificationStatus.loading));
    final response = await repository.getNotifications(request: {
      'data': {'app_id': Constants.apiKey, 'client_id': localSource.userId, 'offset': 0, 'limit': 10},
    });
    response.fold(
      (l) {
        emit(
          state.copyWith(
            notificationStatus: NotificationStatus.initial,
          ),
        );
      },
      (r) {
        add(const NotificationEvent.readNotifications());
        final now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
        final birthDate = localSource.dateOfBirth.toDateTime2;
        final notifBirhtDate = DateTime(
          now.year,
          birthDate.month,
          birthDate.day,
        );
        List birth = [];
        if (now == notifBirhtDate) {
          birth = [
            NotificationData(
              title: getBirthText().keys.first,
              body: getBirthText().values.first,
              timeTake: now.toIso8601String(),
              isBirthData: true,
            )
          ];
        }
        emit(
          state.copyWith(
            notifications: [...birth, ...r.notificationData ?? []],
            notificationStatus: NotificationStatus.success,
          ),
        );
      },
    );
  }
}
