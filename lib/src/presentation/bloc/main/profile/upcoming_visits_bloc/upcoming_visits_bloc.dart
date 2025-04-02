import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_home/doctor_patient_response.dart';
import '../../../../../data/models/home/get_visits/doctor_booking_request_response.dart';
import '../../../../../domain/repositories/home/home_repository.dart';

part 'upcoming_visits_event.dart';
part 'upcoming_visits_state.dart';

class UpcomingVisitsBloc extends Bloc<UpcomingVisitsEvent, UpcomingVisitsState> {
  UpcomingVisitsBloc(this.homeRepository) : super(const UpcomingVisitsState()) {
    on<UpcomingVisitsEvent>((event, emit) => switch (event) {
          GetDoctorRequests$UpcomingVisitsEvent _ => _onGetDoctorRequests(event, emit),
          ChangeSelected$UpcomingVisitsEvent _ => _onChangeSelected(event, emit),
        });
  }

  final HomeRepository homeRepository;

  Future<void> _onGetDoctorRequests(
    GetDoctorRequests$UpcomingVisitsEvent event,
    Emitter<UpcomingVisitsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await homeRepository.getDoctorBookingRequests(
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
    final bookings = await homeRepository.getPatient(
      request: {
        'data': {
          'cleints_id': [localSource.userId],
          'offset': null,
          'search': '',
          'undefined': ''
        }
      },
    );
    final map = <String, List<BookingResponse>>{};
    for (final i in result.right.data.data.response) {
      final date = DateTime.parse(i.doctorBookingIdData.date);
      final key = DateFormat('dd MMMM yyyy').format(date);
      if (i.status.first.toLowerCase() != 'approved' && DateTime.parse(i.doctorBookingIdData.date).isAfter(DateTime.now())) {
        if (map.containsKey(key)) {
          final list = [...map[key]!, i]
            ..sort((a, b) => a.doctorBookingIdData.fromTime.compareTo(b.doctorBookingIdData.fromTime));
          map[key] = list;
        } else {
          map[key] = [i];
        }
      }
    }
    final map2 = <String, List<DoctorBooking>>{};
    for (final i in bookings.right.data.data.response) {
      final key = DateFormat('dd MMMM yyyy').format(i.date);
      if (i.isBooked && i.date.isAfter(DateTime.now())) {
        if (map2.containsKey(key)) {
          map2[key] = [...map2[key]!, i];
        } else {
          map2[key] = [i];
        }
        map2[key]!.sort((a, b) => a.fromTime.compareTo(b.fromTime));
      }
    }
    emit(state.copyWith(
      bookings: Map.fromEntries(
        map.entries.toList()
          ..sort(
            (a, b) => a.value.first.doctorBookingIdData.date.compareTo(b.value.first.doctorBookingIdData.date),
          ),
      ),
      doctorBookings: Map.fromEntries(
        map2.entries.toList()
          ..sort(
            (a, b) => a.value.first.date.compareTo(b.value.first.date),
          ),
      ),
      isLoading: false,
    ));
  }

  Future<void> _onChangeSelected(
    ChangeSelected$UpcomingVisitsEvent event,
    Emitter<UpcomingVisitsState> emit,
  ) async {
    emit(state.copyWith(selected: event.selected));
  }
}
