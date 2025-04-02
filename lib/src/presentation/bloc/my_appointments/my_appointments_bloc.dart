import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../config/router/app_routes.dart';
import '../../../core/constants/constants.dart';
import '../../../core/extension/extension.dart';
import '../../../core/services/notification_service.dart';
import '../../../data/models/my_appointments/my_appointments_response.dart';
import '../../../data/models/my_appointments/switch_response.dart';
import '../../../domain/repositories/home/home_repository.dart';
import '../../components/snack/snack.dart';

part 'my_appointments_bloc.freezed.dart';
part 'my_appointments_event.dart';
part 'my_appointments_state.dart';

class MyAppointmentsBloc extends Bloc<MyAppointmentsEvent, MyAppointmentsState> {
  MyAppointmentsBloc(this.homeRepository) : super(const MyAppointmentsState()) {
    on<GetAppointmentsEvent>(_getAppointments);
    on<GetInitialData>(_getInitialData);
    on<UpdateDrugStatus>(_updateDrugStatus);
  }

  final HomeRepository homeRepository;

  void _getInitialData(
    GetInitialData event,
    Emitter<MyAppointmentsState> emit,
  ) {
    emit(state.copyWith(switchData: event.switchData));
  }

  Future<void> _getAppointments(
    GetAppointmentsEvent event,
    Emitter<MyAppointmentsState> emit,
  ) async {
    emit(state.copyWith(status: AppointmentStatus.loading));
    final response = await homeRepository.getMyAppointments(
      jsonEncode({
        'offset': 0,
        'cleints_id': localSource.userId,
        'with_relations': true,
        'time_take': {
          '\$gte': DateTime.now().copyWith(hour: 0, minute: 0, second: 0).toIso8601String(),
          '\$lt': DateTime.now().copyWith(hour: 0, minute: 0, second: 0).add(const Duration(days: 2)).toIso8601String()
        }
      }),
    );
    await response.fold(
      (error) {
        emit(state.copyWith(status: AppointmentStatus.error));
      },
      (r) async {
        await _sortAppointmentsByDay(r, emit);
      },
    );
  }

  Future<void> _updateDrugStatus(
    UpdateDrugStatus event,
    Emitter<MyAppointmentsState> emit,
  ) async {
    final List<SwitchDetailModel> todayData = state.switchData.today;
    todayData[event.index] = todayData[event.index].copyWith(isTake: event.value);
    emit(
      state.copyWith(
        isMedicineLoading: true,
        changedItemIndex: () => event.index,
        switchData: state.switchData.copyWith(today: todayData),
      ),
    );
    final response = await homeRepository.updateDrugStatus(
      {
        'data': {
          'is_take': event.value,
          'guid': state.switchData.today[event.index].guid,
        },
      },
    );
    await response.fold(
      (e) {
        final List<SwitchDetailModel> todayData = state.switchData.today;
        todayData[event.index] = todayData[event.index].copyWith(isTake: !event.value);
        emit(
          state.copyWith(
            changedItemIndex: () => null,
            isMedicineLoading: false,
            switchData: state.switchData.copyWith(today: todayData),
          ),
        );
        Snack.showSnackBar(
          event.context,
          event.context.translate('try_again'),
          hasError: true,
        );
      },
      (r) async {
        event.onSuccess();
        if (event.value) {
          Snack.showSnackBar(
            event.context,
            event.context.translate('be_healthy'),
          );
          await cancelNotificationById(
            '${state.switchData.today[event.index].guid}-${state.switchData.today[event.index].date}'.hashCode,
          );
        }
        await homeRepository.updateOneMedicine(
          'medicine_taking',
          {
            'data': {
              'app_id': Constants.apiKey,
              'limit': 1,
              'guid': todayData[event.index].medicineTakingId,
            }
          },
        );
        emit(state.copyWith(
          isMedicineLoading: false,
          changedItemIndex: () => null,
        ));
      },
    );
  }

  /// --------------------------------------------------------

  Future<void> _sortAppointmentsByDay(
    List<MyAppointModel> appointments,
    Emitter<MyAppointmentsState> emit,
  ) async {
    final now = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    final tomorrow = now.add(const Duration(days: 1));
    final todayData = <SwitchDetailModel>[];
    final tomorrowData = <SwitchDetailModel>[];

    final List<String> deletedNotifications = localSource.getDeletedMedicineIds;

    for (var i = 0; i < appointments.length; i++) {
      final data = appointments[i];

      if (deletedNotifications.contains(data.medicineTakingId) || data.medicineTakingId == null) {
        continue;
      }

      /// parse [dateTime] fromApi
      final DateTime date = DateTime.parse(data.timeTake?.replaceAll('Z', '') ?? '');
      final dateParse = date.copyWith(hour: (date.hour + 5) % 24);
      final dateWithOutTime = DateTime(dateParse.year, dateParse.month, dateParse.day);

      final appointment = SwitchDetailModel(
        medicineTakingId: data.medicineTakingId ?? '',
        naznachenieId: data.naznachenieId ?? '',
        guid: data.guid ?? '',
        date: data.timeTake ?? '',
        imageUrl: data.preparatiIdData?.drugPhoto ?? 'photo',
        title: data.preparatiIdData?.drugs ?? '',
        desc: data.naznachenieIdData?.illName ?? '',
        dateTime: dateParse.toIso8601String().hhmm,
        isTake: data.isTake ?? false,
        notificationId: '${data.medicineTakingId}|${data.timeTake}',
        branchName: ((data.preparatiId ?? '').isEmpty ? data.preparatName : data.preparatiIdData?.brandName) ?? '',
      );

      if (dateWithOutTime == now || dateWithOutTime == tomorrow) {
        if (dateWithOutTime == now) {
          todayData.add(appointment);
        } else if (dateWithOutTime == tomorrow) {
          tomorrowData.add(appointment);
        }
      }
    }
    todayData.sort((a, b) {
      final DateTime? dateA = a.dateTime.hhmmToDateTime;
      final DateTime? dateB = b.dateTime.hhmmToDateTime;
      return dateA != null && dateB != null ? dateA.compareTo(dateB) : -1;
    });
    tomorrowData.sort((a, b) {
      final DateTime? dateA = a.dateTime.hhmmToDateTime;
      final DateTime? dateB = b.dateTime.hhmmToDateTime;
      return dateA != null && dateB != null ? dateA.compareTo(dateB) : -1;
    });
    emit(
      state.copyWith(
        myAppointments: appointments,
        switchData: SwitchModel(today: todayData, tomorrow: tomorrowData),
        status: AppointmentStatus.success,
      ),
    );
  }
}

enum AppointmentStatus { initial, loading, success, error }
