import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:health/health.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

import 'config/router/app_routes.dart';
import 'core/connectivity/internet_connection_checker.dart';
import 'core/connectivity/network_info.dart';
import 'core/constants/constants.dart';
import 'core/utils/health_service.dart';
import 'data/source/local_source.dart';
import 'domain/network/api_client.dart';
import 'domain/repositories/add_medicine/add_medicine_repository.dart';
import 'domain/repositories/auth/auth_repository.dart';
import 'domain/repositories/consultation/consultation_repository.dart';
import 'domain/repositories/doctor/doctor_main/doctor_advice/doctor_advice_repository.dart';
import 'domain/repositories/doctor/doctor_main/doctor_home/add_free_time/add_free_time_repository.dart';
import 'domain/repositories/doctor/doctor_main/doctor_home/doctor_home_repository.dart';
import 'domain/repositories/doctor/login/doctor_login_repository.dart';
import 'domain/repositories/health/health_repository_impl.dart';
import 'domain/repositories/home/home_repository.dart';
import 'domain/repositories/notification/notification_repository.dart';
import 'domain/repositories/profile/profile_repository.dart';
import 'domain/repositories/register/register_repository.dart';
import 'domain/repositories/register/register_repository_impl.dart';
import 'domain/repositories/search/search_repository.dart';
import 'domain/repositories/splash/splash_repository.dart';
import 'domain/repositories/survey/survey_repository.dart';
import 'domain/repositories/treatments/treatments_repository.dart';
import 'presentation/bloc/add_medicine/add_medicine_bloc.dart';
import 'presentation/bloc/auth/auth_bloc.dart';
import 'presentation/bloc/auth/confirm/confirm_code_bloc.dart';
import 'presentation/bloc/auth/register/register_bloc.dart';
import 'presentation/bloc/consultation/consultation_bloc.dart';
import 'presentation/bloc/doctor/doctor_main/doctor_advice/doctor_advice_bloc.dart';
import 'presentation/bloc/doctor/doctor_main/doctor_check/doctor_check_bloc.dart';
import 'presentation/bloc/doctor/doctor_main/doctor_check/doctor_check_client/doctor_check_client_bloc.dart';
import 'presentation/bloc/doctor/doctor_main/doctor_home/add_free_time/add_free_time_bloc.dart';
import 'presentation/bloc/doctor/doctor_main/doctor_home/doctor_home_bloc.dart';
import 'presentation/bloc/doctor/doctor_main/doctor_main_bloc.dart';
import 'presentation/bloc/doctor/login/login_bloc.dart';
import 'presentation/bloc/health/health_bloc.dart';
import 'presentation/bloc/main/home/home_bloc.dart';
import 'presentation/bloc/main/main_bloc.dart';
import 'presentation/bloc/main/profile/disease_history_bloc/disease_history_bloc.dart';
import 'presentation/bloc/main/profile/favourite_doctor/favourite_doctor_bloc.dart';
import 'presentation/bloc/main/profile/profile_bloc.dart';
import 'presentation/bloc/main/profile/profile_edit/profile_edit_bloc.dart';
import 'presentation/bloc/main/profile/upcoming_visits_bloc/upcoming_visits_bloc.dart';
import 'presentation/bloc/main/survey/survey_bloc.dart';
import 'presentation/bloc/main/treatments/treatments_bloc.dart';
import 'presentation/bloc/my_appointments/my_appointments_bloc.dart';
import 'presentation/bloc/my_visit/my_visit_bloc.dart';
import 'presentation/bloc/notification/notification_bloc.dart';
import 'presentation/bloc/purpose/purpose_bloc.dart';
import 'presentation/bloc/show_all_my_visits/show_all_my_visits_bloc.dart';
import 'presentation/bloc/specialists/specialists_bloc.dart';
import 'presentation/bloc/splash/splash_bloc.dart';
import 'presentation/bloc/sub_purpose/sub_purpose_bloc.dart';

final sl = GetIt.instance;
late Box<dynamic> _box;

final packageInfo = sl<PackageInfo>();
final healthService = sl<HealthService>();

