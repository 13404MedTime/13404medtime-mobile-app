import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

sealed class HealthService {
  Future<bool> authorize();

  Future<int?> getStepsCountWithDate({
    required DateTime startTime,
    required DateTime endTime,
  });
}

class HealthServiceImpl implements HealthService {
  HealthServiceImpl(this.health);

  final Health health;

  @override
  Future<bool> authorize() async {
    await health.installHealthConnect();
    await health.configure();
    await health.getHealthConnectSdkStatus();
    if (kDebugMode) {
      print('Starting authorization process...');
    }

    if (Platform.isAndroid) {
      if (kDebugMode) {
        print('Requesting activity recognition permission...');
      }
      final status = await Permission.activityRecognition.request();
      if (kDebugMode) {
        print('Activity recognition permission status: $status');
      }
    }
    bool authorized = false;
    try {
      if (kDebugMode) {
        print('Checking existing health permissions...');
      }
      bool? hasPermissions = await health.hasPermissions(
        [HealthDataType.STEPS],
        permissions: [HealthDataAccess.READ],
      );
      hasPermissions ??= false;
      if (kDebugMode) {
        print('Existing permissions status: $hasPermissions');
      }

      if (!hasPermissions) {
        if (kDebugMode) {
          print('Requesting new health permissions...');
        }
        // requesting access to the data types before reading them
        authorized = await health.requestAuthorization(
          [HealthDataType.STEPS],
          permissions: [HealthDataAccess.READ],
        );
        if (kDebugMode) {
          print('Authorization result: $authorized');
        }
      } else {
        if (kDebugMode) {
          print('Permissions already granted');
        }
        authorized = true; // Set to true if permissions already exist
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print('Exception in authorize: $error');
        print('Error type: ${error.runtimeType}');
        print('Error stack trace: ${error.toString()}');
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
      if (kDebugMode) {
        print('Fetching steps from $startTime to $endTime');
      }
      steps = await health.getTotalStepsInInterval(startTime, endTime);
      if (kDebugMode) {
        print('Steps count: $steps');
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print('Caught exception in getTotalStepsInInterval: $error');
        print('Error type: ${error.runtimeType}');
        print('Error stack trace: ${error.toString()}');
      }
    }
    return steps;
  }
}
