import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/mixin/cache_mixin.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_home/doctor_patient_response.dart';
import '../../../../../data/models/home/get_visits/doctor_booking_request_response.dart';
import '../../../../../domain/repositories/doctor/doctor_main/doctor_home/doctor_home_repository.dart';

part 'doctor_home_event.dart';
part 'doctor_home_state.dart';

class DoctorHomeBloc extends Bloc<DoctorHomeEvent, DoctorHomeState> with CacheMixin {
  DoctorHomeBloc(this.doctorHomeRepository) : super(const DoctorHomeState()) {
    on<DoctorHomeEvent>(
      (event, emit) => switch (event) {
        SelectSegment$DoctorHomeEvent _ => _selectSegment(event, emit),
        GetPatients$DoctorHomeEvent _ => _getPatients(event, emit),
        DeleteDoctorFreeTime$DoctorHomeEvent _ => _deleteDoctorFreeTime(event, emit),
        GetDoctorBookingRequests$DoctorHomeEvent _ => _getDoctorBookingRequests(event, emit),
        RejectDoctorBookingRequest$DoctorHomeEvent _ => _rejectDoctorBookingRequest(event, emit),
        AcceptDoctorBookingRequest$DoctorHomeEvent _ => _acceptDoctorBookingRequest(event, emit),
        AddTimeLoading$DoctorHomeEvent _ => _addTimeLoading(event, emit),
      },
    );
  }

  final DoctorHomeRepository doctorHomeRepository;

  void _selectSegment(SelectSegment$DoctorHomeEvent event, Emitter<DoctorHomeState> emit) {
    emit(state.copyWith(selectedSegments: event.index));
  }

  Future<void> _getPatients(
    GetPatients$DoctorHomeEvent event,
    Emitter<DoctorHomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final result = await doctorHomeRepository.getPatient(
        request: {
          'data': {
            'doctor_id': localSource.userId,
            'limit': 1000,
            'offset': null,
            // ignore: inference_failure_on_collection_literal
            'order': {},
            // ignore: inference_failure_on_collection_literal
            'view_fields': [],
            'search': '',
            'undefined': ''
          }
        },
      );
      if (result.isRight) {
        final response = result.right.data.data.response;
        emit(state.copyWith(bookings: response));
        _separateBookings(event, emit);
      } else {
        emit(state.copyWith(isLoading: false));
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }

  void _separateBookings(
    GetPatients$DoctorHomeEvent event,
    Emitter<DoctorHomeState> emit,
  ) {
    final freeBookings = state.bookings
        .where((element) =>
            !element.isBooked && element.date.millisecondsSinceEpoch >= DateTime.now().millisecondsSinceEpoch)
        .toList();
    final busyBookings = state.bookings
        .where(
          (element) =>
              element.isBooked &&
              !element.finished &&
              element.date.millisecondsSinceEpoch >= DateTime.now().millisecondsSinceEpoch,
        )
        .toList();
    emit(state.copyWith(freeBookings: freeBookings, busyBookings: busyBookings));
  }

  Future<void> _deleteDoctorFreeTime(
    DeleteDoctorFreeTime$DoctorHomeEvent event,
    Emitter<DoctorHomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      await doctorHomeRepository.deleteDoctorFreeTime(
        timeId: event.timeId,
        // ignore: inference_failure_on_collection_literal
        request: {'data': {}},
      );
      await _getPatients(const GetPatients$DoctorHomeEvent(), emit);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _getDoctorBookingRequests(
    GetDoctorBookingRequests$DoctorHomeEvent event,
    Emitter<DoctorHomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await doctorHomeRepository.getDoctorBookingRequests(
      request: {
        'data': {
          'limit': 1000,
          'offset': null,
          'order': {},
          'view_fields': ['patient_description', 'doctor_description'],
          'search': '',
          'undefined': ''
        }
      },
    );

    print('REQUESTSA: ${response.right.data.data.response}');

    response.fold(
      (e) {
        emit(state.copyWith(isLoading: false));
      },
      (r) {
        emit(state.copyWith(
            requests: r.data.data.response.where((e) => e.doctorBookingIdData.doctorId == localSource.userId).toList(),
            filteredRequests: r.data.data.response
                .where((e) => e.doctorBookingIdData.doctorId == localSource.userId && e.status.contains('pending'))
                .toList()));
      },
    );
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _rejectDoctorBookingRequest(
    RejectDoctorBookingRequest$DoctorHomeEvent event,
    Emitter<DoctorHomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      await doctorHomeRepository.updateDoctorRequest(
        request: {
          'data': {
            'guid': event.requestId,
            'status': ['rejected'],
            'doctor_description': '<p>${event.rejectComment}</p>',
          }
        },
      );

      await _getDoctorBookingRequests(const GetDoctorBookingRequests$DoctorHomeEvent(), emit);
    } on Exception catch (e) {
      debugPrint(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _acceptDoctorBookingRequest(
    AcceptDoctorBookingRequest$DoctorHomeEvent event,
    Emitter<DoctorHomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      await doctorHomeRepository.updateDoctorRequest(
        request: {
          'data': {
            'guid': event.booking.guid,
            'status': ['approved'],
          }
        },
      );

      await doctorHomeRepository.bookDoctor(
        request: {
          'data': {
            'guid': event.booking.doctorBookingIdData.guid,
            'doctor_id': localSource.userId,
            'cleints_id': event.booking.clientsId,
            'is_booked': true,
          }
        },
      );

      await _getDoctorBookingRequests(const GetDoctorBookingRequests$DoctorHomeEvent(), emit);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _addTimeLoading(
    AddTimeLoading$DoctorHomeEvent event,
    Emitter<DoctorHomeState> emit,
  ) async {
    emit(state.copyWith(isLoadingAdd: true));
    await Future<Object?>.delayed(const Duration(seconds: 3));
    emit(state.copyWith(isLoadingAdd: false));
  }
}
