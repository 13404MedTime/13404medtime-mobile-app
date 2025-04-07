import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../config/router/app_routes.dart';
import '../../../core/constants/constants.dart';
import '../../../core/extension/extension.dart';
import '../../../core/services/notification_service.dart';
import '../../../core/utils/base_functions.dart';
import '../../bloc/health/health_bloc.dart';
import '../../bloc/main/home/home_bloc.dart';
import '../../bloc/main/main_bloc.dart';
import '../../bloc/main/profile/profile_bloc.dart';
import '../../bloc/main/treatments/treatments_bloc.dart';
import 'consultation/consultation_page.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';
import 'treatments/treatments_page.dart';

part 'mixin/main_mixin.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with MainMixin {
  @override
  Widget build(BuildContext context) => BlocBuilder<MainBloc, MainState>(
        buildWhen: (previous, current) => previous.bottomMenu != current.bottomMenu,
        builder: (_, state) => WillPopScope(
          onWillPop: () async {
            if (state.bottomMenu.index != 0) {
              context.read<MainBloc>().add(MainEventChanged(BottomMenu.values[0]));
              return false;
            }
            return true;
          },
          child: Scaffold(
            body: IndexedStack(
              index: state.bottomMenu.index,
              children: const [
                HomePage(),
                ConsultationPage(),
                SizedBox(),
                TreatmentsPage(),
                ProfilePage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.bottomMenu.index,
              onTap: (i) async {
                context.read<MainBloc>().add(MainEventChanged(BottomMenu.values[i]));
                String tag = FirebaseAnalyticsEvents.mainViewNavigationBtn;
                switch (i) {
                  case 0:
                    context.read<HomeBloc>()
                      ..add(const HomeEventInitial())
                      ..add(const GetFavouriteDoctorsEvent())
                      ..add(const GetAppointmentsEvent())
                      ..add(const GetAppointmentsForSaveEvent())
                      ..add(const GetVisitsEvent())
                      ..add(const GetMedicalHistoryEvent())
                      ..add(const GetAnalysisSurveyHomeEvent())
                      ..add(const GetUnreadNotificationsCount())
                      ..add(const GetAverageDistanceHeartEvent())
                      ..add(const GetBestDistanceAndTimeEvent());
                    tag = FirebaseAnalyticsEvents.mainViewNavigationBtn;
                  case 1:
                    tag = FirebaseAnalyticsEvents.consultationNavigationBtn;
                  case 2:
                    context.read<HealthBloc>()
                      ..add(const GetStepsCountOfTodayEvent())
                      ..add(const GetArterialPressureEvent())
                      ..add(const GetBloodSugarEvent())
                      ..add(const GetTWHEvent())
                      ..add(const GetPedometerEvent());
                    tag = FirebaseAnalyticsEvents.healthNavigationBtn;
                  case 3:
                    context.read<TreatmentsBloc>().add(const GetMedicineTakingMenuEvent());
                    tag = FirebaseAnalyticsEvents.profileNavigationBtn;
                  case 4:
                    context.read<HomeBloc>().add(const HomeEventInitial());
                    context.read<ProfileBloc>().add(const GetUpcomingVisitsEventProfile());
                  default:
                    tag = FirebaseAnalyticsEvents.mainViewNavigationBtn;
                }
                await sendAnalyticsEvent(
                  tag: tag,
                  parameters: {'user_name': localSource.firstName},
                );
              },
              items: [
                _navigationBarItem(
                  label: context.translate('home'),
                  icon: Icons.home,
                  activeIcon: Icons.home_outlined,
                ),
                _navigationBarItem(
                  label: context.translate('consultation'),
                  icon: Icons.supervised_user_circle,
                  activeIcon: Icons.supervised_user_circle_outlined,
                ),
                _navigationBarItem(
                  label: context.translate('health'),
                  icon: Icons.healing,
                  activeIcon: Icons.healing_outlined,
                ),
                _navigationBarItem(
                  label: context.translate('treatments'),
                  icon: Icons.medication_liquid,
                  activeIcon: Icons.medication_liquid_outlined,
                ),
                _navigationBarItem(
                  label: context.translate('profile'),
                  icon: Icons.person_2,
                  activeIcon: Icons.person_2_outlined,
                ),
              ],
            ),
          ),
        ),
      );

  BottomNavigationBarItem _navigationBarItem({
    required String label,
    required IconData icon,
    required IconData activeIcon,
  }) =>
      BottomNavigationBarItem(
        icon: Padding(
          padding: AppUtils.kPaddingBottom2,
          child: Icon(icon),
        ),
        activeIcon: Padding(
          padding: AppUtils.kPaddingBottom2,
          child: Icon(activeIcon),
        ),
        label: label,
        tooltip: label,
      );
}
