import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../data/models/health/arterial_pressure_response.dart';
import '../../data/models/health/blood_sugar_response.dart';
import '../../data/models/health/twn_response.dart';
import '../extension/extension.dart';

sealed class HealthService {
  Future<bool> authorize();

  Future<int?> getStepsCountWithDate({
    required DateTime startTime,
    required DateTime endTime,
  });

  Future<List<ArterialPressureModel>> getArterialPressure({
    required DateTime startTime,
    required DateTime endTime,
  });

  Future<List<BloodSugarModel>> getBloodSugar({
    required DateTime startTime,
    required DateTime endTime,
  });

  Future<List<TWHModel>> getTWH({
    required DateTime startTime,
    required DateTime endTime,
  });
}

class HealthServiceImpl implements HealthService {
  HealthServiceImpl(this.health);

  final Health health;

  @override
  Future<bool> authorize() async {
    if (Platform.isAndroid) {
      await Permission.activityRecognition.request();
    }
    bool authorized = false;
    final types = [
      HealthDataType.STEPS,
      HealthDataType.BODY_TEMPERATURE,
      HealthDataType.WEIGHT,
      HealthDataType.HEIGHT,
      HealthDataType.BODY_MASS_INDEX,
      HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
      HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
      HealthDataType.BLOOD_GLUCOSE,
      HealthDataType.HEART_RATE,
    ];
    final permissions = [
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
    ];
    try {
      bool? hasPermissions = await health.hasPermissions(
        types,
        permissions: permissions,
      );
      hasPermissions ??= false;
      if (!hasPermissions) {
        // requesting access to the data types before reading them
        authorized = await health.requestAuthorization(
          types,
          permissions: permissions,
        );
        log('hasPermissions: $hasPermissions');
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print('Exception in authorize: $error');
      }
    }
    return authorized;
  }

