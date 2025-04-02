import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/constants/constants.dart';
import '../../data/models/auth/register/create_health_request.dart';
import '../../data/models/auth/register/register_user_response.dart';
import '../../data/models/auth/send_code_request.dart';
import '../../data/models/auth/send_code_response.dart';
import '../../data/models/auth/verify_request.dart';
import '../../data/models/profile/get_favourite_doctor/favourite_doctor_response.dart';
import '../../data/models/profile/profile_edit_request.dart';
import '../../data/models/profile/profile_response.dart';
import '../../data/models/splash/check_for_production_response.dart';
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


  // @POST('v1/object/get-list/naznachenie')
  // Future<GetMedicalHistoryResponse> getMedicalHistory(
  //   @Body() GetMedicalHistoryRequest request,
  //   @Query('project-id') String projectId,
  // );

  

  @GET('v2/object-slim/get-list/selected_doctors')
  Future<FavouriteDoctorsResponse> getFavouriteDoctors(
    @Query('data') String request,
    @Query('project-id') String projectId,
  );

  @POST('v1/object-upsert/selected_doctors')
  Future<IsFavouriteDoctorResponse> likeDoctor(
    @Body() Map<String, dynamic> request,
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


  // @POST(
  //     '/v1/invoke_function/madadio-stepbystep-a4dc1f1c-d20f-4c1a-abf5-b819076604bc')
  // Future<SendStepsCountResponse> sendStepsCount(
  //   @Body() Map<String, dynamic> request,
  // );

  @POST('v1/invoke_function/cardioapp-update-many-notification')
  Future<dynamic> readNotifications(
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

  @DELETE('v1/object/medicine_taking/{medicine_id}')
  Future<dynamic> deleteMedicine(
    @Body() Map<String, dynamic> request,
    @Path('medicine_id') String medicineId,
    @Query('project-id') String projectId,
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


  /// Update Doctor Request
  @PUT('/v2/items/doctor_booking_request')
  Future<void> updateDoctorRequest(
    @Body() Map<String, dynamic> request,
    @Header('Authorization') String token,
  );


  /// Send Full Advice
  @POST('/v1/object/medicine_taking')
  Future<void> sendFullAdvice(
    @Body() Map<String, dynamic> request,
    @Query('project-id') String projectId,
    @Header('Authorization') String token,
  );


}