Future<void> init() async {
  ///External
  await initHive();

  sl.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        contentType: 'application/json',
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        headers: {
          'Authorization': 'API-KEY',
          'X-API-KEY': Constants.apiKey,
          // 'Resource-Id': Constants.resourceId,
          // 'Environment-Id': Constants.environmentId,
        },
      )
      ..interceptors.addAll(
        [
          LogInterceptor(
            request: false,
            requestBody: kDebugMode,
            responseBody: kDebugMode,
            requestHeader: false,
            error: false,
            logPrint: (message) {
              if (kDebugMode) {
                debugPrint(message.toString());
              }
            },
          ),
          // chuck.getDioInterceptor(),
        ],
      ),
  );

  sl<Dio>().interceptors.add(
        RetryInterceptor(
          dio: sl<Dio>(),
          toNoInternetPageNavigator: () async => Navigator.pushNamed(
            rootNavigatorKey.currentContext!,
            Routes.internetConnection,
          ),
          accessTokenGetter: () => localSource.accessToken,
          refreshTokenFunction: () async {
            await localSource.clearProfile();
            await Navigator.pushNamedAndRemoveUntil(
              rootNavigatorKey.currentContext!,
              Routes.initial,
              (route) => false,
            );
          },
          logPrint: (message) {
            if (kDebugMode) {
              debugPrint(message);
            }
          },
        ),
      );
  sl
    ..registerLazySingleton(
      () => InternetConnectionChecker.createInstance(
        checkInterval: const Duration(seconds: 3),
      ),
    )
    ..registerSingletonAsync(PackageInfo.fromPlatform)
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()))
    ..registerSingleton<LocalSource>(LocalSource(_box))
    ..registerFactory<ApiClient>(() => ApiClient(sl(), Constants.baseUrl))
    ..registerSingleton<HealthService>(
      HealthServiceImpl(
        Health(),
      ),
    );

  /// auth
  late final ApiClient authClient = ApiClient(sl(), Constants.authUrl);
  late final ApiClient baseClient = ApiClient(sl(), Constants.baseUrl);

  /// main
  mainFeature(baseClient);

  authFeature(authClient, baseClient);

  registerFeature(authClient, baseClient);

  consultationFeature(baseClient);

  homeFeature(baseClient);

  healthFeature(baseClient);

  profileFeature(baseClient, baseClient);

  surveyFeature(baseClient);

  notificationFeature(baseClient);

  doctorFeature(baseClient, authClient);

  treatmentsFeature(baseClient);
}

void mainFeature(ApiClient baseClient) {
  /// splash
  sl
    ..registerFactory<SplashBloc>(() => SplashBloc(sl()))
    ..registerLazySingleton(MainBloc.new)
    ..registerLazySingleton<SplashRepository>(
      () => SplashRepositoryImpl(
        apiClient: baseClient,
        networkInfo: sl(),
        dio: sl(),
      ),
    );
}

void homeFeature(ApiClient authClient) {
  sl
    ..registerFactory<HomeBloc>(() => HomeBloc(sl()))
    ..registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        apiClient: authClient,
        networkInfo: sl(),
      ),
    )
    ..registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(
        apiClient: authClient,
        networkInfo: sl(),
        dio: sl(),
      ),
    )
    ..registerLazySingleton<AddMedicineRepository>(
      () => AddMedicineRepositoryImpl(
        apiClient: authClient,
        networkInfo: sl(),
      ),
    )
    ..registerFactory<MyAppointmentsBloc>(() => MyAppointmentsBloc(sl()))
    ..registerFactory<ShowAllMyVisitsBloc>(() => ShowAllMyVisitsBloc(sl()))
    ..registerFactory<MyVisitBloc>(() => MyVisitBloc(sl()))
    ..registerFactory<PurposeBloc>(() => PurposeBloc(sl()))
    ..registerFactory<SubPurposeBloc>(() => SubPurposeBloc(sl()))
    ..registerFactory<DiseaseHistoryBloc>(() => DiseaseHistoryBloc(sl(), sl()))
    ..registerFactory<AddMedicineBloc>(() => AddMedicineBloc(sl()));
}

void treatmentsFeature(ApiClient authClient) {
  sl
    ..registerFactory<TreatmentsBloc>(() => TreatmentsBloc(sl()))
    ..registerLazySingleton<TreatmentsRepository>(
      () => TreatmentsRepositoryImpl(
        apiClient: authClient,
        networkInfo: sl(),
      ),
    );
}

void surveyFeature(ApiClient authClient) {
  sl
    ..registerFactory<SurveyBloc>(() => SurveyBloc(surveyRepository: sl()))
    ..registerLazySingleton<SurveyRepository>(
      () => SurveyRepositoryImpl(
        apiClient: authClient,
        networkInfo: sl(),
      ),
    );
}

