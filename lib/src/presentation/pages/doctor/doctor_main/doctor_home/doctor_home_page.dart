import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../data/models/home/get_visits/doctor_booking_request_response.dart';
import '../../../../bloc/doctor/doctor_main/doctor_home/doctor_home_bloc.dart';
import '../../../../components/dialogs/dialogs.dart';

part 'mixin/doctor_home_page_mixin.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({super.key});

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage>
    with DoctorHomePageMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.colorScheme.background,
          surfaceTintColor: context.theme.colorScheme.background,
          title: Text(
            context.translate('home_menu'),
            style: context.theme.appBarTheme.titleTextStyle?.copyWith(
              fontSize: 28,
            ),
          ),
        ),
        body: BlocBuilder<DoctorHomeBloc, DoctorHomeState>(
          builder: (context, state) => RefreshIndicator(
            onRefresh: () async => context.read<DoctorHomeBloc>()
              ..add(const GetNextPatients$DoctorHomeEvent(false))
              ..add(const GetPatients$DoctorHomeEvent())
              ..add(const GetDoctorBookingRequests$DoctorHomeEvent()),
            child: Padding(
              padding: AppUtils.kPaddingAll16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SegmentedButton<int>(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (states) => states.contains(MaterialState.selected)
                            ? context.colorScheme.primaryContainer
                            : context.colorScheme.secondaryContainer,
                      ),
                      foregroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
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
                    onSelectionChanged: (p0) => context.read<DoctorHomeBloc>()
                      ..add(const GetNextPatients$DoctorHomeEvent(false))
                      ..add(SelectSegment$DoctorHomeEvent(index: p0))
                      ..add(const GetDoctorBookingRequests$DoctorHomeEvent())
                      ..add(const GetPatients$DoctorHomeEvent()),
                    showSelectedIcon: false,
                    segments: [
                      ButtonSegment(
                        value: 0,
                        label: Text(context.translate('free_time')),
                      ),
                      ButtonSegment(
                        value: 1,
                        label: Text(context.translate('requests')),
                      ),
                      ButtonSegment(
                        value: 2,
                        label: Text(
                          context.translate('booked_time'),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                    selected: state.selectedSegments,
                  ),
                  AppUtils.kBoxHeight16,
                  Expanded(
                    child: IndexedStack(
                      index: state.selectedSegments.first,
                      children: [
                        state.freeBookings.isEmpty
                            ? ListView(
                                children: const [
                                  AppUtils.kBoxHeight16,
                                  Padding(
                                    padding: EdgeInsets.all(80),
                                    child: Image(
                                      image: AssetImage(
                                          'assets/png/subscription.png'),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  Expanded(
                                    child: GridView.builder(
                                      controller: _scrollController,
                                      itemCount: state.freeBookings.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 16,
                                      ),
                                      itemBuilder: (context, index) {
                                        final i = state.freeBookings[index];
                                        return GestureDetector(
                                          onLongPress: () async {
                                            final result =
                                                await customYesNoDialog<bool?>(
                                              context: context,
                                              title: 'Bekor qilmoqchimisiz',
                                              content:
                                                  'Siz rostdan ham shu vaqt oralig\'ini bekor qilmoqchimisiz',
                                              acceptOnTap: () =>
                                                  Navigator.pop(context, true),
                                            );
                                            if (result != null &&
                                                result == true &&
                                                context.mounted) {
                                              context
                                                  .read<DoctorHomeBloc>()
                                                  .add(
                                                    DeleteDoctorFreeTime$DoctorHomeEvent(
                                                      timeId: i.guid,
                                                    ),
                                                  );
                                            }
                                          },
                                          child: InkWell(
                                            onTap: () async {
                                              await Navigator.pushNamed(
                                                  context, Routes.addFreeTime,
                                                  arguments: i);
                                              if (context.mounted) {
                                                context.read<DoctorHomeBloc>().add(
                                                    const GetPatients$DoctorHomeEvent());
                                              }
                                            },
                                            child: Card(
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              color: context
                                                  .colorScheme.primaryContainer,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 12),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      DateFormat('dd-MM-yyyy')
                                                          .format(
                                                        i.date.subtract(
                                                            const Duration(
                                                                days: 1)),
                                                      ),
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: context
                                                            .colorScheme
                                                            .onPrimaryContainer
                                                            .withOpacity(0.8),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      '${i.fromTime}-${i.toTime}',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: context
                                                            .colorScheme
                                                            .onPrimaryContainer,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Container(
                                                      width: 40,
                                                      height: 2,
                                                      decoration: BoxDecoration(
                                                        color: context
                                                            .colorScheme
                                                            .onPrimaryContainer
                                                            .withOpacity(0.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  state.isLoading
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                        state.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : state.filteredRequests.isEmpty
                                ? ListView(
                                    children: const [
                                      AppUtils.kBoxHeight16,
                                      Padding(
                                        padding: EdgeInsets.all(80),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/png/subscription.png'),
                                        ),
                                      ),
                                    ],
                                  )
                                : ListView.separated(
                                    itemCount: state.filteredRequests.length,
                                    itemBuilder: (context, index) =>
                                        DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: context.colorScheme.surface,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: context.colorScheme.shadow
                                                .withOpacity(0.1),
                                            blurRadius: 8,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              Routes.doctorRequests,
                                              arguments: DoctorRequestArguments(
                                                bookingResponse:
                                                    state.filteredRequests[index],
                                                reject: () async {
                                                  final result =
                                                      await showDialog<bool?>(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                      title: Text(
                                                        context.translate(
                                                            'are_you_sure_you_want_to_cancel'),
                                                        style: TextStyle(
                                                          color: context
                                                              .colorScheme
                                                              .onBackground,
                                                        ),
                                                      ),
                                                      content: TextField(
                                                        controller:
                                                            _rejectCommentController,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: context
                                                                  .colorScheme
                                                                  .outline,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context,
                                                                  false),
                                                          child: Text(
                                                              context.translate(
                                                                  'cancel')),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context,
                                                                  true),
                                                          child: Text(
                                                              context.translate(
                                                                  'save')),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                  if (result != null &&
                                                      result == true &&
                                                      context.mounted) {
                                                    context
                                                        .read<DoctorHomeBloc>()
                                                        .add(
                                                          RejectDoctorBookingRequest$DoctorHomeEvent(
                                                            requestId: state
                                                                .filteredRequests[index]
                                                                .guid,
                                                            rejectComment:
                                                                _rejectCommentController
                                                                    .text,
                                                          ),
                                                        );
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                accept: () async {
                                                  final result =
                                                      await customYesNoDialog<
                                                          bool?>(
                                                    context: context,
                                                    title: context.translate(
                                                        'do_you_want_accept'),
                                                    content: '',
                                                    acceptOnTap: () =>
                                                        Navigator.pop(
                                                            context, true),
                                                  );
                                                  if (result != null &&
                                                      result == true &&
                                                      context.mounted) {
                                                    context
                                                        .read<DoctorHomeBloc>()
                                                        .add(
                                                          AcceptDoctorBookingRequest$DoctorHomeEvent(
                                                            booking:
                                                                state.filteredRequests[
                                                                    index],
                                                          ),
                                                        );
                                                    Navigator.pop(context);
                                                  }
                                                },
                                              ),
                                            );
                                          },
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            state
                                                                .filteredRequests[index]
                                                                .clientsIdData
                                                                .clientName,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: context
                                                                  .colorScheme
                                                                  .onSurface,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 4),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .phone_rounded,
                                                                size: 14,
                                                                color: context
                                                                    .colorScheme
                                                                    .primary,
                                                              ),
                                                              const SizedBox(
                                                                  width: 4),
                                                              Text(
                                                                state
                                                                    .filteredRequests[
                                                                        index]
                                                                    .clientsIdData
                                                                    .phone,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  color: context
                                                                      .colorScheme
                                                                      .primary,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        _buildActionButton(
                                                          context: context,
                                                          icon: Icons.close,
                                                          color: context
                                                              .colorScheme
                                                              .error,
                                                          onPressed: () async {
                                                            final result =
                                                                await showDialog<
                                                                    bool?>(
                                                              context: context,
                                                              builder:
                                                                  (context) =>
                                                                      AlertDialog(
                                                                title: Text(
                                                                  context.translate(
                                                                      'are_you_sure_you_want_to_cancel'),
                                                                  style:
                                                                      TextStyle(
                                                                    color: context
                                                                        .colorScheme
                                                                        .onBackground,
                                                                  ),
                                                                ),
                                                                content:
                                                                    TextField(
                                                                  controller:
                                                                      _rejectCommentController,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: context
                                                                            .colorScheme
                                                                            .outline,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            context,
                                                                            false),
                                                                    child: Text(
                                                                        context.translate(
                                                                            'cancel')),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            context,
                                                                            true),
                                                                    child: Text(
                                                                        context.translate(
                                                                            'save')),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                            if (result != null &&
                                                                result ==
                                                                    true &&
                                                                context
                                                                    .mounted) {
                                                              context
                                                                  .read<
                                                                      DoctorHomeBloc>()
                                                                  .add(
                                                                    RejectDoctorBookingRequest$DoctorHomeEvent(
                                                                      requestId: state
                                                                          .filteredRequests[
                                                                              index]
                                                                          .guid,
                                                                      rejectComment:
                                                                          _rejectCommentController
                                                                              .text,
                                                                    ),
                                                                  );
                                                            }
                                                          },
                                                        ),
                                                        const SizedBox(
                                                            width: 8),
                                                        _buildActionButton(
                                                          context: context,
                                                          icon: Icons.check,
                                                          color: context
                                                              .colorScheme
                                                              .primary,
                                                          onPressed: () async {
                                                            final result =
                                                                await customYesNoDialog<
                                                                    bool?>(
                                                              context: context,
                                                              title: context
                                                                  .translate(
                                                                      'do_you_want_accept'),
                                                              content: '',
                                                              acceptOnTap: () =>
                                                                  Navigator.pop(
                                                                      context,
                                                                      true),
                                                            );
                                                            if (result != null &&
                                                                result ==
                                                                    true &&
                                                                context
                                                                    .mounted) {
                                                              context
                                                                  .read<
                                                                      DoctorHomeBloc>()
                                                                  .add(
                                                                    AcceptDoctorBookingRequest$DoctorHomeEvent(
                                                                      booking: state
                                                                              .filteredRequests[
                                                                          index],
                                                                    ),
                                                                  );
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 16),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                    color: context.colorScheme
                                                        .primaryContainer
                                                        .withOpacity(0.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .calendar_today_rounded,
                                                        size: 16,
                                                        color: context
                                                            .colorScheme
                                                            .primary,
                                                      ),
                                                      const SizedBox(width: 8),
                                                      Text(
                                                        DateTime.parse(state
                                                                .filteredRequests[index]
                                                                .doctorBookingIdData
                                                                .date)
                                                            .subtract(
                                                                const Duration(
                                                                    days: 1))
                                                            .formatDate,
                                                        style: TextStyle(
                                                          color: context
                                                              .colorScheme
                                                              .primary,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 16),
                                                      Icon(
                                                        Icons
                                                            .access_time_rounded,
                                                        size: 16,
                                                        color: context
                                                            .colorScheme
                                                            .primary,
                                                      ),
                                                      const SizedBox(width: 8),
                                                      Text(
                                                        '${state.filteredRequests[index].doctorBookingIdData.fromTime}-${state.filteredRequests[index].doctorBookingIdData.toTime}',
                                                        style: TextStyle(
                                                          color: context
                                                              .colorScheme
                                                              .primary,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    separatorBuilder: (context, index) =>
                                        AppUtils.kBoxHeight16,
                                  ),
                        state.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : state.busyBookings.isEmpty
                                ? ListView(
                                    children: const [
                                      AppUtils.kBoxHeight16,
                                      Padding(
                                        padding: EdgeInsets.all(80),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/png/subscription.png'),
                                        ),
                                      ),
                                    ],
                                  )
                                : ListView(
                                    children: [
                                      AppUtils.kBoxHeight16,
                                      for (final i in state.busyBookings)
                                        Column(
                                          children: [
                                            DecoratedBox(
                                              decoration: BoxDecoration(
                                                color:
                                                    context.colorScheme.surface,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: context
                                                        .colorScheme.shadow
                                                        .withOpacity(0.1),
                                                    blurRadius: 8,
                                                    offset: const Offset(0, 2),
                                                  ),
                                                ],
                                              ),
                                              child: Material(
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    onTap: () {
                                                      final request = state
                                                          .requests
                                                          .firstWhere(
                                                        (element) =>
                                                            element
                                                                .doctorBookingIdData
                                                                .guid ==
                                                            i.guid,
                                                      );
                                                      showDialog<Object?>(
                                                        context: context,
                                                        builder: (context) =>
                                                            Dialog(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          elevation: 0,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(24),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: context
                                                                  .colorScheme
                                                                  .surface,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.1),
                                                                  blurRadius:
                                                                      10,
                                                                  offset:
                                                                      const Offset(
                                                                          0, 5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                              12,
                                                                          vertical:
                                                                              8),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: context
                                                                            .colorScheme
                                                                            .primaryContainer,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            DateFormat('dd').format(i.date.subtract(const Duration(days: 1))),
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 24,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: context.colorScheme.onPrimaryContainer,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            DateFormat('MMM', localSource.locale).format(i.date.subtract(const Duration(days: 1))),
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 14,
                                                                              color: context.colorScheme.onPrimaryContainer.withOpacity(0.8),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            16),
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            i.clientsIdData.fullName,
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: context.colorScheme.onSurface,
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                              height: 4),
                                                                          Text(
                                                                            '${i.fromTime}-${i.toTime}',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 14,
                                                                              color: context.colorScheme.primary,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                              8,
                                                                          vertical:
                                                                              4),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: context
                                                                            .colorScheme
                                                                            .primary
                                                                            .withOpacity(0.1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        context.translate(
                                                                            'confirmed'),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          color: context
                                                                              .colorScheme
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height: 24),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          16),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: context
                                                                        .colorScheme
                                                                        .surfaceVariant
                                                                        .withOpacity(
                                                                            0.5),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                  ),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Icon(
                                                                            Icons.phone_rounded,
                                                                            size:
                                                                                20,
                                                                            color:
                                                                                context.colorScheme.primary,
                                                                          ),
                                                                          const SizedBox(
                                                                              width: 8),
                                                                          Text(
                                                                            context.translate('phone_number'),
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: context.colorScheme.onSurface,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                          height:
                                                                              8),
                                                                      Text(
                                                                        i.clientsIdData
                                                                            .phone,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color: context
                                                                              .colorScheme
                                                                              .onSurfaceVariant,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                if (request
                                                                    .patientDescription
                                                                    .isNotEmpty) ...[
                                                                  const SizedBox(
                                                                      height:
                                                                          16),
                                                                  Container(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            16),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: context
                                                                          .colorScheme
                                                                          .surfaceVariant
                                                                          .withOpacity(
                                                                              0.5),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            Icon(
                                                                              Icons.comment_rounded,
                                                                              size: 20,
                                                                              color: context.colorScheme.primary,
                                                                            ),
                                                                            const SizedBox(width: 8),
                                                                            Text(
                                                                              context.translate('patient_comments'),
                                                                              style: TextStyle(
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.w600,
                                                                                color: context.colorScheme.onSurface,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                8),
                                                                        Text(
                                                                          request
                                                                              .patientDescription
                                                                              .replaceAll('<p>', '')
                                                                              .replaceAll('</p>', ''),
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                context.colorScheme.onSurfaceVariant,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                                const SizedBox(
                                                                    height: 24),
                                                                SizedBox(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                      ElevatedButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            context),
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          vertical:
                                                                              16),
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(12),
                                                                      ),
                                                                    ),
                                                                    child: Text(
                                                                      context.translate(
                                                                          'close'),
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        12,
                                                                    vertical:
                                                                        8),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: context
                                                                  .colorScheme
                                                                  .primaryContainer,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  DateFormat(
                                                                          'dd')
                                                                      .format(i
                                                                          .date
                                                                          .subtract(
                                                                              const Duration(days: 1))),
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        24,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: context
                                                                        .colorScheme
                                                                        .onPrimaryContainer,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  DateFormat(
                                                                          'MMM',
                                                                          localSource
                                                                              .locale)
                                                                      .format(i
                                                                          .date
                                                                          .subtract(
                                                                              const Duration(days: 1))),
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: context
                                                                        .colorScheme
                                                                        .onPrimaryContainer
                                                                        .withOpacity(
                                                                            0.8),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 16),
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  i.clientsIdData
                                                                      .fullName,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: context
                                                                        .colorScheme
                                                                        .onSurface,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height: 4),
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .access_time_rounded,
                                                                      size: 14,
                                                                      color: context
                                                                          .colorScheme
                                                                          .primary,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            4),
                                                                    Text(
                                                                      '${i.fromTime}-${i.toTime}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: context
                                                                            .colorScheme
                                                                            .primary,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height: 4),
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .phone_rounded,
                                                                      size: 14,
                                                                      color: context
                                                                          .colorScheme
                                                                          .primary,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            4),
                                                                    Text(
                                                                      i.clientsIdData
                                                                          .phone,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: context
                                                                            .colorScheme
                                                                            .primary,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        8,
                                                                    vertical:
                                                                        4),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: context
                                                                  .colorScheme
                                                                  .primary
                                                                  .withOpacity(
                                                                      0.1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: Text(
                                                              context.translate(
                                                                  'confirmed'),
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: context
                                                                    .colorScheme
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            AppUtils.kBoxHeight16,
                                          ],
                                        )
                                    ],
                                  ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: BlocBuilder<DoctorHomeBloc, DoctorHomeState>(
          builder: (context, state) => state.selectedSegments.first == 0
              ? FloatingActionButton(
                  onPressed: () async {
                    await Navigator.pushNamed(context, Routes.addFreeTime).then(
                      (value) {
                        if (context.mounted) {
                          context
                              .read<DoctorHomeBloc>()
                              .add(const GetPatients$DoctorHomeEvent());
                        }
                      },
                    );
                  },
                  child: const Icon(Icons.add),
                )
              : const SizedBox(),
        ),
      );
}

class DoctorRequestArguments {
  const DoctorRequestArguments({
    required this.bookingResponse,
    required this.reject,
    required this.accept,
  });

  final BookingResponse bookingResponse;
  final void Function() reject;
  final void Function() accept;
}

Widget _buildActionButton({
  required BuildContext context,
  required IconData icon,
  required Color color,
  required VoidCallback onPressed,
}) =>
    Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 20,
            color: color,
          ),
        ),
      ),
    );
