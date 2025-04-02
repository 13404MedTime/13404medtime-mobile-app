import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../bloc/main/home/home_bloc.dart';
import '../../../../bloc/main/treatments/treatments_bloc.dart';

class HomeAppointmentsWidget extends StatelessWidget {
  const HomeAppointmentsWidget({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.currentAppointmentsCount != current.currentAppointmentsCount ||
            previous.isAppointmentsLoading != current.isAppointmentsLoading,
        builder: (_, state) => SliverPadding(
          padding: AppUtils.kPaddingAll16,
          sliver: SliverToBoxAdapter(
            child: Container(
              padding: AppUtils.kPaddingAll16,
              height: 72,
              decoration: BoxDecoration(
                color: context.theme.colorScheme.primary,
                borderRadius: AppUtils.kBorderRadius16,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.isAppointmentsLoading ? '' : context.translate('today'),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: context.theme.colorScheme.onPrimary,
                          ),
                        ),
                        // AppUtils.kSpacer,
                        Text(
                          state.isAppointmentsLoading
                              ? ''
                              : context
                                  .translate('you_need_to_take_medicines')
                                  .replaceFirst('\${i}', '${state.currentAppointmentsCount}')
                                  .replaceFirst(
                                    '\${j}',
                                    state.currentAppointmentsCount.numberToWordRussian(
                                      context.translate('medicament_s').toLowerCase(),
                                      context.translate('medicament_g').toLowerCase(),
                                      context.translate('medicament_m').toLowerCase(),
                                    ),
                                  ),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // AppUtils.kBoxWidth16,
                  FilledButton.tonal(
                    onPressed: () async {
                      if (!state.isAppointmentsLoading) {
                        await Navigator.pushNamed(
                          context,
                          Routes.myAppointments,
                          arguments: state.switchData,
                        ).then(
                          (value) {
                            context.read<TreatmentsBloc>().add(
                                  const TreatmentsEvent.getMedicineTaking(),
                                );
                            context.read<HomeBloc>().add(
                                  const GetAppointmentsEvent(),
                                );
                          },
                        );
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: context.theme.colorScheme.onPrimary,
                      padding: AppUtils.kPaddingAll10,
                    ),
                    child: state.isAppointmentsLoading
                        ? const Center(
                            child: SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator.adaptive(
                                strokeWidth: 2,
                              ),
                            ),
                          )
                        : Text(
                            context.translate('look'),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: context.theme.colorScheme.primary,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
