import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../config/router/app_routes.dart';
import '../../../core/connectivity/network_info.dart';
import '../../../core/constants/constants.dart';
import '../../../core/either_dart/either.dart';
import '../../../data/models/consultation/check_consultation_days_response.dart';
import '../../../data/models/doctor/doctor_main/doctor_home/doctor_patient_response.dart';
import '../../../data/models/home/get_analysis_survey/analysis_survey_home_request.dart';
import '../../../data/models/home/get_analysis_survey/analysis_survey_home_response.dart';
import '../../../data/models/home/get_medical_history/get_medical_history_request.dart';
import '../../../data/models/home/get_medical_history/get_medical_history_response.dart';
import '../../../data/models/home/get_visits/doctor_booking_request_response.dart';
import '../../../data/models/home/get_visits/get_visits_response.dart';
import '../../../data/models/home/patient_cards/avarage_distance_and_heart.dart';
import '../../../data/models/home/patient_cards/best_distance_and_time.dart';
import '../../../data/models/home/patient_cards/patient_cards_response.dart';
import '../../../data/models/home/payment_types/payment_link_response.dart';
import '../../../data/models/home/payment_types/payment_types_response.dart';
import '../../../data/models/home/subscription_types/subscription_details_response.dart';
import '../../../data/models/home/subscription_types/subscription_status_of_user_response.dart';
import '../../../data/models/home/subscription_types/subscription_types_response.dart';
import '../../../data/models/my_appointments/my_appointments_response.dart';
import '../../../data/models/purpose/files_response.dart';
import '../../../data/models/purpose/medication_response.dart';
import '../../../data/models/treatments/medicine_taking/medicine_taking_response.dart';
import '../../../injector_container.dart';
import '../../network/api_client.dart';
import '../../network/failure.dart';
import '../../network/server_error.dart';

part 'home_repository_impl.dart';

abstract class HomeRepository {
  const HomeRepository();

  Future<Either<Failure, List<MyAppointModel>>> getMyAppointments(
    String request,
  );

  Future<Either<Failure, List<MyAppointModel>>> updateDrugStatus(
    Map<String, dynamic> request,
  );

  Future<Either<Failure, GetVisitsResponse>> getMyVisits(
    Map<String, dynamic> request,
  );

  Future<Either<Failure, GetMedicalHistoryResponse>> getMedicalHistory(
    GetMedicalHistoryRequest request,
  );

  Future<Either<Failure, MedicineTakingResponse>> getMedicineTaking(
    String request,
  );

  Future<Either<Failure, SubscriptionStatusOfUserResponse>> getSubscriptionStatusOfUser({
    required String request,
  });

  Future<Either<Failure, GetUserDataResponse>> getUserDataAndStatistics(
    Map<String, dynamic> request,
  );

  Future<Either<Failure, AvarageDistanceAndHeart>> getAverageDistanceHeartEvent(
    Map<String, dynamic> request,
  );

  Future<Either<Failure, BestDistanceAndHeart>> getBestDistanceAndTime(
    Map<String, dynamic> request,
  );

  Future<Either<Failure, AnalysisSurveyHomeResponse>> getAnalysisSurveyHome(
    AnalysisSurveyHomeRequest request,
  );

  Future<Either<Failure, MedicationResponse>> getMedication(
    Map<String, dynamic> request,
  );

  Future<Either<Failure, int>> getUnreadNotificationsCount(
    String request,
  );

  Future<Either<Failure, dynamic>> updateOneMedicine(
    String tableSlug,
    Map<String, dynamic> medicineTakingId,
  );

  Future<Either<Failure, dynamic>> updateMedicine(
    Map<String, dynamic> medicineTakingId,
  );

  Future<Either<Failure, FilesResponse>> getFiles(Map<String, dynamic> body);

  Future<Either<Failure, SubscriptionTypesResponse>> getSubscriptionTypes({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, SubscriptionDetailsResponse>> getSubscriptionDetails({
    required String subscriptionId,
  });

  Future<Either<Failure, PaymentTypesResponse>> getPaymentTypes();

  Future<Either<Failure, PaymentLinkResponse>> getPaymentLink({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, CheckConsultationDaysResponse>> checkConsultationDays({
    required String request,
  });

  Future<Either<Failure, DoctorPatientResponse>> getPatient({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, DoctorBookingRequestResponse>> getDoctorBookingRequests({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, void>> requestBookDoctor({
    required Map<String, dynamic> request,
  });
}
