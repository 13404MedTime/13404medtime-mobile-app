import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../config/router/routes_arguments.dart';
import '../../../../../core/constants/app_keys.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/base_functions.dart';
import '../../../../../data/models/home/get_visits/get_visits_response.dart';
import '../../../../../data/models/my_appointments/my_appointments_response.dart';
import '../../../../additional_mixins/remote_like_mixin.dart';
import '../../../../bloc/main/profile/favourite_doctor/favourite_doctor_bloc.dart';
import '../../../../bloc/my_visit/my_visit_bloc.dart';
import '../../../../components/buttons/bottom_navigation_button.dart';
import '../../../../components/custom_cached_network_image/custom_cached_network_image.dart';
import '../../../../components/loading_widgets/custom_circular_progress_indicator.dart';
import 'purpose/args/purpose_page_args.dart';
import 'widgets/purpose.dart';

part 'mixin/my_visit_mixin.dart';

class MyVisitPage extends StatefulWidget {
  const MyVisitPage({
    this.arguments,
    super.key,
  });

  final MyVisitArgument? arguments;

  @override
  State<MyVisitPage> createState() => _MyVisitPageState();
}

class _MyVisitPageState extends State<MyVisitPage> with MyVisitMixin, RemoteLikeMixin {
  late final bool isHavePurpose = widget.arguments?.isHavePurpose ?? true;
  late final MyVisitModel? myVisit = widget.arguments?.myVisit;
  late final ValueNotifier<DateTime> selectedDate;
  late final TextEditingController textController;

