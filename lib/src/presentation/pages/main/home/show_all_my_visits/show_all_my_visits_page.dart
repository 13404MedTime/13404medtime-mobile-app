import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../config/router/routes_arguments.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../data/models/home/get_visits/get_visits_response.dart';
import '../../../../../data/models/my_appointments/my_appointments_response.dart';
import '../../../../../domain/repositories/home/home_repository.dart';
import '../../../../../injector_container.dart';
import '../../../../bloc/show_all_my_visits/show_all_my_visits_bloc.dart';
import '../../../../components/search_widget/flappy_search_bar.dart';
import '../../profile/disease_history/widgets/searched_doctor_disease_item.dart';
import '../../profile/selected_doctors/widgets/selected_doctor_shimmer_item.dart';
import '../widgets/empty_item.dart';

part 'mixin/show_all_my_visits_mixin.dart';

class ShowAllMyVisitsPage extends StatefulWidget {
  const ShowAllMyVisitsPage({super.key});

  @override
  State<ShowAllMyVisitsPage> createState() => _ShowAllMyVisitsPageState();
}

class _ShowAllMyVisitsPageState extends State<ShowAllMyVisitsPage> with ShowAllMyVisitsMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(context.translate('my_visits')),
          scrolledUnderElevation: 0,
          shape: AppUtils.kShapeRoundedNone,
        ),
        body: FlappySearchBar<MyVisitModel>(
          emptyWidget: EmptyItem(
            title: '',
            desc: context.translate('not_visits'),
            iconPath: 'assets/png/visit_empty.png',
          ),
          hintText: context.translate('search'),
          textStyle: context.theme.textTheme.titleMedium ?? const TextStyle(color: Colors.black),
          searchBarPadding: AppUtils.kPaddingAll16,
          loader: ListView.separated(
            padding: AppUtils.kPaddingAll16,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => const SelectedDoctorShimmerItem(),
            separatorBuilder: (context, index) => AppUtils.kBoxHeight8,
            itemCount: 12,
          ),
          listPadding: AppUtils.kPaddingAll10,
          // emptyWidget: Center(
          //   child: Text(
          //     'Ничего не найдено',
          //     style: TextStyle(
          //       fontSize: 15,
          //       fontWeight: FontWeight.w400,
          //       color: context.theme.colorScheme.onSurface,
          //     ),
          //   ),
          // ),
          placeHolder: SafeArea(
            child: CustomScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                BlocBuilder<ShowAllMyVisitsBloc, ShowAllMyVisitsState>(
                  buildWhen: (previous, current) =>
                      previous.doctors != current.doctors || previous.status != current.status,
                  builder: (_, state) => SliverSafeArea(
                    minimum: AppUtils.kPaddingAll16,
                    sliver: state.status == ShowAllMyVisitsStatus.loading
                        ? SliverFillRemaining(
                            child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => const SelectedDoctorShimmerItem(),
                              separatorBuilder: (context, index) => AppUtils.kBoxHeight8,
                              itemCount: 12,
                            ),
                          )
                        : SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (_, index) => index.isEven
                                  ? SearchedDoctorDiseaseItem(
                                      data: state.doctors[index.exactIndex].doctorIdData ?? DoctorIdData(),
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.myVisit,
                                          arguments: MyVisitArgument(myVisit: state.doctors[index.exactIndex]),
                                        );
                                      },
                                    )
                                  : AppUtils.kGap12,
                              childCount: state.doctors.length.doubleTheListCount,
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
          onSearch: (text) async {
            final t = await sl<HomeRepository>().getMyVisits(
              {
                'data': {
                  'cleints_id': localSource.userId,
                  'doctor_name': text,
                  'limit': 10,
                }
              },
            );
            return t.fold(
              (left) => [],
              (r) => r.myVisits ?? [],
            );
          },
          onItemFound: (item, index) => Padding(
            padding: AppUtils.kPaddingAll6,
            child: SearchedDoctorDiseaseItem(
              data: item?.doctorIdData ?? DoctorIdData(),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.myVisit,
                  arguments: MyVisitArgument(
                    myVisit: item,
                  ),
                );
              },
            ),
          ),
        ),
      );
}
