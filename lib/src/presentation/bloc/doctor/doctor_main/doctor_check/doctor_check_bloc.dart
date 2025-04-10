import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/doctor/doctor_main/doctor_check/doctor_appointment_response.dart';
import '../../../../../domain/repositories/doctor/doctor_main/doctor_home/doctor_home_repository.dart';

part 'doctor_check_event.dart';

part 'doctor_check_state.dart';

class DoctorCheckBloc extends Bloc<DoctorCheckEvent, DoctorCheckState> {
  DoctorCheckBloc(this.doctorHomeRepository) : super(const DoctorCheckState()) {
    on<DoctorCheckEvent>(
      (event, emit) => switch (event) {
        GetDoctorAppointments$DoctorCheckEvent _ => _getDoctorAppointments(event, emit),
      },
    );
  }

  final DoctorHomeRepository doctorHomeRepository;

  Future<void> _getDoctorAppointments(
    GetDoctorAppointments$DoctorCheckEvent event,
    Emitter<DoctorCheckState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final result = await doctorHomeRepository.getAppointments(
        request: {
          'data': {
            'offset': null,
            'order': {},
            'view_fields': [],
            'search': '',
            'limit': 10000,
            'undefined': '',
          }
        },
      );
      final Map<String, List<Appointment>> users = {};
      for (final i in result.right.data.data.response) {
        if (users[i.clientsId] == null) {
          users[i.clientsId] = [i];
        } else {
          users[i.clientsId] = [...users[i.clientsId]!, i];
        }
      }
      emit(state.copyWith(
        isLoading: false,
        appointments: result.right.data.data.response,
        users: users,
      ));
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }
}
