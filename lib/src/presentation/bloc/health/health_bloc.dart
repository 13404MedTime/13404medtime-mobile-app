import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health/health.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/router/app_routes.dart';
import '../../../core/constants/constants.dart';
import '../../../core/extension/extension.dart';
import '../../../core/utils/base_functions.dart';
import '../../../data/models/health/arterial_pressure_response.dart';
import '../../../data/models/health/blood_sugar_response.dart';
import '../../../data/models/health/pedometer_response.dart';
import '../../../data/models/health/twn_response.dart';
import '../../../domain/repositories/health/health_repository_impl.dart';
import '../../../injector_container.dart';
import '../../pages/main/health/args/health_args.dart';

part 'health_bloc.freezed.dart';

part 'health_event.dart';

part 'health_state.dart';

class HealthBloc extends Bloc<HealthEvent, HealthState> {
  HealthBloc(this.repository) : super(const HealthState()) {
    on<GetPedometerEvent>(_getPedometer);
    on<GetArterialPressureEvent>(_getArterialPressure);
    on<GetBloodSugarEvent>(_getBloodSugar);
    on<GetTWHEvent>(_getTWH);
    on<GetStepsCountOf3DayEvent>(_getStepsCountOf3Day);
    on<AddSubHealthEvent>(_addSubHealth);
    on<UpdatedPedometerIsUpdatedEvent>(_updatePedometerState);
    on<UpdatedArterialPressureIsUpdatedEvent>(_updateArterialPressureState);
    on<GetStepsCountOfTodayEvent>(_getStepsCountOfToday);

    /// google sign
    // on<GetHealthInfoEvent>(_getHeathInfo);
    // on<GoogleSignOutEvent>(_googleSignOut);
    on<GoogleFitInstallationEvent>(_remindMeGoogleFitInstallation);
    on<GoogleFitRegistrationEvent>(_remindMeGoogleFitRegistration);
    on<GetGoogleFitInstallationStatusEvent>(_isInstalledGoogleFit);
    on<PushPlayMarketForInstallGoogleFitEvent>(
      _pushPlayMarketForInstallGoogleFit,
    );
    on<PushGoogleFitForRegistrationEvent>(_pushGoogleFitForRegistration);
  }

  final HealthRepository repository;

  Future<void> _getStepsCountOfToday(
    GetStepsCountOfTodayEvent event,
    Emitter<HealthState> emit,
  ) async {
    if (Platform.isAndroid) return;
    await Permission.activityRecognition.request();
    await Permission.location.request();
    int? steps;
    if (Platform.isAndroid) {
      const String direct = 'com.google.android.apps.fitness';
      final bool isInstalled = await DeviceApps.isAppInstalled(direct);
      await localSource.setGoogleFitInstalledStatus(
        isGoogleFitInstalled: isInstalled,
      );
    }
    final DateTime now = DateTime.now();
    final startTime = DateTime(now.year, now.month, now.day);
    final authorized = await healthService.authorize();
    final List<PedometerModel> pedometerList = [...state.pedometerList];
    steps = await healthService.getStepsCountWithDate(
      startTime: startTime,
      endTime: now,
    );
    if (steps != null && pedometerList.isEmpty) {
      DateTime date = DateTime(now.year, now.month, now.day).subtract(
        const Duration(days: 29),
      );
      for (int i = 1; i <= 30; i++) {
        final int? steps = await healthService.getStepsCountWithDate(
          startTime: date,
          endTime: date.add(const Duration(days: 1)),
        );
        pedometerList.add(
          PedometerModel(
            date: DateFormat('dd.MM.yyyy HH:mm').format(date),
            stepCount: steps,
            distance: ((steps ?? 0) ~/ 2) / 1000,
            hour: ((steps ?? 0) ~/ 85) ~/ 60,
            minutes: ((steps ?? 0) ~/ 85) % 60,
          ),
        );
        date = date.add(const Duration(days: 1));
      }
    }
    if (steps != null && pedometerList.isNotEmpty) {
      pedometerList
        ..removeLast()
        ..add(
          PedometerModel(
            date: DateFormat('dd.MM.yyyy HH:mm').format(now),
            stepCount: steps,
            distance: (steps ~/ 2) / 1000,
            hour: (steps ~/ 85) ~/ 60,
            minutes: (steps ~/ 85) % 60,
          ),
        );
    }

    if ((steps ?? 0) > 0 && steps != null && steps != state.stepsCount) {
      unawaited(
        repository.addHealth(
          path: 'walk',
          request: {
            'data': {
              'multi': <dynamic>[],
              'cleints_id': localSource.userId,
              'distance': (steps ~/ 2) / 1000,
              'step_count': steps,
              'hour': (steps ~/ 85) ~/ 60,
              'minutes': (steps ~/ 85) % 60,
              'date': DateFormat('dd.MM.yyyy HH:mm').format(now),
            }
          },
        ),
      );
    }
    emit(
      state.copyWith(
        remindMeGivePermissionAppleHealth: !authorized,
        stepsCount: steps ?? 0,
        pedometerList: steps != null ? pedometerList : [],
        hours: now.hour,
        minutes: now.minute,
        isLoading: false,
      ),
    );
    // } else {
    //   const String direct = 'com.google.android.apps.fitness';
    //   isInstalled = await DeviceApps.isAppInstalled(direct);
    //   await localSource.setGoogleFitInstalledStatus(
    //     isGoogleFitInstalled: isInstalled,
    //   );
    //
    //
    //   emit(state.copyWith(
    //     remindMeGoogleFitInstallationLater:
    //         state.remindMeGoogleFitInstallationLater
    //             ? isInstalled
    //                 ? false
    //                 : true
    //             : false,
    //     remindMeGoogleFitRegistrationLater:
    //         state.remindMeGoogleFitInstallationLater
    //             ? isInstalled
    //                 ? localSource.shouldGoogleFitRemind
    //                     ? true
    //                     : false
    //                 : false
    //             : true,
    //     stepsCount: steps ?? 0,
    //     hours: now.hour,
    //     minutes: now.minute,
    //     isLoading: false,
    //   ));
    // }
  }

