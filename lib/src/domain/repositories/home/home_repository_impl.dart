part of 'home_repository.dart';

final class HomeRepositoryImpl extends HomeRepository {
  const HomeRepositoryImpl({
    required this.apiClient,
    required this.networkInfo,
  }) : super();

  final ApiClient apiClient;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<MyAppointModel>>> getMyAppointments(
    String request,
  ) async {
    try {
      final response = await apiClient.getMyAppointments(
        request,
        Constants.projectId,
      );
      return Right(response.myAppointments ?? []);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, List<MyAppointModel>>> updateDrugStatus(
    Map<String, dynamic> request,
  ) async {
    try {
      final response = await apiClient.updateDrugStatus(
        request,
        Constants.projectId,
      );
      return Right(response.myAppointments ?? []);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, GetVisitsResponse>> getMyVisits(
    Map<String, dynamic> request,
  ) async {
    try {
      final response = await apiClient.getMyVisits(
        request,
        Constants.projectId,
      );
      return Right(response);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, GetMedicalHistoryResponse>> getMedicalHistory(GetMedicalHistoryRequest request) async {
    try {
      final response = await apiClient.getMedicalHistorySlim(
        Constants.projectId,
        jsonEncode(request.data['data']),
        request.data['data']['limit'],
        request.data['data']['offset'],
      );
      return Right(response);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, GetUserDataResponse>> getUserDataAndStatistics(
    Map<String, dynamic> request,
  ) async {
    try {
      final response = await apiClient.getUserData(request);
      return Right(response);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, AnalysisSurveyHomeResponse>> getAnalysisSurveyHome(
    AnalysisSurveyHomeRequest request,
  ) async {
    try {
      final response = await apiClient.getAnalysisSurveyHome(request);
      return Right(response);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, MedicationResponse>> getMedication(
    Map<String, dynamic> request,
  ) async {
    try {
      final response = await apiClient.getMedicationSlim(
        Constants.projectId,
        jsonEncode(request['data']),
        request['data']['limit'],
        request['data']['offset'],
      );
      return Right(response);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, int>> getUnreadNotificationsCount(
    String request,
  ) async {
    try {
      final response = await apiClient.getUnreadNotificationsCount(
        request,
      );
      return Right(response.count ?? 0);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, AvarageDistanceAndHeart>> getAverageDistanceHeartEvent(
    Map<String, dynamic> request,
  ) async {
    try {
      final response = await apiClient.getAverageDistanceHeartEvent(
        request,
        Constants.projectId,
      );
      return Right(response);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, BestDistanceAndHeart>> getBestDistanceAndTime(
    Map<String, dynamic> request,
  ) async {
    try {
      final response = await apiClient.getBestDistanceAndTime(
        request,
        Constants.projectId,
      );
      return Right(response);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, dynamic>> updateOneMedicine(
    String tableSlug,
    Map<String, dynamic> medicineTakingId,
  ) async {
    try {
      final response = await apiClient.getOneMedicine(
        medicineTakingId,
        tableSlug,
        Constants.projectId,
      );
      return Right(response);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, dynamic>> updateMedicine(
    Map<String, dynamic> medicineTakingId,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        // ignore: unnecessary_nullable_for_final_variable_declarations, inference_failure_on_function_invocation
        final response = await sl<Dio>().put(
          '${Constants.baseUrl}v1/object/medicine_taking',
          data: medicineTakingId,
          queryParameters: {
            'project-id': Constants.projectId,
          },
        );
        return Right(response.data);
      } on DioException catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(
            message: error.toString(),
          ).failure,
        );
      }
    } else {
      return Left(ServerFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, FilesResponse>> getFiles(Map<String, dynamic> body) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.getMedicineFiles(
          body,
          Constants.projectId,
        );
        return Right(response);
      } on DioException catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(
            message: error.toString(),
          ).failure,
        );
      }
    } else {
      return Left(ServerFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, MedicineTakingResponse>> getMedicineTaking(String request) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.getAllMedicineTaking(
          request,
          Constants.projectId,
        );
        // final response = await apiClient.getMedicineTakingSlim(
        //   Constants.projectId,
        //   jsonEncode(request['data']),
        //   request['data']['limit'],
        //   request['data']['offset'],
        // );
        return Right(response);
      } on DioException catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(
            message: error.toString(),
          ).failure,
        );
      }
    } else {
      return Left(ServerFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, SubscriptionTypesResponse>> getSubscriptionTypes({
    required Map<String, dynamic> request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.getSubscriptionTypes(
          request,
          Constants.projectId,
        );
        return Right(response);
      } on DioException catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(
            message: error.toString(),
          ).failure,
        );
      }
    } else {
      return Left(ServerFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, CheckConsultationDaysResponse>> checkConsultationDays({
    required String request,
  }) async {
    try {
      final response = await apiClient.checkConsultationDays(
        request,
        'subscription_report',
      );
      return Right(response);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, PaymentTypesResponse>> getPaymentTypes() async {
    try {
      final response = await apiClient.getPaymentTypes();
      return Right(response);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, PaymentLinkResponse>> getPaymentLink({
    required Map<String, dynamic> request,
  }) async {
    try {
      final response = await apiClient.getPaymentLink(
        request,
        Constants.projectId,
      );
      return Right(response);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, SubscriptionStatusOfUserResponse>> getSubscriptionStatusOfUser({
    required String request,
  }) async {
    try {
      final response = await apiClient.getSubscriptionStatusOfUser(
        Constants.projectId,
        request,
      );
      return Right(response);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, SubscriptionDetailsResponse>> getSubscriptionDetails({
    required String subscriptionId,
  }) async {
    try {
      final response = await apiClient.getSubscriptionDetails(subscriptionId);
      return Right(response);
    } on DioException catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, DoctorPatientResponse>> getPatient({required Map<String, dynamic> request}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.doctorBookings(
          request,
          'Bearer ${localSource.accessToken}',
        );
        return Right(response);
      } on DioException catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(
            message: error.toString(),
          ).failure,
        );
      }
    } else {
      return Left(ServerFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, void>> requestBookDoctor({
    required Map<String, dynamic> request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.createDoctorRequest(
          request,
          'Bearer ${localSource.accessToken}',
        );
        return Right(response);
      } on DioException catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(
            message: error.toString(),
          ).failure,
        );
      }
    } else {
      return Left(ServerFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, DoctorBookingRequestResponse>> getDoctorBookingRequests({
    required Map<String, dynamic> request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.getDoctorBookingRequests(
          request,
          'Bearer ${localSource.accessToken}',
        );
        return Right(response);
      } on DioException catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        debugPrint('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(
            message: error.toString(),
          ).failure,
        );
      }
    } else {
      return Left(ServerFailure(message: 'No Internet Connection'));
    }
  }
}
