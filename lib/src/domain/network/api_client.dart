import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/constants/constants.dart';
import '../../data/models/add_medicine/get_drugs/get_drugs_response.dart';
import '../../data/models/add_medicine/metrics/metrics_response.dart';
import '../../data/models/auth/register/create_health_request.dart';
import '../../data/models/auth/register/register_user_response.dart';
import '../../data/models/auth/send_code_request.dart';
import '../../data/models/auth/send_code_response.dart';
import '../../data/models/auth/verify_request.dart';
import '../../data/models/consultation/check_consultation_days_response.dart';
import '../../data/models/consultation/doctors_response.dart';
import '../../data/models/doctor/doctor_main/doctor_advice/client_medicine_response.dart';
import '../../data/models/doctor/doctor_main/doctor_advice/clients_response.dart';
import '../../data/models/doctor/doctor_main/doctor_advice/get_all_medicine_response.dart';
import '../../data/models/doctor/doctor_main/doctor_advice/send_advice_response.dart';
import '../../data/models/doctor/doctor_main/doctor_advice/unit_of_medicine.dart';
import '../../data/models/doctor/doctor_main/doctor_check/doctor_appointment_response.dart';
import '../../data/models/doctor/doctor_main/doctor_check/doctor_notifications_reponse.dart';
import '../../data/models/doctor/doctor_main/doctor_check/medicine_full_info_response.dart';
import '../../data/models/doctor/doctor_main/doctor_check/patient_medication_response.dart';
import '../../data/models/doctor/doctor_main/doctor_home/add_free_time_response.dart';
import '../../data/models/doctor/doctor_main/doctor_home/doctor_patient_response.dart';
import '../../data/models/doctor/login/doctor_login_response.dart';
import '../../data/models/doctor/login/one_login_response.dart';
import '../../data/models/health/add_health_response.dart';
import '../../data/models/health/arterial_pressure_response.dart';
import '../../data/models/health/blood_sugar_response.dart';
import '../../data/models/health/pedometer_response.dart';
import '../../data/models/health/twn_response.dart';
import '../../data/models/home/get_analysis_survey/analysis_survey_home_request.dart';
import '../../data/models/home/get_analysis_survey/analysis_survey_home_response.dart';
import '../../data/models/home/get_medical_history/get_medical_history_response.dart';
import '../../data/models/home/get_visits/book_doctor_response.dart';
import '../../data/models/home/get_visits/doctor_booking_request_response.dart';
import '../../data/models/home/get_visits/get_visits_response.dart';
import '../../data/models/home/notification/notifications_response.dart';
import '../../data/models/home/notification/unread_notifications_count_response.dart';
import '../../data/models/home/patient_cards/avarage_distance_and_heart.dart';
import '../../data/models/home/patient_cards/best_distance_and_time.dart';
import '../../data/models/home/patient_cards/one_my_visit_response.dart';
import '../../data/models/home/patient_cards/patient_cards_response.dart';
import '../../data/models/home/payment_types/payment_link_response.dart';
import '../../data/models/home/payment_types/payment_types_response.dart';
import '../../data/models/home/subscription_types/subscription_details_response.dart';
import '../../data/models/home/subscription_types/subscription_status_of_user_response.dart';
import '../../data/models/home/subscription_types/subscription_types_response.dart';
import '../../data/models/my_appointments/my_appointments_response.dart';
import '../../data/models/profile/get_favourite_doctor/favourite_doctor_response.dart';
import '../../data/models/profile/profile_edit_request.dart';
import '../../data/models/profile/profile_response.dart';
import '../../data/models/purpose/files_response.dart';
import '../../data/models/purpose/medication_response.dart';
import '../../data/models/search_model/search_appointments_response.dart';
import '../../data/models/splash/check_for_production_response.dart';
import '../../data/models/survey/get_analysis_survey/analysis_survey_request.dart';
import '../../data/models/survey/get_analysis_survey/analysis_survey_response.dart';
import '../../data/models/survey/uploade_file_image/upload_file_image_request.dart';
import '../../data/models/survey/uploade_file_image/upload_file_image_response.dart';
import '../../data/models/treatments/medicine_taking/medicine_taking_response.dart';
import '../../presentation/additional_mixins/remote_like_mixin.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, String baseUrl) => _ApiClient(dio, baseUrl: baseUrl);

  @POST('v2/send-code')
  Future<SendCodeResponse> sendCode(
    @Body() SendCodeRequest request,
  );

  @POST('v2/login/with-option')
  Future<SendCodeResponse> loginWithOption(
    @Body() LoginWithOptionRequest request,
  );

  @POST('v2/register')
  Future<RegisterUserResponse> registerUser(
    @Body() Map<String, dynamic> request,
    @Query('project_id') String projectId,
  );

  @POST('v1/invoke_function/madadio-generate-balance-id')
  Future<dynamic> forBalanceId(
    @Body() Map<String, dynamic> request,
    @Query('project_id') String projectId,
  );

  @DELETE('v1/object/cleints/{client_id}')
  Future<dynamic> deleteClient(
    @Path('client_id') String clientId,
    @Query('project-id') String projectId,
    @Body() Map<String, dynamic> request,
  );

  @DELETE('v1/object/user/{client_id}')
  Future<dynamic> deleteUser(
    @Path('client_id') String clientId,
    @Query('project-id') String projectId,
    @Body() Map<String, dynamic> request,
  );

  @GET('v1/object-slim/test/1b461d7a-afd6-4328-851d-13265089a7fa')
  Future<CheckForProductionResponse> checkForProduction();

  @POST('v1/object/patient_cards')
  Future<CreateHealthResponse> createHealth(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  @PUT('v1/object/cleints')
  Future<ProfileResponse> updateProfile(
    @Body() ProfileEditRequest request,
    @Query('project-id') String projectId,
  );

  @GET('v2/object-slim/get-list/patient_medication')
  Future<MyAppointmentsResponse> getMyAppointments(
    @Query('data') String request,
    @Query('project_id') String projectId,
  );

  @PUT('v1/object/patient_medication')
  Future<MyAppointmentsResponse> updateDrugStatus(
    @Body() Map<String, dynamic> request,
    @Query('project_id') String projectId,
  );

  @POST('v1/object/get-list/patient_visits')
  Future<GetVisitsResponse> getMyVisits(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  // @POST('v1/object/get-list/naznachenie')
  // Future<GetMedicalHistoryResponse> getMedicalHistory(
  //   @Body() GetMedicalHistoryRequest request,
  //   @Query('project-id') String projectId,
  // );

  /// aaa
  @GET('v1/object-slim/get-list/naznachenie')
  Future<GetMedicalHistoryResponse> getMedicalHistorySlim(
    @Query('project-id') String projectId,
    @Query('data') String data,
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  );

  @POST('v1/object/get-list/doctor')
  Future<DoctorsResponse> getDoctorsList(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  @GET('v2/object-slim/get-list/selected_doctors')
  Future<FavouriteDoctorsResponse> getFavouriteDoctors(
    @Query('data') String request,
    @Query('project-id') String projectId,
  );

  @POST('v1/object-upsert/selected_doctors')
  Future<IsFavouriteDoctorResponse> likeDoctor(
    @Body() Map<String, dynamic> request,
  );

  @POST('v1/object/get-list/cleints')
  Future<GetUserDataResponse> getUserData(
    @Body() Map<String, dynamic> request,
  );

  @GET('v1/object-slim/get-list/subscription_report')
  Future<SubscriptionStatusOfUserResponse> getSubscriptionStatusOfUser(
    @Query('project-id') String projectId,
    @Query('data') String request,
  );

  @POST('v2/items/walk/aggregation')
  Future<PedometerResponse> getPedometer(
    @Body() Map<String, dynamic> request,
  );

  @POST('v2/items/puls/aggregation')
  Future<ArterialPressureResponse> getArterialPressure(
    @Body() Map<String, dynamic> request,
  );

  @POST('v2/items/blood_sugar/aggregation')
  Future<BloodSugarResponse> getBloodSugar(
    @Body() Map<String, dynamic> request,
  );

  @POST('v2/items/imt/aggregation')
  Future<TWHResponse> getTWH(
    @Body() Map<String, dynamic> request,
  );

  @POST('v1/object/get-list/client_files')
  Future<AnalysisSurveyHomeResponse> getAnalysisSurveyHome(
    @Body() AnalysisSurveyHomeRequest request,
  );

  @POST('v1/object/get-list/client_files')
  Future<AnalysisSurveyResponse> getAnalysisSurvey(
    @Body() AnalysisSurveyRequest request,
  );

  @POST('v1/object/client_files')
  Future<UploadFileImageResponse> uploadFileImage(
    @Body() UploadFileImageRequest request,
  );

  @POST('v1/object/{table_slug}')
  Future<HealthResponse> addHealth(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
    @Path('table_slug') String tableSlug,
  );

  @GET('v2/object-slim/get-list/selected_doctors')
  Future<FavouriteDoctorResponse> getFavouriteDoctor(
    @Query('data') String request,
  );

  /// search
  @POST('v1/object/get-list/naznachenie')
  Future<SearchAppointmentsResponse> getSearchedAppointments(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  @POST('v1/object/get-list/doctor')
  Future<DoctorsResponse> getSearchedDoctors(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  /// aaa
  @GET('v1/object-slim/get-list/patient_medication')
  Future<MedicationResponse> getMedicationSlim(
    @Query('project-id') String projectId,
    @Query('data') String data,
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  );

  // update user token and platformType
  @PUT('v1/object/cleints')
  Future<ProfileResponse> updateFcmTokenAndPlatformType(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  // update user lang
  @PUT('v1/object/cleints')
  Future<ProfileResponse> updateUserLang(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  // notification
  @GET('/v1/object-slim/get-list/notifications')
  Future<UnreadNotificationsCountResponse> getUnreadNotificationsCount(
    @Query('data') String data,
  );

  // @POST(
  //     '/v1/invoke_function/madadio-stepbystep-a4dc1f1c-d20f-4c1a-abf5-b819076604bc')
  // Future<SendStepsCountResponse> sendStepsCount(
  //   @Body() Map<String, dynamic> request,
  // );

  @POST('/v1/invoke_function/cardioapp-sort-notification')
  Future<NotificationsResponse> getNotifications(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  @POST('v1/invoke_function/cardioapp-update-many-notification')
  Future<dynamic> readNotifications(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  @POST('v1/invoke_function/cardioapp-average-distance-heart')
  Future<AvarageDistanceAndHeart> getAverageDistanceHeartEvent(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  @POST('v1/invoke_function/cardioapp-best-distance-time')
  Future<BestDistanceAndHeart> getBestDistanceAndTime(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  @POST('v1/object/get-list/{table_slug}')
  Future<OneMyVisitResponse> getOneMedicine(
    @Body() Map<String, dynamic> request,
    @Path('table_slug') String tableSlug,
    @Query('project-id') String projectId,
  );

  @POST('v1/object/get-list/unit_of_measure')
  Future<Metrics> getMetrics(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  @POST('v1/object/medicine_taking')
  Future<Metrics> saveMedication(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  @GET('v2/object-slim/get-list/medicine_taking')
  Future<MedicineTakingResponse> getMedicineTaking(
    @Query('data') String request,
    @Query('project-id') String projectId,
    @Query('offset') int offset,
    @Query('limit') int limit,
  );

  @GET('v2/object-slim/get-list/medicine_taking')
  Future<MedicineTakingResponse> getAllMedicineTaking(
    @Query('data') String request,
    @Query('project-id') String projectId,
  );

  @POST('v1/object/get-list/preparati')
  Future<DrugsResponse> getDrugs(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  @DELETE('v1/object/medicine_taking/{medicine_id}')
  Future<dynamic> deleteMedicine(
    @Body() Map<String, dynamic> request,
    @Path('medicine_id') String medicineId,
    @Query('project-id') String projectId,
  );

  @POST('v1/object/get-list/files')
  Future<FilesResponse> getMedicineFiles(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  /// Subcription types Home page -> subscription page
  @POST('/v1/invoke_function/madadio-allsubscriptions-a4dc1f1c-d20f-4c1a-abf5-b819076604bc')
  Future<SubscriptionTypesResponse> getSubscriptionTypes(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  /// Get single subscription details
  @GET('v1/object-slim/subscription_types/{table_slug}')
  Future<SubscriptionDetailsResponse> getSubscriptionDetails(
    @Path('table_slug') String subscriptionId,
  );

  /// Payment Types
  @GET('/v1/object-slim/get-list/payment_vendor?project-id=a4dc1f1c-d20f-4c1a-abf5-b819076604bc&data={}')
  Future<PaymentTypesResponse> getPaymentTypes();

  /// Get Payment Link for payment
  @POST('/v1/invoke_function/madadio-paymelink-a4dc1f1c-d20f-4c1a-abf5-b819076604bc')
  Future<PaymentLinkResponse> getPaymentLink(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  /// Check consultation days Consultation page -> Specialists page
  @GET('/v2/object-slim/get-list/{table_slug}')
  Future<CheckConsultationDaysResponse> checkConsultationDays(
    @Query('data') String request,
    @Path('table_slug') String tableSlug,
  );

  /// Book Doctor
  @PUT('/v2/items/doctor_booking')
  Future<BookDoctorResponse> bookDoctor(
    @Body() Map<String, dynamic> request,
    @Header('Authorization') String token,
  );

  /// Doctor Requests ///

  /// Doctor login
  @POST('/v2/multi-company/one-login')
  Future<OneLoginResponse> oneLogin(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  /// Get doctor token
  @POST('/v2/login')
  Future<DoctorLoginResponse> doctorLogin(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
  );

  /// Get Clients
  @POST('/v2/object/get-list/cleints')
  Future<ClientsResponse> getClients(
    @Body() Map<String, dynamic> request,
    @Header('Authorization') String token,
  );

  /// Get Client Medicine
  @POST('/v1/object/get-list/ill')
  Future<ClientMedicineResponse> getClientMedicine(
    @Body() Map<String, dynamic> request,
    @Header('Authorization') String token,
    @Query('project-id') String projectId,
  );

  /// Send Doctor Advice
  @POST('/v1/object/naznachenie')
  Future<SendAdviceResponse> sendAdvice(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
    @Header('Authorization') String token,
  );

  /// Add Doctor Free Time
  @POST('/v2/items/doctor_booking')
  Future<AddFreeTimeResponse> addFreeTime(
    @Body() Map<String, dynamic> request,
    @Header('Authorization') String token,
  );

  /// Get doctor bookings
  @POST('/v2/object/get-list/doctor_booking')
  Future<DoctorPatientResponse> doctorBookings(
    @Body() Map<String, dynamic> request,
    @Header('Authorization') String token,
  );

  /// Get doctor notifications
  @POST('v2/object/get-list/notifications')
  Future<DoctorNotificationsResponse> doctorNotifications(
    @Body() Map<String, dynamic> request,
    @Header('Authorization') String token,
  );

  /// Delete doctor free time
  @DELETE('/v2/items/doctor_booking/{timeId}')
  Future<void> deleteDoctorFreeTime(
    @Path('timeId') String timeId,
    @Header('Authorization') String token,
    @Body() Map<String, dynamic> request,
  );

  /// Update doctor free time
  @PUT('/v2/items/doctor_booking')
  Future<void> updateDoctorFreeTime(
    @Body() Map<String, dynamic> request,
    @Header('Authorization') String token,
  );

  /// Create Doctor Request
  @POST('/v2/items/doctor_booking_request')
  Future<void> createDoctorRequest(
    @Body() Map<String, dynamic> request,
    @Header('Authorization') String token,
  );

  /// Get Doctor Requests
  @POST('/v2/object/get-list/doctor_booking_request')
  Future<DoctorBookingRequestResponse> getDoctorBookingRequests(
    @Body() Map<String, dynamic> request,
    @Header('Authorization') String token,
  );

  /// Update Doctor Request
  @PUT('/v2/items/doctor_booking_request')
  Future<void> updateDoctorRequest(
    @Body() Map<String, dynamic> request,
    @Header('Authorization') String token,
  );

  /// Get Unit of Medicine
  @POST('/v1/object/get-list/unit_of_measure')
  Future<UnitOfMedicineResponse> getUnitOfMedicine(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
    @Header('Authorization') String token,
  );

  /// Send Full Advice
  @POST('/v1/object/medicine_taking')
  Future<void> sendFullAdvice(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
    @Header('Authorization') String token,
  );

  /// Get Medicine Full Info
  @POST('/v2/object/get-list/medicine_taking')
  Future<MedicineFullInfoResponse> getMedicineFullInfo(
    @Body() Map<String, dynamic> request,
    @Header('Authorization') String token,
  );

  /// Get Doctor Appointments
  @POST('/v2/object/get-list/naznachenie')
  Future<DoctorAppointmentResponse> getDoctorAppointments(
    @Body() Map<String, dynamic> request,
    @Header('Authorization') String token,
  );

  /// Get All Medicines
  @POST('/v1/object/get-list/preparati')
  Future<GetAllMedicinesResponse> getAllMedicine(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
    @Header('Authorization') String token,
  );

  /// Get Patient Medication
  @POST('/v2/object/get-list/patient_medication')
  Future<PatientMedicationResponse> getPatientMedication(
    @Body() Map<String, dynamic> request,
    @Header('Authorization') String token,
  );
}
