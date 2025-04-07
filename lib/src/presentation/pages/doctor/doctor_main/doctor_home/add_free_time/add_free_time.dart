import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../config/router/app_routes.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../data/models/doctor/doctor_main/doctor_home/doctor_patient_response.dart';
import '../../../../../bloc/doctor/doctor_main/doctor_home/add_free_time/add_free_time_bloc.dart';
import '../../../../../bloc/doctor/doctor_main/doctor_home/doctor_home_bloc.dart';
import '../../../../../components/buttons/bottom_navigation_button.dart';
import '../../../../../components/dialogs/dialogs.dart';

part 'mixin/add_free_time_mixin.dart';

class AddFreeTime extends StatefulWidget {
  const AddFreeTime({super.key, required this.id});

  final DoctorBooking? id;

  @override
  State<AddFreeTime> createState() => _AddFreeTimeState();
}

class _AddFreeTimeState extends State<AddFreeTime> with AddFreeTimeMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.colorScheme.background,
          surfaceTintColor: context.theme.colorScheme.background,
          title: Text(
            widget.id != null ? context.translate('change') : context.translate('add_free_time'),
          ),
          centerTitle: true,
          actions: [
            if (widget.id != null)
              IconButton(
                onPressed: () async {
                  await customYesNoDialog<Object?>(
                    context: context,
                    title: context.translate('are_you_want_remove_free_time'),
                    content: context.translate('are_you_want_remove_free_time_body'),
                    acceptOnTap: () {
                      if(context.read<DoctorHomeBloc>().state.requests.any((e) => e.doctorBookingIdData.guid == widget.id?.guid)){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(context.translate('you_cant_remove_free_time')),
                          backgroundColor: context.theme.colorScheme.error,
                        ),
                      );
                      }else{
                        context.read<DoctorHomeBloc>().add(DeleteDoctorFreeTime$DoctorHomeEvent(timeId: widget.id!.guid));
                      }
                      Navigator.pop(context);
                    },
                  );
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                icon: Icon(
                  Icons.delete,
                  color: context.colorScheme.error,
                ),
              ),
            AppUtils.kBoxWidth8,
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppUtils.kPaddingAll16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppUtils.kBoxWidth16,
                    Text(context.translate('doctor_name')),
                  ],
                ),
                AppUtils.kBoxHeight12,
                TextField(
                  decoration: InputDecoration(
                    hintText: localSource.firstName,
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: AppUtils.kBorderRadius10,
                    ),
                    hintStyle: TextStyle(color: context.colorScheme.onBackground),
                    contentPadding: AppUtils.kPaddingAll16,
                    filled: true,
                    fillColor: context.color.disabledCard,
                  ),
                  enabled: false,
                ),
                AppUtils.kBoxHeight16,
                Row(
                  children: [
                    AppUtils.kBoxWidth16,
                    Text(context.translate('date')),
                  ],
                ),
                AppUtils.kBoxHeight12,
                InkWell(
                  overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (date?.day != null && date!.day >= DateTime.now().day) {
                      dateTimeController.text = DateFormat('dd/MM/yyyy').format(date);
                      dateTime = date;
                    } else {
                      dateTimeController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
                      dateTime = DateTime.now();
                    }
                    setState(() {});
                  },
                  child: TextField(
                    controller: dateTimeController,
                    style: TextStyle(color: context.colorScheme.onBackground),
                    decoration: InputDecoration(
                      hintText: context.translate('date'),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: AppUtils.kBorderRadius10,
                      ),
                      contentPadding: AppUtils.kPaddingAll16,
                      filled: true,
                      fillColor: context.color.disabledCard,
                    ),
                    enabled: false,
                  ),
                ),
                AppUtils.kBoxHeight16,
                Row(
                  children: [
                    AppUtils.kBoxWidth16,
                    Text(context.translate('time_range')),
                  ],
                ),
                AppUtils.kBoxHeight12,
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: InkWell(
                          onTap: () async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (time != null) {
                              startTimeController.text =
                                  '${time.hour.toString().padLeft(2, "0")}:${time.minute.toString().padLeft(2, "0")}';
                            }
                            setState(() {});
                          },
                          overlayColor: const MaterialStatePropertyAll(
                            Colors.transparent,
                          ),
                          child: TextField(
                            controller: startTimeController,
                            style: TextStyle(color: context.colorScheme.onBackground),
                            decoration: InputDecoration(
                              hintText: context.translate('from'),
                              disabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: AppUtils.kBorderRadius10,
                              ),
                              contentPadding: AppUtils.kPaddingAll16,
                              filled: true,
                              fillColor: context.color.disabledCard,
                            ),
                            enabled: false,
                          ),
                        ),
                      ),
                    ),
                    AppUtils.kBoxWidth16,
                    Expanded(
                      child: SizedBox(
                        child: InkWell(
                          onTap: () async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (time != null) {
                              endTimeController.text =
                                  '${time.hour.toString().padLeft(2, "0")}:${time.minute.toString().padLeft(2, "0")}';
                            }
                            setState(() {});
                          },
                          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                          child: TextField(
                            controller: endTimeController,
                            style: TextStyle(color: context.colorScheme.onBackground),
                            decoration: InputDecoration(
                              hintText: context.translate('to'),
                              disabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: AppUtils.kBorderRadius10,
                              ),
                              contentPadding: AppUtils.kPaddingAll16,
                              filled: true,
                              fillColor: context.color.disabledCard,
                            ),
                            enabled: false,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationButton(
          child: BlocBuilder<DoctorHomeBloc, DoctorHomeState>(
            builder: (context, state) => ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  dateTimeController.text.isNotEmpty &&
                          startTimeController.text.isNotEmpty &&
                          endTimeController.text.isNotEmpty
                      ? context.colorScheme.primary
                      : context.colorScheme.tertiaryContainer,
                ),
              ),
              onPressed: () {
                if (!state.isLoadingAdd && !context.read<AddFreeTimeBloc>().state.isLoading) {
                  if (dateTimeController.text.isNotEmpty &&
                      startTimeController.text.isNotEmpty &&
                      endTimeController.text.isNotEmpty) {
                    if (int.parse(startTimeController.text.replaceAll(':', '')) <
                        int.parse(endTimeController.text.replaceAll(':', ''))) {
                      if (widget.id != null) {
                        if (dateTime.millisecondsSinceEpoch > DateTime.now().millisecondsSinceEpoch) {
                          context.read<DoctorHomeBloc>().add(const AddTimeLoading$DoctorHomeEvent());
                          context.read<AddFreeTimeBloc>().add(
                                UpdateTime$AddFreeTimeEvent(
                                  context: context,
                                  date: dateTime,
                                  startTime: startTimeController.text,
                                  endTime: endTimeController.text,
                                  id: widget.id!.guid,
                                ),
                              );
                        } else {
                          ScaffoldMessenger.of(context)
                            ..clearSnackBars()
                            ..showSnackBar(
                              SnackBar(
                                content: Text(
                                  context.translate('expired_date'),
                                ),
                              ),
                            );
                        }
                      } else {
                        var isFree = true;
                        final start = int.parse(startTimeController.text.replaceAll(':', ''));
                        final end = int.parse(endTimeController.text.replaceAll(':', ''));
                        for (final i in state.bookings.where((e) => e.date.day - 1 == dateTime.day)) {
                          final startBooked = int.parse(i.fromTime.replaceAll(':', ''));
                          final endBooked = int.parse(i.toTime.replaceAll(':', ''));
                          if ((startBooked <= start && start <= endBooked) ||
                              (startBooked <= end && end <= endBooked)) {
                            isFree = false;
                          }
                        }
                        if (isFree) {
                          context.read<AddFreeTimeBloc>().add(
                                AddTime$AddFreeTimeEvent(
                                  context: context,
                                  date: dateTime,
                                  startTime: startTimeController.text,
                                  endTime: endTimeController.text,
                                ),
                              );
                        } else {
                          ScaffoldMessenger.of(context)
                            ..clearSnackBars()
                            ..showSnackBar(
                              SnackBar(
                                content: Text(
                                  context.translate('you_dont_have_free_time'),
                                ),
                              ),
                            );
                        }
                      }
                    } else {
                      ScaffoldMessenger.of(context)
                        ..clearSnackBars()
                        ..showSnackBar(
                          SnackBar(
                            content: Text(
                              context.translate('wrong_time_range'),
                            ),
                          ),
                        );
                    }
                  }
                }
              },
              child: state.isLoadingAdd
                  ? CircularProgressIndicator(
                      color: context.colorScheme.onPrimary,
                    )
                  : widget.id != null
                      ? Text(context.translate('change'))
                      : Text(context.translate('add')),
            ),
          ),
        ),
      );
}
