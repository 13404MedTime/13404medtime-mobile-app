import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/doctor/doctor_main/doctor_home/doctor_patient_response.dart';
import '../../data/models/home/get_visits/doctor_booking_request_response.dart';
import '../../data/models/my_appointments/switch_response.dart';
import '../../data/source/local_source.dart';
import '../../injector_container.dart';
import '../../presentation/bloc/add_medicine/add_medicine_bloc.dart';
import '../../presentation/bloc/auth/auth_bloc.dart';
import '../../presentation/bloc/auth/confirm/confirm_code_bloc.dart';
import '../../presentation/bloc/auth/register/register_bloc.dart';
import '../../presentation/bloc/consultation/consultation_bloc.dart';
import '../../presentation/bloc/doctor/doctor_main/doctor_advice/doctor_advice_bloc.dart';
import '../../presentation/bloc/doctor/doctor_main/doctor_check/doctor_check_bloc.dart';
import '../../presentation/bloc/doctor/doctor_main/doctor_check/doctor_check_client/doctor_check_client_bloc.dart';
import '../../presentation/bloc/doctor/doctor_main/doctor_home/add_free_time/add_free_time_bloc.dart';
import '../../presentation/bloc/doctor/doctor_main/doctor_home/doctor_home_bloc.dart';
import '../../presentation/bloc/doctor/doctor_main/doctor_main_bloc.dart';
import '../../presentation/bloc/doctor/login/login_bloc.dart';
import '../../presentation/bloc/health/health_bloc.dart';
import '../../presentation/bloc/main/home/home_bloc.dart';
import '../../presentation/bloc/main/profile/disease_history_bloc/disease_history_bloc.dart';
import '../../presentation/bloc/main/profile/favourite_doctor/favourite_doctor_bloc.dart';
import '../../presentation/bloc/main/profile/profile_bloc.dart';
import '../../presentation/bloc/main/profile/profile_edit/profile_edit_bloc.dart';
import '../../presentation/bloc/main/profile/upcoming_visits_bloc/upcoming_visits_bloc.dart';
import '../../presentation/bloc/main/survey/survey_bloc.dart';
import '../../presentation/bloc/main/treatments/treatments_bloc.dart';
import '../../presentation/bloc/my_appointments/my_appointments_bloc.dart';
import '../../presentation/bloc/my_visit/my_visit_bloc.dart';
import '../../presentation/bloc/notification/notification_bloc.dart';
import '../../presentation/bloc/purpose/purpose_bloc.dart';
import '../../presentation/bloc/show_all_my_visits/show_all_my_visits_bloc.dart';
import '../../presentation/bloc/specialists/specialists_bloc.dart';
import '../../presentation/bloc/splash/splash_bloc.dart';
import '../../presentation/bloc/sub_purpose/sub_purpose_bloc.dart';
import '../../presentation/pages/auth/auth_page.dart';
import '../../presentation/pages/auth/confirm/confirm_code_page.dart';
import '../../presentation/pages/auth/register/register_page.dart';
import '../../presentation/pages/doctor/doctor_main/doctor_check/doctor_check_client/doctor_check_client_page.dart';
import '../../presentation/pages/doctor/doctor_main/doctor_home/add_free_time/add_free_time.dart';
import '../../presentation/pages/doctor/doctor_main/doctor_home/doctor_home_page.dart';
import '../../presentation/pages/doctor/doctor_main/doctor_home/doctor_requests/doctor_requests_page.dart';
import '../../presentation/pages/doctor/doctor_main/doctor_main_page.dart';
import '../../presentation/pages/doctor/login/login_page.dart';
import '../../presentation/pages/error/error_page.dart';
import '../../presentation/pages/internet_connection/internet_connection_page.dart';
import '../../presentation/pages/main/consultation/specialists/specialists_page.dart';
import '../../presentation/pages/main/health/args/health_args.dart';
import '../../presentation/pages/main/health/sub_health/sub_health_page.dart';
import '../../presentation/pages/main/home/medical_history/medical_history_page.dart';
import '../../presentation/pages/main/home/my_appointments/my_appointments_page.dart';
import '../../presentation/pages/main/home/my_visit/my_visit_page.dart';
import '../../presentation/pages/main/home/my_visit/purpose/args/medication_description_args.dart';
import '../../presentation/pages/main/home/my_visit/purpose/args/medication_files_args.dart';
import '../../presentation/pages/main/home/my_visit/purpose/args/purpose_page_args.dart';
import '../../presentation/pages/main/home/my_visit/purpose/args/sub_purpose_page_args.dart';
import '../../presentation/pages/main/home/my_visit/purpose/purpose_page.dart';
import '../../presentation/pages/main/home/my_visit/purpose/sub_purpose/medication_description/medication_description_page.dart';
import '../../presentation/pages/main/home/my_visit/purpose/sub_purpose/medication_files/medication_files_page.dart';
import '../../presentation/pages/main/home/my_visit/purpose/sub_purpose/sub_purpose_page.dart';
import '../../presentation/pages/main/home/show_all_my_visits/show_all_my_visits_page.dart';
import '../../presentation/pages/main/home/survey/photo_view/photo_view.dart';
import '../../presentation/pages/main/home/survey/survey_page.dart';
import '../../presentation/pages/main/main_page.dart';
import '../../presentation/pages/main/profile/disease_history/args/disease_history_args.dart';
import '../../presentation/pages/main/profile/disease_history/disease_history_page.dart';
import '../../presentation/pages/main/profile/edit_profile/edit_profile_page.dart';
import '../../presentation/pages/main/profile/notification/notification_page.dart';
import '../../presentation/pages/main/profile/selected_doctors/selected_doctors_page.dart';
import '../../presentation/pages/main/profile/settings/settings_page.dart';
import '../../presentation/pages/main/profile/upcoming_visits/upcoming_visits_page.dart';
import '../../presentation/pages/main/profile/upcoming_visits/view_rejected_request.dart';
import '../../presentation/pages/main/treatments/add_medicine/add_medicine_page.dart';
import '../../presentation/pages/select_lang/select_lang_page.dart';
import '../../presentation/pages/splash/splash_page.dart';
import 'routes_arguments.dart';

