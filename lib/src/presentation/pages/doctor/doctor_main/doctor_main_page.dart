import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extension.dart';
import '../../../bloc/doctor/doctor_main/doctor_home/doctor_home_bloc.dart';
import '../../../bloc/doctor/doctor_main/doctor_main_bloc.dart';
import 'doctor_home/doctor_home_page.dart';

class DoctorMainPage extends StatelessWidget {
  const DoctorMainPage({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<DoctorMainBloc, DoctorMainState>(
        builder: (context, state) => Scaffold(
          body: IndexedStack(
            index: state.pageIndex,
            children: const [
              DoctorHomePage(),
              SizedBox(),
              SizedBox(),
              SizedBox(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.pageIndex,
            onTap: (value) {
              context.read<DoctorMainBloc>().add(ChangePage$DoctorMainEvent(value));
              switch (value) {
                case 0:
                  context.read<DoctorHomeBloc>()
                    ..add(const GetPatients$DoctorHomeEvent())
                    ..add(const GetDoctorBookingRequests$DoctorHomeEvent());
              }
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
                label: context.translate('patients'),
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
