import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../../config/router/app_routes.dart';
import '../../../../../../core/connectivity/network_info.dart';
import '../../../../../../core/either_dart/either.dart';
import '../../../../../../data/models/doctor/doctor_main/doctor_home/add_free_time_response.dart';
import '../../../../../network/api_client.dart';
import '../../../../../network/failure.dart';
import '../../../../../network/server_error.dart';

part 'add_free_time_repository_impl.dart';

abstract class AddFreeTimeRepository {
  Future<Either<Failure, AddFreeTimeResponse>> addFreeTime({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, void>> updateFreeTime({
    required Map<String, dynamic> request,
  });
}
