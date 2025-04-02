import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/connectivity/network_info.dart';
import '../../../core/constants/constants.dart';
import '../../../core/either_dart/either.dart';
import '../../../data/models/auth/send_code_request.dart';
import '../../../data/models/auth/send_code_response.dart';
import '../../../data/models/auth/verify_request.dart';
import '../../network/api_client.dart';
import '../../network/failure.dart';
import '../../network/server_error.dart';

part 'auth_repository_impl.dart';

abstract class AuthRepository {
  const AuthRepository();

  Future<Either<Failure, SendCodeResponse>> sendCode({
    required SendCodeRequest request,
  });

  Future<Either<Failure, SendCodeResponse>> loginWithOption({required LoginWithOptionRequest request});

  Future<Either<Failure, dynamic>> updateFcmTokenAndPlatformType({
    required Map<String, dynamic> request,
  });
}
