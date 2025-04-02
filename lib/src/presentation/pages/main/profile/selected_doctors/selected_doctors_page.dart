import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../config/router/routes_arguments.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../bloc/main/profile/favourite_doctor/favourite_doctor_bloc.dart';
import '../../../../components/buttons/card_button.dart';
import '../../../../components/custom_cached_network_image/custom_cached_network_image.dart';
import '../../home/widgets/empty_item.dart';
import 'widgets/selected_doctor_shimmer_item.dart';

class SelectedDoctorsPage extends StatelessWidget {
  const SelectedDoctorsPage({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<FavouriteDoctorBloc, FavouriteDoctorState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(
              context.translate('selected_doctors'),
              style: context.theme.appBarTheme.titleTextStyle,
            ),
          ),
          body: state.favouriteDoctorList.isEmpty && !state.isLoading
              ? Center(
                  child: EmptyItem(
                    title: '',
                    desc: context.translate('not_doctor'),
                    iconPath: 'assets/png/visit_empty.png',
                  ),
                )
              : CustomScrollView(
                  slivers: [
                    if (state.favouriteDoctorList.isEmpty && state.isLoading) ...[
                      SliverPadding(
                        padding: AppUtils.kPaddingAll16,
                        sliver: SliverFillRemaining(
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => const SelectedDoctorShimmerItem(),
                            separatorBuilder: (context, index) => AppUtils.kBoxHeight8,
                            itemCount: 12,
                          ),
                        ),
                      )
                    ] else ...[
                      AppUtils.kSliverGap8,
                      SliverSafeArea(
                        minimum: AppUtils.kPaddingAll16,
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (_, index) {
                              if (index.isEven) {
                                final expYear = state.favouriteDoctorList[index.exactIndex].experience ?? 0;
                                return ListTile(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.myVisit,
                                      arguments: MyVisitArgument(
                                        isHavePurpose: false,
                                        doctor: state.favouriteDoctorList[index.exactIndex],
                                        favoriteBloc: context.read<FavouriteDoctorBloc>(),
                                      ),
                                    );
                                  },
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                                  horizontalTitleGap: 12,
                                  leading: CustomCachedNetworkImage(
                                    borderRadius: AppUtils.kBorderRadius100,
                                    imageUrl: state.favouriteDoctorList[index.exactIndex].medicPhoto ??
                                        'https://static.vecteezy.com/system/resources/previews/001/822/322/original/cartoon-couple-doctors-waving-free-vector.jpg',
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.cover,
                                  ),
                                  title: Text(
                                    state.favouriteDoctorList[index.exactIndex].doctorName ??
                                        context.translate('doctor'),
                                    style: context.theme.textTheme.bodyMedium,
                                  ),
                                  subtitle: Text(
                                    state.favouriteDoctorList[index.exactIndex].hospital ??
                                        context.translate('specialization'),
                                    style: context.theme.textTheme.labelSmall!
                                        .copyWith(fontSize: 13, color: context.theme.colorScheme.onSurface),
                                  ),
                                  trailing: CardButton(
                                    title:
                                        '${context.translate('experience')} $expYear ${expYear.numberToWordRussian(context.translate('years_s'), context.translate('years_g'), context.translate('years_m'))}',
                                  ),
                                );
                              }
                              return AppUtils.kGap12;
                            },
                            childCount: state.favouriteDoctorList.length.doubleTheListCount,
                          ),
                        ),
                      )
                    ]
                  ],
                ),
        ),
      );
}
