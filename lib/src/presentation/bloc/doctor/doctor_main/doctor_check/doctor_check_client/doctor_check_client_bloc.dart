import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../data/models/doctor/doctor_main/doctor_check/patient_medication_response.dart';
import '../../../../../../domain/repositories/doctor/doctor_main/doctor_advice/doctor_advice_repository.dart';

part 'doctor_check_client_event.dart';
part 'doctor_check_client_state.dart';

class DoctorCheckClientBloc extends Bloc<DoctorCheckClientEvent, DoctorCheckClientState> {
  DoctorCheckClientBloc(this.repository) : super(const DoctorCheckClientState()) {
    on<DoctorCheckClientEvent>(
      (event, emit) => switch (event) {
        GetMedicineInfo$DoctorCheckClientEvent _ => _getMedicineInfo(event, emit),
      },
    );
  }

  final DoctorAdviceRepository repository;

  Future<void> _getMedicineInfo(
    GetMedicineInfo$DoctorCheckClientEvent event,
    Emitter<DoctorCheckClientState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final result = await repository.getPatientMedication(
        request: {
          'data': {
            'offset': 0,
            'order': {},
            'view_fields': [],
            'search': '',
            'limit': 1000,
            'time_take': {'\$gte': '${event.startDate}Z', '\$lt': '${event.endDate}Z'},
            'cleints_id': [event.guid],
            'undefined': ''
          }
        },
      );
      emit(state.copyWith(
        medicines: result.right.data.data.response,
        user: result.right.data.data.response.isEmpty ? null : result.right.data.data.response.first.clientsIdData,
      ));
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }
}
