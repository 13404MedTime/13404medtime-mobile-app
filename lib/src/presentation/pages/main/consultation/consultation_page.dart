import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/utils/base_functions.dart';
import '../../../../data/models/consultation/doctors_types_response.dart';
import '../../../../domain/repositories/consultation/consultation_repository.dart';
import '../../../../injector_container.dart';
import '../../../bloc/consultation/consultation_bloc.dart';
import '../../../components/search_widget/flappy_search_bar.dart';
import '../home/widgets/empty_item.dart';
import 'widgets/consultation_item.dart';

part 'mixin/consultation_mixin.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({super.key});

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> with ConsultationMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(context.translate('category')),
          scrolledUnderElevation: 0,
          shape: AppUtils.kShapeRoundedNone,
        ),
        body: FlappySearchBar<DoctorTypeModel>(
          onFieldTap: () async {
            await sendAnalyticsEvent(
              tag: FirebaseAnalyticsEvents.searchCategory,
              parameters: {'user_name': localSource.firstName},
            );
          },
          textStyle: context.theme.textTheme.titleMedium ?? const TextStyle(color: Colors.black),
          hintText: context.translate('search_category'),
          hintStyle: context.textStyle.regularSubheadline.copyWith(
            color: context.colorScheme.onSurface,
          ),
          searchBarPadding: AppUtils.kPaddingAll16,
          listPadding: AppUtils.kPaddingAll10,
          emptyWidget: EmptyItem(
            title: '',
            desc: context.translate('nothing_found'),
            iconPath: 'assets/png/visit_empty.png',
          ),
          placeHolder: SafeArea(
            child: CustomScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                BlocBuilder<ConsultationBloc, ConsultationState>(
                  buildWhen: (previous, current) => previous.doctorsTypes != current.doctorsTypes,
                  builder: (_, state) => SliverSafeArea(
                    minimum: AppUtils.kPaddingAll10,
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (_, index) => ConsultationItem(doctor: state.doctorsTypes[index]),
                        childCount: state.doctorsTypes.length,
                      ),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          onSearch: (text) async {
            if (text != null) {
              Future<List<DoctorTypeModel>> searchCategory(
                final String search, {
                final bool isSearchByUz = false,
              }) async {
                final response = await sl<ConsultationRepository>().getDoctorsTypes(
                  request: {
                    'search': text,
                    'limit': 20,
                    'offset': 1,
                    'view_fields': ['category_name', 'category_name_eng', 'category_name_uz', 'description', 'description_uz'],
                  },
                );
                return response.fold<List<DoctorTypeModel>>(
                  (left) => [],
                  (r) => r.doctorsTypes ?? [],
                );
              }

              final List<DoctorTypeModel> result = await searchCategory(text);
              return Future.value(result);
            } else {
              return Future.value([]);
            }
          },
          onItemFound: (item, index) => ConsultationItem(
            key: ValueKey(item?.guid ?? '$index'),
            doctor: item,
          ),
        ),
      );
}

/// 92
