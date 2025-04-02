import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../config/router/app_routes.dart';
import '../../../core/extension/extension.dart';
import '../../../data/models/consultation/check_consultation_days_response.dart';
import '../../../data/models/doctor/doctor_main/doctor_home/doctor_patient_response.dart';
import '../../../data/models/home/get_visits/doctor_booking_request_response.dart';
import '../../../data/models/home/get_visits/get_visits_response.dart';
import '../../../data/source/local_source.dart';
import '../../../domain/repositories/home/home_repository.dart';
import '../../../injector_container.dart';

part 'my_visit_bloc.freezed.dart';

part 'my_visit_event.dart';

part 'my_visit_state.dart';

class MyVisitBloc extends Bloc<MyVisitEvent, MyVisitState> {
  MyVisitBloc(this.repository) : super(const MyVisitState()) {
    on<GetVisitEvent>(_getVisit);
    on<CheckConsultationDaysEvent>(_checkConsultationDays);
    on<GetDoctorFreeTimeEvent>(_getDoctorFreeTime);
    on<GetSelectedDateEvent>(_getSelectedDate);
    on<SelectFreeTime>(_selectFreeTime);
    on<BookDoctorEvent>(_bookDoctor);
    on<GetDoctorBookingRequestsEvent>(_getDoctorBookingRequests);
  }

  final HomeRepository repository;

  Future<void> _getVisit(
    GetVisitEvent event,
    Emitter<MyVisitState> emit,
  ) async {
    final response = await repository.getMyVisits({
      'data': {
        'guid': event.guid,
      }
    });
    response.fold(
      (e) {},
      (r) {
        if ((r.myVisits ?? []).length == 1) {
          emit(state.copyWith(visitData: r.myVisits!.first));
        }
      },
    );
  }

  Future<void> _checkConsultationDays(
    CheckConsultationDaysEvent event,
    Emitter<MyVisitState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await repository.checkConsultationDays(
      request: jsonEncode({
        'cleints_id': localSource.userId,
        'status': ['активный']
      }),
    );

    response.fold(
      (e) => emit(state.copyWith(isLoading: false)),
      (r) {
        if (r.data?.data?.response?.isNotEmpty ?? false) {
          final ConsultationDaysInfo? subscription = r.data?.data?.response?.first;

          emit(state.copyWith(
            isLoading: false,
            subscriptionName: sl<LocalSource>().locale == 'uz'
                ? subscription?.subscriptionNameUz ?? ''
                : subscription?.subscriptionName ?? '',
            consultationDays: subscription?.consultationCount ?? 0,
            isExistConsultationDays: (subscription?.consultationCount == null) ? false : true,
          ));
        } else {
          emit(state.copyWith(isLoading: false));
        }
      },
    );
  }

  Future<void> _getDoctorFreeTime(
    GetDoctorFreeTimeEvent event,
    Emitter<MyVisitState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final result = await repository.getPatient(
        request: {
          'data': {
            'doctor_id': [event.guid],
            'offset': null,
            'order': {},
            'search': '',
            'undefined': ''
          }
        },
      );
      if (result.isRight) {
        emit(state.copyWith(bookings: result.right.data.data.response));
        _getSelectedDate(
            GetSelectedDateEvent(
                selectedDate: state.selected?.date.subtract(const Duration(days: 1)) ?? DateTime.now()),
            emit);
      } else {
        emit(state.copyWith(isLoading: false));
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }

  void _getSelectedDate(
    GetSelectedDateEvent event,
    Emitter<MyVisitState> emit,
  ) {
    emit(
      state.copyWith(
        selectedBookings:
            state.bookings.where((e) => e.date.day == event.selectedDate.add(const Duration(days: 1)).day).toList(),
      ),
    );
  }

  void _selectFreeTime(SelectFreeTime event, Emitter<MyVisitState> emit) {
    if (state.selected == event.freeTime) {
      emit(state.copyWith(selected: null));
    } else {
      emit(state.copyWith(selected: event.freeTime));
    }
  }

  Future<void> _bookDoctor(BookDoctorEvent event, Emitter<MyVisitState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await repository.requestBookDoctor(
        request: {
          'data': {
            'doctor_booking_id': event.doctorBookingGuid,
            'doctor_id': event.doctorGuid,
            'cleints_id': localSource.userId,
            'status': ['pending'],
            'doctor_description': '<p></p>',
            'patient_description': '<p>${event.comment}</p>',
          }
        },
      );
      await _getDoctorFreeTime(GetDoctorFreeTimeEvent(guid: event.doctorGuid), emit);
      _getSelectedDate(
        GetSelectedDateEvent(
          selectedDate: state.selected?.date.subtract(const Duration(days: 1)) ?? DateTime.now(),
        ),
        emit,
      );
      if (event.context.mounted) {
        await showDialog<Object?>(
          context: event.context,
          builder: (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle_outline,
                      size: 48,
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    context.translate('request_success'),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        context.translate('back'),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
// ... existing code ...
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _getDoctorBookingRequests(
    GetDoctorBookingRequestsEvent event,
    Emitter<MyVisitState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await repository.getDoctorBookingRequests(
      request: {
        'data': {
          'cleints_id': [localSource.userId],
          'offset': null,
          // ignore: inference_failure_on_collection_literal
          'order': {},
          'view_fields': ['patient_description', 'doctor_description'],
          'search': '',
          'undefined': ''
        }
      },
    );
    response.fold(
      (e) {
        emit(state.copyWith(isLoading: false));
      },
      (r) {
        emit(state.copyWith(
          bookingRequests: r.data.data.response.where((e) => e.clientsId == localSource.userId).toList(),
        ));
      },
    );
    emit(state.copyWith(isLoading: false));
  }
}
