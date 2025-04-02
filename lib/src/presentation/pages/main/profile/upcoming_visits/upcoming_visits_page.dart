import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../bloc/main/profile/upcoming_visits_bloc/upcoming_visits_bloc.dart';

class UpcomingVisitsPage extends StatelessWidget {
  const UpcomingVisitsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.colorScheme.background,
          foregroundColor: context.theme.colorScheme.background,
          title: Text(context.translate('upcoming_visits')),
          centerTitle: true,
        ),
        body: BlocBuilder<UpcomingVisitsBloc, UpcomingVisitsState>(
          builder: (context, state) => RefreshIndicator(
            onRefresh: () async {
              context.read<UpcomingVisitsBloc>().add(const GetDoctorRequests$UpcomingVisitsEvent());
            },
            child: ListView(
              padding: AppUtils.kPaddingAll16,
              children: [
                SegmentedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (states) => states.contains(MaterialState.selected)
                          ? context.colorScheme.primaryContainer
                          : context.colorScheme.secondaryContainer,
                    ),
                    foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (states) => states.contains(MaterialState.selected)
                          ? context.colorScheme.onPrimaryContainer
                          : context.colorScheme.onSecondaryContainer,
                    ),
                    side: MaterialStateProperty.all(BorderSide.none),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: AppUtils.kBorderRadius10,
                      ),
                    ),
                  ),
                  segments: [
                    ButtonSegment(value: 0, label: Text(context.translate('requests'))),
                    ButtonSegment(value: 1, label: Text(context.translate('meetings'))),
                  ],
                  showSelectedIcon: false,
                  selected: state.selected,
                  onSelectionChanged: (value) =>
                      context.read<UpcomingVisitsBloc>().add(ChangeSelected$UpcomingVisitsEvent(value)),
                ),
                AppUtils.kBoxHeight16,
                state.isLoading
                    ? const Column(
                        children: [
                          SizedBox(height: 300),
                          Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        ],
                      )
                    : IndexedStack(
                        index: state.selected.first,
                        children: [
                          state.bookings.isEmpty
                              ? const Column(
                                  children: [
                                    SizedBox(height: 200),
                                    Center(
                                      child: Image(
                                        width: 150,
                                        image: AssetImage('assets/png/subscription.png'),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    for (final i in state.bookings.entries)
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              AppUtils.kBoxWidth16,
                                              Text(i.key),
                                            ],
                                          ),
                                          AppUtils.kBoxHeight16,
                                          for (final j in i.value)
                                            Column(
                                              children: [
                                                ListTile(
                                                  onTap: () => Navigator.pushNamed(context, Routes.viewRejectedRequest,
                                                      arguments: j),
                                                  title: Text(
                                                    j.doctorIdData.doctorName,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  subtitle: Text(
                                                    '${j.doctorBookingIdData.fromTime} - ${j.doctorBookingIdData.toTime}',
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  trailing: Icon(
                                                      j.status.first.toLowerCase() == 'pending'
                                                          ? Icons.access_time
                                                          : Icons.close,
                                                      color: j.status.first.toLowerCase() == 'pending'
                                                          ? context.theme.colorScheme.outline
                                                          : context.colorScheme.error),
                                                ),
                                                AppUtils.kBoxHeight16,
                                              ],
                                            ),
                                        ],
                                      ),
                                  ],
                                ),
                          state.doctorBookings.isEmpty
                              ? const Column(
                                  children: [
                                    SizedBox(height: 200),
                                    Center(
                                      child: Image(
                                        width: 150,
                                        image: AssetImage('assets/png/subscription.png'),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    for (final i in state.doctorBookings.entries)
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              AppUtils.kBoxWidth16,
                                              Text(i.key),
                                            ],
                                          ),
                                          AppUtils.kBoxHeight16,
                                          for (final j in i.value)
                                            Column(
                                              children: [
                                                ListTile(
                                                  title: Text(
                                                    j.doctorIdData.doctorName,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  subtitle: Text(
                                                    '${j.fromTime} - ${j.toTime}',
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  trailing: Icon(
                                                    Icons.check,
                                                    color: context.theme.colorScheme.primary,
                                                  ),
                                                ),
                                                AppUtils.kBoxHeight16,
                                              ],
                                            ),
                                        ],
                                      ),
                                  ],
                                )
                        ],
                      )
              ],
            ),
          ),
        ),
      );
}
