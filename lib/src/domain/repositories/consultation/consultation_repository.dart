import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../config/router/app_routes.dart';
import '../../../core/connectivity/network_info.dart';
import '../../../core/constants/app_keys.dart';
import '../../../core/constants/constants.dart';
import '../../../core/either_dart/either.dart';
import '../../../data/models/consultation/doctors_response.dart';
import '../../../data/models/consultation/doctors_types_response.dart';
import '../../network/api_client.dart';
import '../../network/failure.dart';
import '../../network/server_error.dart';

part 'consultation_repository_impl.dart';

abstract class ConsultationRepository {
  const ConsultationRepository();

  Future<Either<Failure, DoctorsTypesResponse>> getDoctorsTypes({
    bool isCache = false,
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, DoctorsResponse>> getDoctors({
    required Map<String, dynamic> request,
  });
}
