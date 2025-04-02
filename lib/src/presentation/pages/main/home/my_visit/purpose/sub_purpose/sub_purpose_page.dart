import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../../../../config/router/app_routes.dart';
import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../data/models/purpose/medication_times.dart';
import '../../../../../../../data/models/treatments/medicine_taking/medicine_taking_response.dart';
import '../../../../../../bloc/sub_purpose/sub_purpose_bloc.dart';
import '../../../../../../components/buttons/bottom_navigation_button.dart';
import '../../../../../../components/custom_cached_network_image/custom_cached_network_image.dart';
import '../../../../../../components/widgets/medication_times.dart';
import '../args/sub_purpose_page_args.dart';

part '../mixin/sub_purpose_mixin.dart';

class SubPurposePage extends StatefulWidget {
  const SubPurposePage({
    this.args,
    super.key,
  });

  final SubPurposePageArgs? args;

  @override
  State<SubPurposePage> createState() => _SubPurposePageState();
}

class _SubPurposePageState extends State<SubPurposePage> with SubPurposeMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            widget.args?.title ?? '',
            style: context.textStyle.appBarTitle,
          ),
        ),
        body: BlocBuilder<SubPurposeBloc, SubPurposeState>(
          builder: (context, state) {
            final data = state.allPreparatsOfNaznachenie.isNotEmpty ? state.allPreparatsOfNaznachenie : null;
            debugPrint('data------: ${data?.length}');
            return CustomScrollView(
              slivers: [
                const SliverGap(24),
                if (state.allPreparatsOfNaznachenie.isNotEmpty) ...[
                  const SliverGap(16),
                  SliverList(
                    key: Key('builder ${currentIndex.toString()}'),
                    delegate: SliverChildListDelegate.fixed(
                      List.generate(
                        (data ?? []).length,
                        (index) {
                          final MedicineTakingModel preparatiData = data![index];
                          debugPrint('--------> ${data[index].photo}');
                          debugPrint('--------> ${data[index].medicineName}');

                          return Padding(
                            padding: AppUtils.kPaddingAll8.copyWith(left: 16, right: 16),
                            child: Theme(
                              data: context.theme.copyWith(
                                expansionTileTheme: context.theme.expansionTileTheme.copyWith(
                                  shape: const RoundedRectangleBorder(borderRadius: AppUtils.kBorderRadius8),
                                  collapsedShape: const RoundedRectangleBorder(borderRadius: AppUtils.kBorderRadius8),
                                  backgroundColor: context.theme.colorScheme.surface,
                                  collapsedBackgroundColor: context.theme.colorScheme.surface,
                                  collapsedIconColor: context.theme.colorScheme.onBackground,
                                  iconColor: context.theme.colorScheme.onBackground,
                                  collapsedTextColor: context.theme.colorScheme.onBackground,
                                  textColor: context.theme.colorScheme.onBackground,
                                  tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                                  childrenPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                ),
                              ),
                              child: ExpansionTile(
                                key: Key(index.toString()),
                                initiallyExpanded: index == currentIndex,
                                onExpansionChanged: (newState) {
                                  if (newState) {
                                    _changeCurrentTile(index);
                                  } else {
                                    _changeCurrentTile(-1);
                                  }
                                },
                                title: Text(
                                  '${data[index].medicineName}',
                                  // ((preparatiData.preparatiId ?? '').isEmpty
                                  //         ? preparatiData.medicineName
                                  //         : preparatiData
                                  //             .preparatiIdData?.brandName
                                  //             ?.replaceAll('\n', '')) ??
                                  //     '',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // TODO: replace with alternative
                                      // HtmlWidget(
                                      //   (preparatiData.preparatiIdData
                                      //               ?.dosageForm ??
                                      //           '')
                                      //       .trim(),
                                      //   buildAsync: false,
                                      //   textStyle:
                                      //       context.textStyle.regularBody,
                                      // ),
                                      AppUtils.kBoxHeight24,
                                      Text(
                                        context.translate('medicine'),
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      AppUtils.kBoxHeight24,
                                      Padding(
                                        padding: AppUtils.kPaddingHorizontal16,
                                        child: CustomCachedNetworkImage(
                                          imageUrl: data[index].photo ?? 'photo',
                                          width: double.infinity,
                                          height: (context.mediaQuery.size.width - 64) * (232 / 300),
                                        ),
                                      ),
                                      if (state.medicationTimes[preparatiData.guid]?.todayAndTomorrowTimesIsNotEmpty ??
                                          false) ...[
                                        AppUtils.kBoxHeight24,
                                        Text(
                                          context.translate('aplication_schedule'),
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                      if (state.medicationTimes[preparatiData.guid]?.todayTimesIsNotEmpty ?? false) ...[
                                        AppUtils.kBoxHeight16,
                                        Builder(builder: (context) {
                                          final List<SubPurposeMedicationTimesItem> today =
                                              state.medicationTimes[preparatiData.guid]?.today ?? [];
                                          return MedicationTimesWidget(
                                            title:
                                                '${context.translate('today')}, ${DateFormat('d MMMM', localSource.locale).format(DateTime.now())}',
                                            items: [
                                              for (final SubPurposeMedicationTimesItem data in today)
                                                getTimeText(data, preparatiData)
                                            ],
                                          );
                                        }),
                                      ],
                                      if (state.medicationTimes[preparatiData.guid]?.tomorrowTimesIsNotEmpty ??
                                          false) ...[
                                        AppUtils.kBoxHeight16,
                                        Builder(builder: (context) {
                                          final List<SubPurposeMedicationTimesItem> tomorrow =
                                              state.medicationTimes[preparatiData.guid]?.tomorrow ?? [];
                                          return MedicationTimesWidget(
                                            title:
                                                "${context.translate('tomorrow')}, ${DateFormat('d MMMM', localSource.locale).format(DateTime.now().add(const Duration(days: 1)))}",
                                            items: [
                                              for (final SubPurposeMedicationTimesItem data in tomorrow)
                                                getTimeText(data, preparatiData)
                                            ],
                                          );
                                        }),
                                      ],
                                      AppUtils.kBoxHeight8,
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ] else if (state.status == SubPurposeStatus.loading) ...[
                  const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator.adaptive()),
                  )
                ] else ...[
                  SliverFillRemaining(
                    child: Center(
                      child: Text(
                        context.translate('drug_not_available'),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ]
              ],
            );
          },
        ),
        bottomNavigationBar: SafeArea(
          child: BottomNavigationButton(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.myAppointments,
                  (route) => route.isFirst,
                );
              },
              child: Text(context.translate('take_medicine')),
            ),
          ),
        ),
      );
}
