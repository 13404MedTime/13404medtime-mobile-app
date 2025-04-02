import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/mixin/cache_mixin.dart';
import '../../../../core/services/notification_service.dart';
import '../../../../core/utils/base_functions.dart';
import '../../../../data/models/treatments/medicine_taking/medicine_taking_response.dart';
import '../../../../data/source/local_source.dart';
import '../../../../domain/repositories/home/home_repository.dart';
import '../../../../injector_container.dart';
import '../../../additional_mixins/remote_like_mixin.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with RemoteLikeMixin, CacheMixin {
  HomeBloc(this.repository) : super(const HomeState()) {
    on<HomeEventInitial>(_initial);
    on<GetSubscriptionStatusOfUserEvent>(_getSubscriptionStatusOfUser);
    on<GetAppointmentsEvent>(_getAppointments);
    on<GetAppointmentsForSaveEvent>(_getAppointmentsForSave);
    on<GetFavouriteDoctorsEvent>(_getFavouriteDoctors);
    on<OnChangeIsLoading>(_onChangeIsLoading);
    on<GetVisitsEvent>(_getVisits);
    on<GetMedicalHistoryEvent>(_getMedicalHistory);
    on<GetAnalysisSurveyHomeEvent>(_getAnalysisSurvey);
    on<GetUnreadNotificationsCount>(_getUnreadNotificationsCount);
    on<GetBestDistanceAndTimeEvent>(_getBestDistanceAndTimeEvent);
    on<GetAverageDistanceHeartEvent>(_getAverageDistanceAndHeartEvent);
    on<UpdateCurrentAppointmentsCount>(_updateCurrentAppointmentsCount);
    on<LogoutAccountEvent>(_logoutAccount);
    on<GetUpcomingVisitsEvent>(_getUpcomingVisits);
  }

  final HomeRepository repository;

  Future<void> _getSubscriptionStatusOfUser(
    GetSubscriptionStatusOfUserEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(subscriptionStatusLoading: true));
    await repository
        .getSubscriptionStatusOfUser(
          request: jsonEncode({
            'with_relations': true,
            'cleints_id': sl<LocalSource>().userId.isNotEmpty ? sl<LocalSource>().userId : null,
            'status': ['активный'],
          }),
        )
        .then(
          (result) => result.fold(
            (e) => emit(state.copyWith(subscriptionStatusLoading: false)),
            (r) {
              log('---------> here');
              final LocalSource localSource = sl<LocalSource>();
              final SubscriptionStatus? subscription =
                  r.data?.data?.response?.isNotEmpty ?? false ? r.data?.data?.response?.first : null;
              if (r.data?.data?.response?.isNotEmpty ?? false) {
                log('*** subscription id (home) ==> ${subscription?.subscriptionTypesId ?? ''}');
                localSource
                  ..setSubscriptionStatus(isSubscriptionBought: true)
                  ..setSubscriptionId(subscription?.subscriptionTypesId ?? '')
                  ..setSubscriptionNameUz(subscription?.subscriptionTypesIdData?.nameUz ?? '')
                  ..setSubscriptionNameRu(subscription?.subscriptionTypesIdData?.name ?? '')
                  ..setSubscriptionDeadline(subscription?.endDate?.fromApiDateTime.toString() ?? '');
              } else {
                localSource.setSubscriptionStatus(isSubscriptionBought: false);
              }
              emit(state.copyWith(subscriptionStatusLoading: false));
            },
          ),
        );
  }

  Future<void> _getBestDistanceAndTimeEvent(
    GetBestDistanceAndTimeEvent event,
    Emitter<HomeState> emit,
  ) async {
    // if (Platform.isIOS) {
    //   final DateTime now = DateTime.now();
    //   final int? steps = await healthService.getBestSteps(startTime: now);
    //   emit(
    //     state.copyWith(
    //       bestDistance: ((steps ?? 0) ~/ 2) / 1000,
    //       bestTime: (steps ?? 0) ~/ 85,
    //     ),
    //   );
    //   return;
    // } else {
    await repository.getBestDistanceAndTime({
      'data': {
        'app_id': Constants.apiKey,
        'client_id': localSource.userId,
      }
    }).then(
      (result) => result.fold(
        (e) {},
        (r) {
          emit(
            state.copyWith(
              bestDistance: r.bestDistance ?? 0,
              bestTime: r.bestTime ?? 0,
            ),
          );
        },
      ),
    );
  }

  Future<void> _getAverageDistanceAndHeartEvent(
    GetAverageDistanceHeartEvent event,
    Emitter<HomeState> emit,
  ) async {
    await repository.getAverageDistanceHeartEvent({
      'data': {
        'app_id': Constants.apiKey,
        'client_id': localSource.userId,
      }
    }).then(
      (result) => result.fold(
        (e) {},
        (r) {
          emit(
            state.copyWith(
              avarageHeart: r.avarageHeart ?? 0,
              avarageDistance: r.avarageDistance ?? 0,
            ),
          );
        },
      ),
    );
  }

  Future<void> _getUnreadNotificationsCount(
    GetUnreadNotificationsCount event,
    Emitter<HomeState> emit,
  ) async {
    final response = await repository.getUnreadNotificationsCount(
      jsonEncode({
        'client_id': localSource.userId,
        'is_read': false,
        'time_take': {
          '\$lte': DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(DateTime.now().minusFiveHour),
        }
      }),
    );
    response.fold(
      (l) {},
      (r) {
        emit(state.copyWith(unreadNotificationsCount: r));
      },
    );
  }

  Future<void> _initial(HomeEventInitial event, Emitter<HomeState> emit) async {
    await repository.getUserDataAndStatistics({
      'data': {'guid': localSource.userId}
    }).then(
      (result) => result.fold(
        (error) {},
        (r) {
          emit(
            state.copyWith(
              avarageHeart: r.avarageHeart ?? 0,
              avarageDistance: r.avarageDistance ?? 0,
            ),
          );
          setUserInfo(
            printId: '3',
            bloodGroup: r.bloodGroup,
            address: r.address,
            dateOfBirht: r.birthDate?.toApiDateTime,
            lastName: r.clientLastName,
            firstName: r.clientName,
            passportNumber: r.pasport?.checkPassportId,
            phoneNumber: r.phoneNumber,
            amountDoctor: r.amountDoctor,
            amountMedicine: r.amountMedicine,
            amountVisits: r.amountVisits,
            telegramNick: r.telegramNick,
          );
          if (r.birthDate != null && (r.birthDate ?? '').isNotEmpty) {
            try {
              late final DateTime dateBirth = DateTime.parse(r.birthDate?.replaceAll('Z', '') ?? '');
              final now = DateTime.now();
              scheduleNotification(
                id: birthNotifKey,
                title: getBirthText().keys.first,
                body: getBirthText().values.first,
                scheduledNotificationDateTime: DateTime(
                    now.year + (dateBirth.copyWith(year: now.year).difference(now).inDays <= 0 ? 1 : 0),
                    dateBirth.month,
                    dateBirth.day,
                    8),
              );
            } on Exception catch (e) {
              debugPrint('e: $e');
            }
          }
        },
      ),
    );
  }

  Future<void> _getFavouriteDoctors(
    GetFavouriteDoctorsEvent event,
    Emitter<HomeState> emit,
  ) async {
    await getFavouriteDoctors();
  }

  void _onChangeIsLoading(OnChangeIsLoading event, Emitter<HomeState> emit) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  Future<void> _getAppointments(
    GetAppointmentsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isAppointmentsLoading: true, isLoading: true));
    final response = await repository.getMyAppointments(
      jsonEncode({
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
        emit(state.copyWith(isAppointmentsLoading: false, isLoading: false));
      },
      (r) async {
        await _sortAppointmentsByDayNotSave(r, emit);
      },
    );
  }

  Future<void> _getAppointmentsForSave(
    GetAppointmentsForSaveEvent event,
    Emitter<HomeState> emit,
  ) async {
    final userId = localSource.userId;
    final now = DateTime.now();
    final response = await repository.getMyAppointments(
      jsonEncode({
        'cleints_id': localSource.userId,
        'with_relations': true,
        'time_take': {
          '\$gte': now.subtract(const Duration(hours: 5)).toIso8601String(),
          '\$lt': now.add(const Duration(days: 5)).toIso8601String()
        }
      }),
    );
    await response.fold(
      (error) {},
      (r) async {
        if (r.isEmpty) {
          cancelAllNotifications();
          return;
        }
        await _sortAppointmentsByDay(r);
        if (userId != localSource.userId) {
          cancelAllNotifications();
        }
      },
    );
  }

  Future<void> _getVisits(GetVisitsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isVisitsLoading: true, isLoading: true));
    final response = await repository.getMyVisits({
      'data': {'offset': 0, 'with_relations': true, 'limit': 10, 'cleints_id': localSource.userId}
    });
    response.fold(
      (error) {
        emit(state.copyWith(isVisitsLoading: false, isLoading: false));
      },
      (r) {
        emit(
          state.copyWith(
            isVisitsLoading: false,
            isLoading: false,
            myVisits: r.myVisits ?? state.myVisits,
          ),
        );
      },
    );
  }

  Future<void> _getMedicalHistory(
    GetMedicalHistoryEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      isMedicalHistoryLoading: true,
      isLoading: true,
    ));
    final response = await repository.getMedicalHistory(
      GetMedicalHistoryRequest(
        data: {
          'data': {
            'offset': 0,
            'with_relations': true,
            'limit': 5,
            'cleints_id': [localSource.userId]
          }
        },
      ),
    );
    await response.fold(
      (error) {
        emit(state.copyWith(isMedicalHistoryLoading: false, isLoading: false));
      },
      (r) async {
        final List<String> naznachenieIds = [];
        for (int i = 0; i < (r.medicalHistory?.length ?? 0); i++) {
          if (r.medicalHistory?[i].guid != null) {
            naznachenieIds.add(r.medicalHistory![i].guid!);
          }
        }
        if (naznachenieIds.isNotEmpty) {
          await Future.wait([
            _getMedicineNames(naznachenieIds, emit),
            _getMedicationTimes(naznachenieIds, emit),
          ]);
        }
        emit(state.copyWith(
          isMedicalHistoryLoading: false,
          isLoading: false,
          medicalHistoryCount: r.count ?? state.medicalHistoryCount,
          medicalHistory: r.medicalHistory ?? [],
        ));
      },
    );
    emit(state.copyWith(isMedicalHistoryLoading: false, isLoading: false));
  }

  Future<void> _getMedicineNames(
    final List<String> naznachenieIds,
    final Emitter<HomeState> emit,
  ) async {
    final response = await repository.getMedicineTaking(jsonEncode({
      'cleints_id': [localSource.userId],
      'is_from_patient': false,
      'naznachenie_id': naznachenieIds,
      'offset': 0,
      'with_relations': true,
    }));
    response.fold(
      (error) => null,
      (r) {
        final Map<String, List<String>> names = {};
        final Map<String, MedicineTakingModel> drugs = {};
        for (final MedicineTakingModel data in r.medicineTaking ?? []) {
          if (data.guid != null) {
            drugs[data.guid!] = data;
            if (!names.containsKey(data.naznachenieId)) {
              names[data.naznachenieId!] = [];
            }
            names[data.naznachenieId!]?.add(
                (((data.preparatiId ?? '').isEmpty ? data.medicineName : data.preparatiIdData?.brandName) ?? '')
                    .replaceAll('\n', ''));
          }
        }
        emit(state.copyWith(
          medicalHistoryDrugNames: names,
          medicalHistoryDrugs: drugs,
        ));
      },
    );
  }

  Future<void> _getMedicationTimes(
    final List<String> naznachenieIds,
    final Emitter<HomeState> emit,
  ) async {
    final response = await repository.getMedication(
      {
        'data': {
          'naznachenie_id': naznachenieIds,
          'time_take': {
            '\$gte': DateTime.now().copyWith(hour: 0, minute: 0, second: 0).toIso8601String(),
            '\$lt':
                DateTime.now().copyWith(hour: 0, minute: 0, second: 0).add(const Duration(days: 1)).toIso8601String(),
          }
        }
      },
    );
    response.fold(
      (error) => null,
      (r) {
        final Map<String, List<SubPurposeMedicationTimesItem>> medicationTimes = {};
        final DateTime now = DateTime.now();
        for (int i = 0; i < (r.medications?.length ?? 0); i++) {
          if (r.medications![i].timeTake != null) {
            final DateTime? date = r.medications![i].timeTake?.toDateTime;
            if (date != null) {
              r.medications![i].timeTake = date.add(const Duration(hours: 5)).formatDateTime;
            }
          }
        }
        r.medications?.sort((a, b) {
          final DateTime? dateA = a.timeTake?.toDateTime;
          final DateTime? dateB = b.timeTake?.toDateTime;
          return dateA != null && dateB != null ? dateA.compareTo(dateB) : -1;
        });
        for (final MyAppointModel data in r.medications ?? []) {
          if (data.naznachenieId != null && data.preparatiId != null && data.guid != null && data.timeTake != null) {
            if (!medicationTimes.containsKey(data.naznachenieId)) {
              medicationTimes[data.naznachenieId!] = [];
            }
            final DateTime? dateTime = data.timeTake?.toDateTime;
            if (dateTime != null) {
              if (dateTime.day == now.day) {
                medicationTimes[data.naznachenieId]?.add(
                  SubPurposeMedicationTimesItem(
                    data: data,
                    time: dateTime.toHHmm,
                  ),
                );
              }
            }
          }
        }
        emit(state.copyWith(medicationTimes: medicationTimes));
      },
    );
  }

  Future<void> _getAnalysisSurvey(
    GetAnalysisSurveyHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isAnalysisSurveyLoading: true, isLoading: true));
    final response = await repository.getAnalysisSurveyHome(
      AnalysisSurveyHomeRequest(
        data: AnalysisSurveyHomeDataRequest(
          cleintsId: localSource.userId,
          order: AnalysisSurveyHomeOrderRequest(
            createdAt: -1,
          ),
        ),
      ),
    );
    response.fold(
      (error) {
        emit(state.copyWith(isAnalysisSurveyLoading: false, isLoading: false));
      },
      (response) {
        emit(
          state.copyWith(
            isAnalysisSurveyLoading: false,
            isLoading: false,
            analysisCount: (response.data?.data?.count ?? 0).toInt(),
          ),
        );
        localSource.setSurveyCount((response.data?.data?.count ?? 0).toInt());
      },
    );
  }

  /// naznacheniyalani ekranga chiqarish uchun.
  Future<void> _sortAppointmentsByDayNotSave(
    List<MyAppointModel> appointments,
    Emitter<HomeState> emit,
  ) async {
    var currentAppointmentsCount = 0;
    final now = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    final tomorrow = now.add(const Duration(days: 1));
    final todayData = <SwitchDetailModel>[];
    final tomorrowData = <SwitchDetailModel>[];

    for (var i = 0; i < appointments.length; i++) {
      final data = appointments[i];

      /// parse [dateTime] fromApi
      final DateTime date = DateTime.parse(
        data.timeTake?.replaceAll('Z', '') ?? '',
      );
      final dateParse = date.copyWith(hour: (date.hour + 5) % 24);

      final dateWithOutTime = DateTime(
        dateParse.year,
        dateParse.month,
        dateParse.day,
      );

      // sherzod change 8/31/2023
      final appointment = SwitchDetailModel(
        medicineTakingId: data.medicineTakingId ?? '',
        naznachenieId: data.naznachenieId ?? '',
        guid: data.guid ?? '',
        imageUrl: data.preparatiIdData?.drugPhoto ?? 'photo',
        title: data.preparatiIdData?.drugs ?? '',
        desc: data.naznachenieIdData?.illName ?? '',
        dateTime: dateParse.toIso8601String().hhmm,
        date: data.timeTake ?? '',
        isTake: data.isTake ?? false,
        notificationId: '${data.medicineTakingId}|${data.timeTake}',
        branchName: ((data.preparatiId ?? '').isEmpty ? data.preparatName : data.preparatiIdData?.brandName) ?? '',
      );

      if (dateWithOutTime == now || dateWithOutTime == tomorrow) {
        if (dateWithOutTime == now) {
          if (!(data.isTake ?? false)) {
            ++currentAppointmentsCount;
          }
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
        currentAppointmentsCount: currentAppointmentsCount,
        myAppointments: appointments,
        switchData: SwitchModel(today: todayData, tomorrow: tomorrowData),
        isAppointmentsLoading: false,
        isLoading: false,
      ),
    );
  }

  /// this method FOR SAVE NOTIFICATION
  Future<void> _sortAppointmentsByDay(List<MyAppointModel> appointments) async {
    cancelAllNotifications();
    if (appointments.isEmpty) return;
    for (var i = 0; i < appointments.length; i++) {
      final data = appointments[i];

      /// parse [dateTime] fromApi
      final DateTime date = DateTime.parse(
        data.timeTake?.replaceAll('Z', '') ?? '',
      );

      final dateParse = date.add(const Duration(hours: 5));

      final id = '${data.guid}-${data.timeTake ?? ''}';
      final String? name = ((data.preparatiId ?? '').isEmpty ? data.preparatName : data.preparatiIdData?.brandName);
      await scheduleNotification(
        id: id.hashCode,
        title: getLocalText(
          'Dori ichish vaqti keldi!',
          'Время принятия препарата!',
        ),
        body: getLocalText(
          'Sizga dori belgilangan: ${name ?? 'Dori'}',
          'Вам назначен препарат: ${name ?? 'Препарат'}',
        ),
        scheduledNotificationDateTime: dateParse,
      );
    }
  }

  void _updateCurrentAppointmentsCount(
    UpdateCurrentAppointmentsCount event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(currentAppointmentsCount: event.value));
  }

  void _logoutAccount(LogoutAccountEvent event, Emitter<HomeState> emit) {
    emit(const HomeState());
  }

  Future<void> _getUpcomingVisits(GetUpcomingVisitsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isUpcomingVisitsLoading: true));

    emit(state.copyWith(isUpcomingVisitsLoading: false));
  }
}
