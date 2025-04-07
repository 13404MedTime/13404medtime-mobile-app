import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/connectivity/network_info.dart';
import '../../../core/constants/constants.dart';
import '../../../core/either_dart/either.dart';
import '../../../data/models/add_medicine/get_drugs/get_drugs_response.dart';
import '../../../data/models/add_medicine/metrics/metrics_response.dart';
import '../../network/api_client.dart';
import '../../network/failure.dart';
import '../../network/server_error.dart';

part 'add_medicine_repository_impl.dart';

sealed class AddMedicineRepository {
  const AddMedicineRepository();

  Future<Either<Failure, Metrics>> getMetrics();

  Future<Either<Failure, DrugsResponse>> getDrugs(String search);

  Future<Either<Failure, bool>> saveMedication(Map<String, dynamic> body);
}
