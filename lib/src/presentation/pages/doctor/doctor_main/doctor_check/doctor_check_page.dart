import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../bloc/doctor/doctor_main/doctor_check/doctor_check_bloc.dart';

class DoctorCheckPage extends StatelessWidget {
  const DoctorCheckPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.colorScheme.background,
          surfaceTintColor: context.theme.colorScheme.background,
          title: Text(
            context.translate('patients'),
            style: context.theme.appBarTheme.titleTextStyle?.copyWith(
              fontSize: 28,
            ),
          ),
        ),
        body: Padding(
          padding: AppUtils.kPaddingAll16,
          child: BlocBuilder<DoctorCheckBloc, DoctorCheckState>(
            builder: (context, state) => state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.users.isEmpty
                    ? const Center(
                        child: Image(
                          width: 250,
                          image: AssetImage('assets/png/subscription.png'),
                        ),
                      )
                    : ListView.separated(
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          final user = state.users[state.users.keys.elementAt(index)];
                          return ListTile(
                            onTap: () => Navigator.pushNamed(
                              context,
                              Routes.clientProfile,
                              arguments: [user.first.clientsId, user.first.clientsIdData.fullName],
                            ),
                            title: Text(
                              user!.first.clientsIdData.fullName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              user.first.clientsIdData.phoneNumber,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(user.first.createdTime.ddMMyyyy),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => AppUtils.kDividerBlack07,
                      ),
          ),
        ),
      );
}
