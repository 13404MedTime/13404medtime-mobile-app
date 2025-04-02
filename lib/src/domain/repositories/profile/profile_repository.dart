import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../config/router/app_routes.dart';
import '../../../core/connectivity/network_info.dart';
import '../../../core/constants/constants.dart';
import '../../../core/either_dart/either.dart';
import '../../../data/models/doctor/doctor_main/doctor_home/doctor_patient_response.dart';
import '../../../data/models/profile/get_favourite_doctor/favourite_doctor_response.dart';
import '../../../data/models/profile/profile_edit_request.dart';
import '../../../data/models/profile/profile_response.dart';
import '../../network/api_client.dart';
import '../../network/failure.dart';
import '../../network/server_error.dart';

part 'profile_repository_impl.dart';

abstract class ProfileRepository {
  const ProfileRepository();

  Future<Either<Failure, ProfileResponse>> updateProfile({
    required ProfileEditRequest request,
  });

  Future<Either<Failure, dynamic>> deleteUser();

  Future<Either<Failure, dynamic>> deleteClient();

  Future<Either<Failure, FavouriteDoctorResponse>> getFavouriteDoctors({
    required String request,
  });

  Future<Either<Failure, ProfileResponse>> updateUserLang({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, DoctorPatientResponse>> getPatient({
    required Map<String, dynamic> request,
  });

// Future<Either<Failure, ProfileResponse>> getUserData({
//   required String tableSlug,
//   required String projectId,
// });
}
