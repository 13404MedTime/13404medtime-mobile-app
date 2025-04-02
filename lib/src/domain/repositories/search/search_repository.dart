import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/connectivity/network_info.dart';
import '../../../core/constants/constants.dart';
import '../../../core/either_dart/either.dart';
import '../../../data/models/consultation/doctors_types_response.dart';
import '../../../data/models/home/get_searched/get_searched_request.dart';
import '../../../data/models/my_appointments/my_appointments_response.dart';
import '../../../data/models/search_model/search_appointments_response.dart';
import '../../network/api_client.dart';
import '../../network/failure.dart';
import '../../network/server_error.dart';

part 'search_repository_impl.dart';

abstract class SearchRepository {
  const SearchRepository();

  Future<Either<Failure, List<SearchAppointResponse>>> getSearchedAppointments(GetSearchedRequest request);

  Future<Either<Failure, List<DoctorIdData>>> getSearchedDoctors(GetSearchedRequest request);

  Future<Either<Failure, List<DoctorTypeModel>>> getSearchedCategories(GetSearchedRequest request);
}