  @override
  void initState() {
    context.read<MyVisitBloc>().add(const CheckConsultationDaysEvent());
    selectedDate = ValueNotifier(DateTime.now());
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    selectedDate.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FavouriteDoctorBloc? selectedDoctorsBloc = widget.arguments?.favoriteBloc;
    final experYear =
        (_bloc.state.visitData?.doctorIdData ?? (isHavePurpose ? myVisit?.doctorIdData : widget.arguments?.doctor))
                ?.experience ??
            0;
    final String guid =
        (_bloc.state.visitData?.doctorIdData ?? (isHavePurpose ? myVisit?.doctorIdData : widget.arguments?.doctor))
                ?.guid ??
            '';
    return Scaffold(
      appBar: AppBar(
        actions: [
          ValueListenableBuilder(
            valueListenable: localSource.prefes.listenable(
              keys: [AppKeys.favouriteDoctors],
            ),
            builder: (context, box, wid) => Ink(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: AppUtils.kBorderRadius8,
              ),
              child: InkWell(
                onTap: () async {
                  await updateLike(doctorId: guid).then(
                    (value) {
                      if (selectedDoctorsBloc != null) {
                        selectedDoctorsBloc.add(
                          const FavouriteDoctorEvent.getFavouriteDoctor(),
                        );
                      }
                    },
                  );
                },
                borderRadius: AppUtils.kBorderRadius8,
                child: Padding(
                  padding: AppUtils.kPaddingAll12,
                  child: Icon(
                    (box.get(AppKeys.favouriteDoctors)?.contains(guid) ?? false)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 24,
                    color: (box.get(AppKeys.favouriteDoctors)?.contains(guid) ?? false)
                        ? context.theme.colorScheme.primary
                        : context.color.grey.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          AppUtils.kGap12,
          AppUtils.kGap4,
        ],
      ),
      body: BlocBuilder<MyVisitBloc, MyVisitState>(
        builder: (context, state) {
          final DoctorIdData? doctor =
              state.visitData?.doctorIdData ?? (isHavePurpose ? myVisit?.doctorIdData : widget.arguments?.doctor);
          late final MyVisitModel? myVisitData = state.visitData ?? widget.arguments?.myVisit;
          return state.isLoading
              ? const Center(child: CustomCircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: () async {
                    context.read<MyVisitBloc>()
                      ..add(GetDoctorFreeTimeEvent(guid: guid))
                      ..add(const GetDoctorBookingRequestsEvent());
                  },
                  child: Padding(
                    padding: AppUtils.kPaddingHorizontal16,
                    child: CustomScrollView(
                      slivers: [
                        const SliverGap(16),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: context.mediaQuery.size.width * 0.87,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                CustomCachedNetworkImage(
                                  imageUrl: doctor?.medicPhoto ?? 'https://example.com/default_image.jpg',
                                  borderRadius: AppUtils.kBorderRadius8,
                                  height: context.mediaQuery.size.width * 0.87,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  left: 16,
                                  bottom: 16,
                                  child: Card(
                                    elevation: 0,
                                    color: context.color.onBackground50,
                                    child: Padding(
                                      padding: AppUtils.kPaddingAll10,
                                      child: Text(
                                        '${context.translate('experience')} $experYear ${experYear.numberToWordRussian(context.translate('years_s'), context.translate('years_g'), context.translate('years_m'))}',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: context.theme.colorScheme.onSecondary,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SliverGap(16),
                        SliverToBoxAdapter(
                          child: Card(
                            elevation: 0,
                            child: Padding(
                              padding: AppUtils.kPaddingHor16Ver12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    doctor?.doctorName ?? '',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: context.colorScheme.onBackground,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    maxLines: 2,
                                  ),
                                  if ((doctor?.hospital ?? '').isNotEmpty) ...[
                                    AppUtils.kBoxHeight6,
                                    Text(
                                      doctor?.hospital ?? '',
                                      style: context.textStyle.regularSubheadline.copyWith(
                                        color: context.color.grey,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ],
                                  if (getLocalText(doctor?.descUz ?? '', doctor?.desc ?? '').isNotEmpty) ...[
                                    AppUtils.kBoxHeight16,
                                    Text(
                                      context.translate('biography'),
                                      style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 3,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (!isHavePurpose) ...[
                          const SliverGap(16),
                          SliverToBoxAdapter(
                            child: ValueListenableBuilder(
                              valueListenable: selectedDate,
                              builder: (context, value, child) => Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            final date = await showDatePicker(
                                              context: context,
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2100),
                                            );
                                            if (date != null &&
                                                context.mounted &&
                                                date.isAfter(DateTime.now().subtract(const Duration(days: 1)))) {
                                              selectedDate.value = date;
                                              context.read<MyVisitBloc>().add(
                                                    GetSelectedDateEvent(
                                                      selectedDate: selectedDate.value,
                                                    ),
                                                  );
                                            }
                                          },
                                          child: Text(
                                            DateFormat('d-MM').format(value),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  AppUtils.kBoxHeight24,
                                  Column(
                                    children: [
                                      Wrap(
                                        spacing: 12,
                                        runSpacing: 12,
                                        children: [
                                          for (final i in state.selectedBookings)
                                            InkWell(
                                              onTap: () {
                                                if (!i.isBooked &&
                                                    !state.bookingRequests.any((e) =>
                                                        e.doctorBookingIdData.date ==
                                                            i.date
                                                                .subtract(const Duration(days: 1))
                                                                .toIso8601String() &&
                                                        e.doctorBookingIdData.fromTime == i.fromTime &&
                                                        e.doctorBookingIdData.toTime == i.toTime)) {
                                                  context.read<MyVisitBloc>().add(
                                                        SelectFreeTime(freeTime: i),
                                                      );
                                                }
                                              },
                                              borderRadius: BorderRadius.circular(16),
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(16),
                                                  gradient: state.selected == i
                                                      ? LinearGradient(
                                                          colors: [
                                                            context.colorScheme.primary,
                                                            context.colorScheme.primary.withOpacity(0.8),
                                                          ],
                                                          begin: Alignment.topLeft,
                                                          end: Alignment.bottomRight,
                                                        )
                                                      : null,
                                                  color: state.selected == i ? null : context.colorScheme.surface,
                                                  border: Border.all(
                                                    color: state.selected == i
                                                        ? Colors.transparent
                                                        : context.colorScheme.outline.withOpacity(0.15),
                                                    width: state.selected == i ? 0 : 1,
                                                  ),
                                                  boxShadow: [
                                                    if (state.selected == i)
                                                      BoxShadow(
                                                        color: context.colorScheme.primary.withOpacity(0.3),
                                                        blurRadius: 12,
                                                        offset: const Offset(0, 4),
                                                      )
                                                    else
                                                      BoxShadow(
                                                        color: Colors.black.withOpacity(0.05),
                                                        blurRadius: 8,
                                                        offset: const Offset(0, 2),
                                                      ),
                                                  ],
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      if (state.bookingRequests.any((e) =>
                                                          e.doctorBookingIdData.date == i.date.toIso8601String() &&
                                                          e.doctorBookingIdData.fromTime == i.fromTime &&
                                                          e.doctorBookingIdData.toTime == i.toTime)) ...[
                                                        Container(
                                                          padding: const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            color: state.selected == i
                                                                ? context.colorScheme.onPrimary.withOpacity(0.2)
                                                                : context.colorScheme.onBackground.withOpacity(0.1),
                                                            shape: BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            Icons.check,
                                                            size: 16,
                                                            color: state.selected == i
                                                                ? context.colorScheme.onPrimary
                                                                : context.colorScheme.onBackground.withOpacity(0.3),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10),
                                                      ],
                                                      Text(
                                                        '${i.fromTime} - ${i.toTime}',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              state.selected == i ? FontWeight.w600 : FontWeight.w500,
                                                          letterSpacing: 0.2,
                                                          color: i.isBooked ||
                                                                  state.bookingRequests.any((e) =>
                                                                      e.doctorBookingIdData.date ==
                                                                          i.date.toIso8601String() &&
                                                                      e.doctorBookingId == i.guid &&
                                                                      e.doctorBookingIdData.fromTime == i.fromTime &&
                                                                      e.doctorBookingIdData.toTime == i.toTime)
                                                              ? context.colorScheme.onBackground.withOpacity(0.3)
                                                              : state.selected == i
                                                                  ? context.colorScheme.onPrimary
                                                                  : context.colorScheme.onBackground,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                        if (isHavePurpose) ...[
                          const SliverGap(16),
                          PurposeWidget(
                            numberAppointments: myVisitData?.visitCount ?? 0,
                            numberMedicationsTaken: myVisitData?.amountMedicationTaken ?? 0,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.purposePage,
                                arguments: PurposePageArgs(
                                  doctorId: myVisitData?.doctorId ?? '',
                                ),
                              );
                            },
                          ),
                        ],
                        const SliverGap(16),
                      ],
                    ),
                  ),
                );
        },
      ),
      bottomNavigationBar: isHavePurpose
          ? const SizedBox()
          : BlocBuilder<MyVisitBloc, MyVisitState>(
              builder: (context, state) => BottomNavigationButton(
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: state.selected != null
                              ? context.colorScheme.primary
                              : context.colorScheme.tertiaryContainer,
                        ),
                        onPressed: () async {
                          if (!state.isLoading) {
                            Future<bool> onPressed() async {
                              if (textController.text.isNotEmpty) {
                                context.read<MyVisitBloc>().add(
                                      BookDoctorEvent(
                                        doctorBookingGuid: state.selected?.guid ?? '',
                                        comment: textController.text,
                                        doctorGuid: guid,
                                        context: context,
                                      ),
                                    );
                                return true;
                              }
                              return false;
                            }

                            if (state.selected != null) {
                              final add = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: context.colorScheme.background,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  contentPadding: const EdgeInsets.all(24),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        context.translate('leave_comment'),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: context.colorScheme.primary,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      TextField(
                                        controller: textController,
                                        maxLines: 2,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: context.colorScheme.surface,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: BorderSide(color: context.colorScheme.outline),
                                          ),
                                          hintText: context.translate('comment_required'),
                                          hintStyle: TextStyle(
                                            color: context.colorScheme.onSurface.withOpacity(0.3),
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 14,
                                          ),
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                        ),
                                        style: TextStyle(color: context.colorScheme.onSurface),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                  actionsPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, false),
                                      child: Text(
                                        context.translate('back'),
                                        style: TextStyle(
                                          color: context.colorScheme.secondary,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        final result = await onPressed();
                                        if (context.mounted && result) {
                                          Navigator.pop(context, true);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: context.colorScheme.primary,
                                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text(
                                        context.translate('order'),
                                        style: TextStyle(
                                          color: context.colorScheme.onPrimary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                              if (context.mounted && add != null && add) {
                                context.read<MyVisitBloc>()
                                  ..add(GetDoctorFreeTimeEvent(guid: guid))
                                  ..add(const GetDoctorBookingRequestsEvent());
                              }
                              textController.text = '';
                            }
                          }
                        },
                        child: state.isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: context.colorScheme.onPrimary,
                                ),
                              )
                            : Text(context.translate('order')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
