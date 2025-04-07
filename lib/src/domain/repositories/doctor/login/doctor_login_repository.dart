import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/connectivity/network_info.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/either_dart/either.dart';
import '../../../../data/models/doctor/login/doctor_login_response.dart';
import '../../../../data/models/doctor/login/one_login_response.dart';
import '../../../network/api_client.dart';
import '../../../network/failure.dart';
import '../../../network/server_error.dart';

part 'doctor_repository_impl.dart';

abstract class DoctorLoginRepository {
  const DoctorLoginRepository();

  Future<Either<Failure, OneLoginResponse>> oneLogin({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, DoctorLoginResponse>> doctorLogin({
    required Map<String, dynamic> request,
  });
}