  Future<void> _getStepsCountOf3Day(
    GetStepsCountOf3DayEvent event,
    Emitter<HealthState> emit,
  ) async {
    if (Platform.isAndroid) return;
    final DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day).subtract(
      const Duration(days: 3),
    );
    for (int i = 0; i < 3; i++) {
      final int? steps = await healthService.getStepsCountWithDate(
        startTime: date,
        endTime: date.add(const Duration(days: 1)),
      );
      if (steps == null) return;
      unawaited(
        repository.addHealth(
          path: 'walk',
          request: {
            'data': {
              'multi': <dynamic>[],
              'cleints_id': localSource.userId,
              'distance': (steps ~/ 2) / 1000,
              'step_count': steps,
              'hour': (steps ~/ 85) ~/ 60,
              'minutes': (steps ~/ 85) % 60,
              'date': DateFormat('dd.MM.yyyy HH:mm').format(date),
            }
          },
        ),
      );
      date = date.add(const Duration(days: 1));
    }
  }

  Future<void> _getPedometer(
    GetPedometerEvent event,
    Emitter<HealthState> emit,
  ) async {
    if (Platform.isAndroid) {
      final response = await repository.getPedometer(
        {
          'data': {
            'pipelines': jsonEncode([
              {
                '\$addFields': {
                  'convertedDate': {
                    '\$dateToString': {
                      'format': '%Y-%m-%dT%H:%M:%SZ',
                      'date': {'\$toDate': '\$date'}
                    }
                  }
                }
              },
              {
                '\$match': {
                  'cleints_id': {'\$eq': localSource.userId},
                  'convertedDate': {
                    '\$gte': DateTime.now()
                        .subtract(const Duration(days: 30))
                        .formatDateTimeZ
                  }
                }
              }
            ]),
          }
        },
      );

      response.fold(
        (error) {},
        (r) {
          emit(state.copyWith(pedometerList: r));
        },
      );
    }
  }

  Future<void> _getArterialPressure(
    GetArterialPressureEvent event,
    Emitter<HealthState> emit,
  ) async {
    if (Platform.isIOS) {
      final now = DateTime.now();
      final result = await healthService.getArterialPressure(
          startTime: now.subtract(const Duration(days: 30)), endTime: now);
      emit(state.copyWith(
        arterialPressureList: result,
      ));
    } else {
      final response = await repository.getArterialPressure({
        'data': {
          'pipelines': jsonEncode([
            {
              '\$addFields': {
                'convertedDate': {
                  '\$dateToString': {
                    'format': '%Y-%m-%dT%H:%M:%SZ',
                    'date': {'\$toDate': '\$date'}
                  }
                }
              }
            },
            {
              '\$sort': {'date': -1}
            },
            {
              '\$match': {
                'cleints_id': {'\$eq': localSource.userId},
                'convertedDate': {
                  '\$gte': DateTime.now()
                      .subtract(const Duration(days: 30))
                      .formatDateTimeZ
                }
              }
            }
          ]),
        }
      });
      response.fold(
        (error) {},
        (r) {
          emit(state.copyWith(arterialPressureList: r));
        },
      );
    }
  }

  Future<void> _getBloodSugar(
    GetBloodSugarEvent event,
    Emitter<HealthState> emit,
  ) async {
    if (Platform.isIOS) {
      final now = DateTime.now();
      final result = await healthService.getBloodSugar(
          startTime: now.subtract(const Duration(days: 30)), endTime: now);
      emit(state.copyWith(bloodSugarList: result));
    } else {
      final response = await repository.getBloodSugar(
        {
          'data': {
            'pipelines': jsonEncode([
              {
                '\$addFields': {
                  'convertedDate': {
                    '\$dateToString': {
                      'format': '%Y-%m-%dT%H:%M:%SZ',
                      'date': {'\$toDate': '\$date'}
                    }
                  }
                }
              },
              {
                '\$sort': {'date': -1}
              },
              {
                '\$match': {
                  'cleints_id': {'\$eq': localSource.userId},
                  'convertedDate': {
                    '\$gte': DateTime.now()
                        .subtract(const Duration(days: 30))
                        .formatDateTimeZ
                  }
                }
              }
            ]),
          }
        },
      );
      response.fold(
        (error) {},
        (r) {
          emit(state.copyWith(bloodSugarList: r));
        },
      );
    }
  }

  Future<void> _getTWH(
    GetTWHEvent event,
    Emitter<HealthState> emit,
  ) async {
    if (Platform.isIOS) {
      final now = DateTime.now();
      final result = await healthService.getTWH(
        startTime: now.subtract(const Duration(days: 29)),
        endTime: now,
      );
      emit(state.copyWith(twhList: result));
    } else {
      final response = await repository.getTWH(
        {
          'data': {
            'pipelines': jsonEncode([
              {
                '\$addFields': {
                  'convertedDate': {
                    '\$dateToString': {
                      'format': '%Y-%m-%dT%H:%M:%SZ',
                      'date': {
                        '\$toDate': '\$date',
                      }
                    }
                  }
                }
              },
              {
                '\$sort': {'date': -1}
              },
              {
                '\$match': {
                  'cleints_id': {'\$eq': localSource.userId},
                  'convertedDate': {
                    '\$gte': DateTime.now()
                        .subtract(const Duration(days: 30))
                        .formatDateTimeZ
                  }
                }
              }
            ]),
          }
        },
      );
      response.fold(
        (error) {},
        (r) {
          emit(state.copyWith(twhList: r));
        },
      );
    }
  }

  Future<void> _addSubHealth(
    AddSubHealthEvent event,
    Emitter<HealthState> emit,
  ) async {
    _changeLoading(type: event.type, isLoading: true, emit: emit);
    final response = await repository.addHealth(
      path: getTableSlug(event.type),
      request: event.request,
    );
    await response.fold(
      (error) {
        _changeLoading(type: event.type, isLoading: false, emit: emit);
      },
      (r) async {
        String tag = '';
        switch (event.type) {
          case SubHealthType.pedometer:
            tag = FirebaseAnalyticsEvents.addAPedometerBtn;
          case SubHealthType.arterialPressure:
            tag = FirebaseAnalyticsEvents.addBloodPressure;
          case SubHealthType.bloodSugar:
            tag = FirebaseAnalyticsEvents.addBloodSugarBtn;
          case SubHealthType.twh:
            tag = FirebaseAnalyticsEvents.addTWHBtn;
        }
        await sendAnalyticsEvent(
          tag: tag,
          parameters: {'user_name': localSource.firstName},
        );
        _changeLoading(type: event.type, isLoading: false, emit: emit);
      },
    );
  }

  Future<void> _updatePedometerState(
    UpdatedPedometerIsUpdatedEvent event,
    Emitter<HealthState> emit,
  ) async {
    emit(state.copyWith(isUpdatedPedometer: event.isUpdate));
  }

  Future<void> _updateArterialPressureState(
    UpdatedArterialPressureIsUpdatedEvent event,
    Emitter<HealthState> emit,
  ) async {
    emit(state.copyWith(isUpdatedArterialPressure: event.isUpdate));
  }

  void _changeLoading({
    required bool isLoading,
    required SubHealthType type,
    required Emitter<HealthState> emit,
  }) {
    switch (type) {
      case SubHealthType.pedometer:
        emit(state.copyWith(pedometerLoading: isLoading));
      case SubHealthType.arterialPressure:
        emit(state.copyWith(arterialPressureLoading: isLoading));
      case SubHealthType.bloodSugar:
        emit(state.copyWith(bloodSugarLoading: isLoading));
      case SubHealthType.twh:
        emit(state.copyWith(twhLoading: isLoading));
    }
  }

  String getTableSlug(SubHealthType type) {
    switch (type) {
      case SubHealthType.pedometer:
        return 'walk';
      case SubHealthType.arterialPressure:
        return 'puls';
      case SubHealthType.bloodSugar:
        return 'blood_sugar';
      case SubHealthType.twh:
        return 'imt';
    }
  }

  /// *******************************************************
  Future<void> _pushGoogleFitForRegistration(
    PushGoogleFitForRegistrationEvent event,
    Emitter<HealthState> emit,
  ) async {
    log('GGG -> _pushGoogleFitForRegistration');

    final health = Health();
    final bool authorized = await health.requestAuthorization(
      [HealthDataType.STEPS],
      permissions: [HealthDataAccess.READ],
    );

    if (!authorized) {
      log('GGG -> authorized == false');
      emit(state.copyWith(remindMeGoogleFitRegistrationLater: true));
      await localSource.setRegisteredFromGoogleFitStatus(
        isRegisteredFromGoogleFit: false,
      );
    } else {
      log('GGG -> authorized == true');

      final DateTime now = DateTime.now();
      final startTime = DateTime(now.year, now.month, now.day);
      final int? steps = await health.getTotalStepsInInterval(startTime, now);
      log('GGG -> steps => $steps');

      if (steps == null) {
        emit(state.copyWith(
          stepsCount: steps ?? 0,
          hours: now.hour,
          minutes: now.minute,
          remindMeGoogleFitRegistrationLater: true,
        ));

        await localSource.setRegisteredFromGoogleFitStatus(
          isRegisteredFromGoogleFit: false,
        );

        await DeviceApps.openApp(
          'com.google.android.apps.fitness',
        );
      } else {
        await localSource.setRegisteredFromGoogleFitStatus(
          isRegisteredFromGoogleFit: true,
        );
        emit(
          state.copyWith(
            stepsCount: steps,
            hours: now.hour,
            minutes: now.minute,
            remindMeGoogleFitInstallationLater: false,
          ),
        );
      }
    }
  }

  void _remindMeGoogleFitInstallation(
    GoogleFitInstallationEvent event,
    Emitter<HealthState> emit,
  ) {
    event.later
        ? emit(state.copyWith(remindMeGoogleFitInstallationLater: true))
        : emit(state.copyWith(remindMeGoogleFitInstallationLater: false));
  }

  Future<void> _remindMeGoogleFitRegistration(
    GoogleFitRegistrationEvent event,
    Emitter<HealthState> emit,
  ) async {
    await localSource.setGoogleFitRegistrationRemindStatus(
      shouldGoogleFitRemind: event.later ? true : false,
    );

    event.later
        ? emit(state.copyWith(
            remindMeGoogleFitRegistrationLater: true,
            showGoogleFitRegistrationDialog: false,
          ))
        : emit(state.copyWith(remindMeGoogleFitRegistrationLater: false));
  }

  Future<bool?> _isInstalledGoogleFit(
    GetGoogleFitInstallationStatusEvent event,
    Emitter<HealthState> emit,
  ) async {
    const String direct = 'com.google.android.apps.fitness';
    bool isInstalled = false;
    isInstalled = await DeviceApps.isAppInstalled(direct);
    await localSource.setGoogleFitInstalledStatus(
      isGoogleFitInstalled: isInstalled,
    );

    return isInstalled;
  }

  Future<void> _pushPlayMarketForInstallGoogleFit(
    PushPlayMarketForInstallGoogleFitEvent event,
    Emitter<HealthState> emit,
  ) async {
    if (event.isFromDialog) {
      Navigator.pop(event.context);
    }
    emit(state.copyWith(isLoading: true));

    const String direct = 'com.google.android.apps.fitness';

    const String url = 'market://details?id=$direct';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      log('Could not launch $url');
    }
    emit(state.copyWith(remindMeGoogleFitInstallationLater: true));
  }