void healthFeature(ApiClient authClient) {
  sl
    ..registerFactory<HealthBloc>(() => HealthBloc(sl()))
    ..registerLazySingleton<HealthRepository>(
      () => HealthRepositoryImpl(
        apiClient: authClient,
        networkInfo: sl(),
        dio: sl(),
      ),
    );
}

void registerFeature(ApiClient authClient, ApiClient baseClient) {
  sl
    ..registerFactory<RegisterBloc>(
      () => RegisterBloc(
        registerUserRepository: sl(),
      ),
    )
    ..registerLazySingleton<RegisterUserRepository>(
      () => RegisterUserRepositoryImpl(
        apiClient: authClient,
        baseClient: baseClient,
        networkInfo: sl(),
      ),
    );
}

void authFeature(ApiClient authClient, ApiClient baseClient) {
  sl
    ..registerFactory<AuthBloc>(() => AuthBloc(sl()))
    ..registerFactory<ConfirmCodeBloc>(() => ConfirmCodeBloc(sl()))
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        apiClient: authClient,
        baseClient: baseClient,
        networkInfo: sl(),
      ),
    );
}

void profileFeature(ApiClient client, ApiClient baseClient) {
  sl
    ..registerFactory<ProfileEditBloc>(() => ProfileEditBloc(sl()))
    ..registerFactory<ProfileBloc>(() => ProfileBloc(sl()))
    ..registerFactory<FavouriteDoctorBloc>(() => FavouriteDoctorBloc(sl()))
    ..registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(
        apiClient: client,
        baseClient: baseClient,
        networkInfo: sl(),
      ),
    );
}

void consultationFeature(ApiClient client) {
  sl
    ..registerLazySingleton<ConsultationRepository>(
      () => ConsultationRepositoryImpl(
        apiClient: client,
        networkInfo: sl(),
        dio: sl(),
      ),
    )
    ..registerFactory<ConsultationBloc>(
      () => ConsultationBloc(sl()),
    )
    ..registerFactory<SpecialistsBloc>(
      () => SpecialistsBloc(sl()),
    );
}

void notificationFeature(ApiClient client) {
  sl
    ..registerLazySingleton<NotificationRepository>(
      () => NotificationRepositoryImpl(
        apiClient: client,
        networkInfo: sl(),
      ),
    )
    ..registerFactory<NotificationBloc>(
      () => NotificationBloc(sl()),
    );
}

void doctorFeature(ApiClient client, ApiClient baseClient) {
  sl
    ..registerLazySingleton<DoctorLoginRepository>(
      () => DoctorLoginRepositoryImpl(
        apiClient: client,
        baseClient: baseClient,
        networkInfo: sl(),
      ),
    )
    ..registerLazySingleton<DoctorHomeRepository>(
      () => DoctorHomeRepositoryImpl(
        apiClient: client,
        baseClient: baseClient,
        networkInfo: sl(),
      ),
    )
    ..registerLazySingleton<AddFreeTimeRepository>(
      () => AddFreeTimeRepositoryImpl(
        apiClient: client,
        baseClient: baseClient,
        networkInfo: sl(),
      ),
    )
    ..registerLazySingleton<DoctorAdviceRepository>(
      () => DoctorAdviceRepositoryImpl(
        apiClient: client,
        baseClient: baseClient,
        networkInfo: sl(),
      ),
    )
    ..registerFactory<LoginBloc>(
      () => LoginBloc(doctorLoginRepository: sl()),
    )
    ..registerFactory<DoctorHomeBloc>(
      () => DoctorHomeBloc(sl()),
    )
    ..registerFactory<AddFreeTimeBloc>(
      () => AddFreeTimeBloc(sl()),
    )
    ..registerFactory<DoctorAdviceBloc>(
      () => DoctorAdviceBloc(sl()),
    )
    ..registerFactory<DoctorCheckBloc>(
      () => DoctorCheckBloc(sl()),
    )
    ..registerFactory<DoctorCheckClientBloc>(
      () => DoctorCheckClientBloc(sl()),
    )
    ..registerFactory<UpcomingVisitsBloc>(
      () => UpcomingVisitsBloc(sl()),
    )
    ..registerFactory<DoctorMainBloc>(DoctorMainBloc.new);
}

Future<void> initHive() async {
  const boxName = 'bloc_mobile_box';
  final Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  _box = await Hive.openBox<dynamic>(boxName);
}
