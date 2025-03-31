import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/connectivity/network_info.dart';
import '../../../core/constants/constants.dart';
import '../../../core/either_dart/either.dart';
import '../../../data/models/splash/check_for_production_response.dart';
import '../../network/api_client.dart';
import '../../network/failure.dart';
import '../../network/server_error.dart';

part 'splash_repository_impl.dart';

sealed class SplashRepository {
  const SplashRepository();

  Future<Either<Failure, CheckForProductionResponse>> checkForProduction({
    required String version,
  });
}