part 'name_routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

final localSource = sl<LocalSource>();

final Chuck chuck = Chuck(navigatorKey: rootNavigatorKey);

sealed class AppRoutes {
  AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('route : ${settings.name}');
    }
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<SplashBloc>(),
            child: const SplashPage(),
          ),
        );
      case Routes.main:
        return FadePageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<HomeBloc>()),
              BlocProvider(create: (_) => sl<ConsultationBloc>()),
              BlocProvider(create: (_) => sl<HealthBloc>()),
              BlocProvider(create: (_) => sl<TreatmentsBloc>()),
              BlocProvider<ProfileBloc>(
                create: (_) => sl<ProfileBloc>()..add(const GetUpcomingVisitsEventProfile()),
              ),
            ],
            child: const MainPage(),
          ),
        );
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case Routes.internetConnection:
        return MaterialPageRoute(
          builder: (_) => const InternetConnectionPage(),
        );
      case Routes.auth:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<AuthBloc>(),
            child: const AuthPage(),
          ),
        );
      case Routes.confirmCode:
        final AuthSuccessState state = settings.arguments! as AuthSuccessState;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<ConfirmCodeBloc>(),
            child: ConfirmCodePage(
              state: state,
            ),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<RegisterBloc>(),
            child: RegisterPage(
              phone: settings.arguments is String ? settings.arguments! as String : '',
            ),
          ),
        );
      case Routes.langSelect:
        return MaterialPageRoute(
          builder: (_) => const SelectLangPage(),
        );
      case Routes.editProfile:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<ProfileEditBloc>(),
            child: const EditProfilePage(),
          ),
        );
      case Routes.selectedDoctors:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<FavouriteDoctorBloc>()..add(const GetFavouriteDoctorEvent()),
            child: const SelectedDoctorsPage(),
          ),
        );
      case Routes.diseaseHistory:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<DiseaseHistoryBloc>(),
            child: DiseaseHistoryPage(
              args: settings.arguments is DiseaseHistoryArgs
                  ? settings.arguments! as DiseaseHistoryArgs
                  : const DiseaseHistoryArgs(),
            ),
          ),
        );
      case Routes.myAppointments:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<MyAppointmentsBloc>(),
            child: MyAppointmentsPage(
              switchData: settings.arguments is SwitchModel ? settings.arguments! as SwitchModel : const SwitchModel(),
            ),
          ),
        );
      case Routes.myVisit:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<MyVisitBloc>()
              ..add(
                GetDoctorFreeTimeEvent(
                    guid:
                        settings.arguments != null ? (settings.arguments! as MyVisitArgument).doctor?.guid ?? '' : ''),
              )
              ..add(const GetDoctorBookingRequestsEvent()),
            child: MyVisitPage(
              arguments: settings.arguments is MyVisitArgument ? settings.arguments! as MyVisitArgument : null,
            ),
          ),
        );
      case Routes.purposePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<PurposeBloc>(),
            child: PurposePage(
              args: settings.arguments is PurposePageArgs ? settings.arguments! as PurposePageArgs : null,
            ),
          ),
        );
      case Routes.subPurposePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<SubPurposeBloc>(),
            child: SubPurposePage(
              args: settings.arguments is SubPurposePageArgs ? settings.arguments! as SubPurposePageArgs : null,
            ),
          ),
        );
      case Routes.medicalHistory:
        return MaterialPageRoute(
          builder: (_) => const MedicalHistoryPage(),
        );
      case Routes.specialists:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<SpecialistsBloc>(),
            child: SpecialistsPage(
                args: settings.arguments is SpecialistsPageArgs ? settings.arguments! as SpecialistsPageArgs : null),
          ),
        );
      case Routes.survey:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<SurveyBloc>(),
            child: const SurveyPage(),
          ),
        );

      case Routes.photoView:
        return MaterialPageRoute(
          builder: (_) => PhotoViewPage(imageUrl: settings.arguments! as String),
        );
      case Routes.subHealth:
        return MaterialPageRoute(
          builder: (_) => SubHealthPage(
            args: settings.arguments! as SubHealthArgs,
          ),
        );
      case Routes.showAllMyVisits:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<ShowAllMyVisitsBloc>(),
            child: const ShowAllMyVisitsPage(),
          ),
        );
      case Routes.notifications:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<NotificationBloc>(),
            child: NotificationPage(
              bloc: settings.arguments! as HomeBloc,
            ),
          ),
        );
      case Routes.addMedicine:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<AddMedicineBloc>(),
            child: const AddMedicinePage(),
          ),
        );
      case Routes.medicationDescription:
        return MaterialPageRoute(
          builder: (_) => MedicationDescriptionPage(
            args: settings.arguments is MedicationDescriptionArgs
                ? settings.arguments! as MedicationDescriptionArgs
                : null,
          ),
        );
      case Routes.medicationFiles:
        return MaterialPageRoute(
          builder: (_) => MedicationFilesPage(
            args: settings.arguments is MedicationFilesArgs ? settings.arguments! as MedicationFilesArgs : null,
          ),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<LoginBloc>(),
            child: const LoginPage(),
          ),
        );
      case Routes.doctorMain:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => sl<DoctorMainBloc>()),
              BlocProvider(
                create: (context) => sl<DoctorHomeBloc>()
                  ..add(const GetPatients$DoctorHomeEvent())
                  ..add(const GetDoctorBookingRequests$DoctorHomeEvent()),
              ),
              BlocProvider(
                create: (context) => sl<DoctorAdviceBloc>()..add(const GetAllMedicines$DoctorAdviceEvent('')),
              ),
              BlocProvider(
                create: (context) => sl<DoctorCheckBloc>()..add(const GetDoctorAppointments$DoctorCheckEvent()),
              ),
            ],
            child: const DoctorMainPage(),
          ),
        );
      case Routes.addFreeTime:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => sl<AddFreeTimeBloc>()),
              BlocProvider(
                  create: (context) => sl<DoctorHomeBloc>()
                    ..add(const GetPatients$DoctorHomeEvent())
                    ..add(const GetDoctorBookingRequests$DoctorHomeEvent())),
            ],
            child: AddFreeTime(id: settings.arguments as DoctorBooking?),
          ),
        );
      case Routes.clientProfile:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DoctorCheckClientBloc(sl())
              ..add(
                GetMedicineInfo$DoctorCheckClientEvent(
                  guid: (settings.arguments! as List<String>).first,
                  endDate: DateTime.now().toIso8601String(),
                  startDate: DateTime.now().subtract(const Duration(days: 7)).toIso8601String(),
                ),
              ),
            child: DoctorCheckClientPage(
              name: (settings.arguments! as List<String>).last,
              guid: (settings.arguments! as List<String>).first,
            ),
          ),
        );
      case Routes.doctorRequests:
        return MaterialPageRoute(
          builder: (context) => DoctorRequestsPage(
            bookingResponse: (settings.arguments! as DoctorRequestArguments).bookingResponse,
            reject: (settings.arguments! as DoctorRequestArguments).reject,
            accept: (settings.arguments! as DoctorRequestArguments).accept,
          ),
        );
      case Routes.upcomingVisits:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<UpcomingVisitsBloc>()
              ..add(
                const GetDoctorRequests$UpcomingVisitsEvent(),
              ),
            child: const UpcomingVisitsPage(),
          ),
        );
      case Routes.viewRejectedRequest:
        return MaterialPageRoute(
          builder: (_) => ViewRejectedRequest(
            bookingResponse: settings.arguments! as BookingResponse,
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => ErrorPage(settings: settings));
    }
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('Navigate to: $settings');
    }
    return MaterialPageRoute(
      builder: (_) => ErrorPage(
        settings: settings,
      ),
    );
  }
}

class FadePageRoute<T> extends PageRouteBuilder<T> {
  FadePageRoute({required this.builder})
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              builder(context),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
  final WidgetBuilder builder;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);
}
