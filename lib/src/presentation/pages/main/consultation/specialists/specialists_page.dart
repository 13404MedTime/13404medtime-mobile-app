import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../config/router/routes_arguments.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/base_functions.dart';
import '../../../../../data/models/consultation/doctors_types_response.dart';
import '../../../../bloc/specialists/specialists_bloc.dart';
import '../../../../components/buttons/card_button.dart';
import '../../../../components/custom_cached_network_image/custom_cached_network_image.dart';
import '../../home/medical_history/widgets/searching.dart';
import '../../home/widgets/empty_item.dart';

part 'mixin/specialists_mixin.dart';

class SpecialistsPage extends StatefulWidget {
  const SpecialistsPage({
    super.key,
    this.args,
  });

  final SpecialistsPageArgs? args;

  @override
  State<SpecialistsPage> createState() => _SpecialistsPageState();
}

class _SpecialistsPageState extends State<SpecialistsPage> with SpecialistsMixin {
  @override
  Widget build(BuildContext context) => BlocBuilder<SpecialistsBloc, SpecialistsState>(
        builder: (context, state) => SearchingWidget(
          onFieldTap: () async {
            await sendAnalyticsEvent(
              tag: FirebaseAnalyticsEvents.searchDoctors,
              parameters: {'user_name': localSource.firstName},
            );
          },
          searchController: _searchController,
          searchFocusNode: _searchFocusNode,
          appBarHeight: 78,
          titleWidget: SizedBox(
            height: 32,
            child: Row(
              children: [
                CustomCachedNetworkImage(
                  imageUrl: widget.args?.doctorsType?.icon ?? '',
                  borderRadius: AppUtils.kBorderRadius50,
                  height: 32,
                  width: 32,
                  fit: BoxFit.cover,
                ),
                AppUtils.kBoxWidth12,
                Text(
                  widget.args?.title ?? '',
                  style: context.textStyle.appBarTitle,
                ),
              ],
            ),
          ),
          searchHintText: context.translate('search_doctor'),
          child: Padding(
            padding: AppUtils.kPaddingHorizontal16,
            child: state.isLoading || state.doctors.isNotEmpty
                ? CustomScrollView(
                    slivers: [
                      if (state.isLoading)
                        const SliverFillRemaining(
                          child: Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        )
                      else if (state.doctors.isNotEmpty) ...[
                        const SliverGap(16),
                        SliverList.separated(
                          itemCount: state.doctors.length,
                          itemBuilder: (_, index) => ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.myVisit,
                                arguments: MyVisitArgument(
                                  isHavePurpose: false,
                                  doctor: state.doctors[index],
                                ),
                              );
                            },
                            contentPadding: AppUtils.kPaddingHorizontal16,
                            leading: CustomCachedNetworkImage(
                              imageUrl: state.doctors[index].medicPhoto ?? '',
                              borderRadius: AppUtils.kBorderRadius50,
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              state.doctors[index].doctorName ?? '',
                              style: context.textStyle.onBackground50FontSize15Weight500,
                            ),
                            subtitle: Text(
                              state.doctors[index].hospital ?? '',
                              style: context.textStyle.regularFootnote.copyWith(
                                color: context.color.grey,
                              ),
                            ),
                            trailing: CardButton(
                              title:
                                  '${state.doctors[index].experience ?? 0} ${context.translate('years_of_experience').replaceFirst('\${i}', context.translate((state.doctors[index].experience ?? 0).numberToWordRussian('years_s', 'years_g', 'years_m')))}',
                            ),
                          ),
                          separatorBuilder: (_, index) => AppUtils.kBoxHeight16,
                        ),
                        const SliverGap(16),
                      ]
                    ],
                  )
                : Center(
                    child: EmptyItem(
                      title: '',
                      desc: context.translate('nothing_found'),
                      iconPath: 'assets/png/visit_empty.png',
                    ),
                  ),
          ),
        ),
      );
}

class SpecialistsPageArgs {
  SpecialistsPageArgs({required this.doctorsType, required this.title});

  final DoctorTypeModel? doctorsType;
  final String? title;
}