// Future<int?> _getHeathInfo(
//   GetHealthInfoEvent event,
//   Emitter<HealthState> emit,
// ) async {
//   emit(state.copyWith(isLoading: true));
//   try {
//     final register = await _getHealthData(emit);
//     emit(state.copyWith(
//       stepsCount: register,
//       isLoading: false,
//       remindMeGoogleFitRegistrationLater: false,
//     ));
//   } on Exception catch (e) {
//     log('Error getting health info: $e');
//     emit(state.copyWith(
//       isLoading: false,
//       remindMeGoogleFitRegistrationLater: true,
//     ));
//   }
// }
//
// Future<dynamic> _getHealthData(
//   Emitter<HealthState> emit,
// ) async {
//   bool registered = false;
//   int? steps;
//
//   final toDate = DateTime.now();
//   final fromDate = DateTime(toDate.year, toDate.month, toDate.day);
//
//   final health = Health();
//   final types = [HealthDataType.STEPS];
//
//   if (Platform.isAndroid) {
//     // First check if we have permissions
//     final bool? hasPermissions = await health.hasPermissions(types);
//     if (hasPermissions == false) {
//       registered = await health.requestAuthorization(types);
//       if (!registered) {
//         emit(state.copyWith(
//           remindMeGoogleFitRegistrationLater: true,
//         ));
//         return 0;
//       }
//     }
//
//     // Check if Google Fit is installed
//     const String direct = 'com.google.android.apps.fitness';
//     final bool isInstalled = await DeviceApps.isAppInstalled(direct);
//     await localSource.setGoogleFitInstalledStatus(
//       isGoogleFitInstalled: isInstalled,
//     );
//
//     if (!isInstalled) {
//       emit(state.copyWith(
//         remindMeGoogleFitInstallationLater: true,
//       ));
//       return 0;
//     }
//
//     // Try to get steps data
//     try {
//       steps = await health.getTotalStepsInInterval(fromDate, toDate);
//       if (steps != null) {
//         await localSource.setRegisteredFromGoogleFitStatus(
//           isRegisteredFromGoogleFit: true,
//         );
//       } else {
//         // If no steps data, try to open Google Fit
//         await DeviceApps.openApp('com.google.android.apps.fitness');
//         emit(state.copyWith(
//           remindMeGoogleFitRegistrationLater: true,
//         ));
//       }
//     } on Exception catch (e) {
//       log('Error getting steps data: $e');
//       emit(state.copyWith(
//         remindMeGoogleFitRegistrationLater: true,
//       ));
//     }
//   }
//
//   log('### steps ==> $steps');
//   return steps;
// }
//
// Future<void> _googleSignOut(
//   GoogleSignOutEvent event,
//   Emitter<HealthState> emit,
// ) async {
//   try {
//     final googleSignIn = GoogleSignIn();
//     emit(state.copyWith(isLoading: true));
//     await googleSignIn.signOut();
//     await localSource.setRegisteredFromGoogleFitStatus(
//       isRegisteredFromGoogleFit: false,
//     );
//     await localSource.setGoogleFitRegistrationRemindStatus(
//       shouldGoogleFitRemind: true,
//     );
//
//     emit(
//       state.copyWith(
//         isLoading: false,
//         remindMeGoogleFitRegistrationLater: false,
//         stepsCount: 0,
//         pedometerList: [],
//       ),
//     );
//   } on Exception catch (e) {
//     log('Error signing out: $e');
//     emit(state.copyWith(isLoading: false));
//   }
// }
}
