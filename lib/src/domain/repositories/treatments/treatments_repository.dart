import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../config/router/app_routes.dart';
import '../../../core/connectivity/network_info.dart';
import '../../../core/constants/constants.dart';
import '../../../core/either_dart/either.dart';
import '../../../data/models/add_medicine/metrics/metrics_response.dart';
import '../../../data/models/treatments/medicine_taking/medicine_taking_response.dart';
import '../../network/api_client.dart';
import '../../network/failure.dart';
import '../../network/server_error.dart';

part 'treatments_repository_impl.dart';

abstract class TreatmentsRepository {
  const TreatmentsRepository();

  Future<Either<Failure, MedicineTakingResponse>> getMedicineTaking({
    required int limit,
    required int offset,
  });

  Future<Either<Failure, bool>> deleteMedicine(String medicineId);

  Future<Either<Failure, Metrics>> getMetrics();
}