  @override
  Future<int?> getStepsCountWithDate({
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    int? steps;
    try {
      steps = await health.getTotalStepsInInterval(startTime, endTime);
    } on Exception catch (error) {
      if (kDebugMode) {
        print('Caught exception in getTotalStepsInInterval: $error');
      }
    }
    return steps;
  }

  @override
  Future<List<ArterialPressureModel>> getArterialPressure({
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    final List<ArterialPressureModel> pressure = [];
    try {
      final diastolic = await health.getHealthDataFromTypes(
        types: [HealthDataType.BLOOD_PRESSURE_DIASTOLIC],
        startTime: startTime,
        endTime: endTime,
      );
      final systolic = await health.getHealthDataFromTypes(
        types: [HealthDataType.BLOOD_PRESSURE_SYSTOLIC],
        startTime: startTime,
        endTime: endTime,
      );
      final pulse = await health.getHealthDataFromTypes(
        types: [HealthDataType.HEART_RATE],
        startTime: startTime,
        endTime: endTime,
      );
      final Map<String, ArterialPressureModel> map = {};
      for (final i in diastolic) {
        final date = i.dateFrom.toIso8601String().ddMMyyyy;
        map[date] = ArterialPressureModel(
          date: '$date ${i.dateFrom.toIso8601String().hhmm}',
          diastolicheskoe:
              num.tryParse(i.value.toString().substring(34).split(',').join()),
        );
      }
      for (final i in systolic) {
        final date = i.dateFrom.toIso8601String().ddMMyyyy;
        final exist = map[date];
        if (exist != null) {
          map[date] = ArterialPressureModel(
            date: exist.date,
            diastolicheskoe: exist.diastolicheskoe,
            sistolicheskoe: num.tryParse(
                i.value.toString().substring(34).split(',').join()),
          );
        } else {
          map[date] = ArterialPressureModel(
            date: '$date ${i.dateFrom.toIso8601String().hhmm}',
            sistolicheskoe: num.tryParse(
                i.value.toString().substring(34).split(',').join()),
          );
        }
      }
      for (final i in pulse) {
        final date = i.dateFrom.toIso8601String().ddMMyyyy;
        final exist = map[date];
        if (exist != null) {
          map[date] = ArterialPressureModel(
            date: exist.date,
            diastolicheskoe: exist.diastolicheskoe,
            sistolicheskoe: exist.sistolicheskoe,
            pulse: num.tryParse(
                i.value.toString().substring(34).split(',').join()),
          );
        } else {
          map[date] = ArterialPressureModel(
            date: '$date ${i.dateFrom.toIso8601String().hhmm}',
            pulse: num.tryParse(
                i.value.toString().substring(34).split(',').join()),
          );
        }
      }
      return map.values.toList();
    } on Exception catch (error) {
      if (kDebugMode) {
        print('Caught exception in getArterialPressure: $error');
      }
    }
    return pressure;
  }

  @override
  Future<List<BloodSugarModel>> getBloodSugar({
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    final List<BloodSugarModel> bloodSugar = [];
    try {
      final result = await health.getHealthDataFromTypes(
        types: [HealthDataType.BLOOD_GLUCOSE],
        startTime: startTime,
        endTime: endTime,
      );
      for (final i in result) {
        bloodSugar.add(
          BloodSugarModel(
            null,
            null,
            '${i.dateFrom.toIso8601String().ddMMyyyy} ${i.dateFrom.toIso8601String().hhmm}',
            null,
            num.tryParse(i.value
                .toString()
                .substring(35)
                .split(',')
                .join()
                .substring(0, 1)),
          ),
        );
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print('Caught exception in getArterialPressure: $error');
      }
    }
    return bloodSugar;
  }

  @override
  Future<List<TWHModel>> getTWH({
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    final List<TWHModel> twh = [];
    try {
      final temperature = await health.getHealthDataFromTypes(
        types: [HealthDataType.BODY_TEMPERATURE],
        startTime: startTime,
        endTime: endTime,
      );
      final weight = await health.getHealthDataFromTypes(
        types: [HealthDataType.WEIGHT],
        startTime: startTime,
        endTime: endTime,
      );
      final height = await health.getHealthDataFromTypes(
        types: [HealthDataType.HEIGHT],
        startTime: startTime,
        endTime: endTime,
      );
      final bodyMassIndex = await health.getHealthDataFromTypes(
        types: [HealthDataType.BODY_MASS_INDEX],
        startTime: startTime,
        endTime: endTime,
      );
      final Map<String, TWHModel> map = {};
      for (final i in temperature) {
        final date = i.dateFrom.toIso8601String().ddMMyyyy;
        map[date] = TWHModel(
          date: '$date ${i.dateFrom.toIso8601String().hhmm}',
          bodyTemperature:
              num.tryParse(i.value.toString().substring(34).split(',').join()),
        );
      }
      for (final i in weight) {
        final date = i.dateFrom.toIso8601String().ddMMyyyy;
        final exist = map[date];
        if (exist != null) {
          map[date] = TWHModel(
            date: exist.date,
            bodyTemperature: exist.bodyTemperature,
            weight: num.tryParse(
                i.value.toString().substring(34).split(',').join()),
          );
        } else {
          map[date] = TWHModel(
            date: '$date ${i.dateFrom.toIso8601String().hhmm}',
            weight: num.tryParse(
                i.value.toString().substring(34).split(',').join()),
          );
        }
      }
      for (final i in height) {
        final date = i.dateFrom.toIso8601String().ddMMyyyy;
        final exist = map[date];
        if (exist != null) {
          map[date] = TWHModel(
            date: exist.date,
            bodyTemperature: exist.bodyTemperature,
            weight: exist.weight,
            height: num.tryParse(
                i.value.toString().substring(34).split(',').join()),
          );
        } else {
          map[date] = TWHModel(
            date: '$date ${i.dateFrom.toIso8601String().hhmm}',
            height: num.tryParse(
                i.value.toString().substring(34).split(',').join()),
          );
        }
      }
      for (final i in bodyMassIndex) {
        final date = i.dateFrom.toIso8601String().ddMMyyyy;
        final exist = map[date];
        if (exist != null) {
          map[date] = TWHModel(
            date: exist.date,
            bodyTemperature: exist.bodyTemperature,
            weight: exist.weight,
            height: exist.height,
            averageBmi: num.tryParse(
                i.value.toString().substring(34).split(',').join()),
          );
        } else {
          map[date] = TWHModel(
            date: '$date ${i.dateFrom.toIso8601String().hhmm}',
            averageBmi: num.tryParse(
                i.value.toString().substring(34).split(',').join()),
          );
        }
      }
      return map.values.toList();
    } on Exception catch (error) {
      if (kDebugMode) {
        print('Caught exception in getArterialPressure: $error');
      }
    }
    return twh;
  }
}
