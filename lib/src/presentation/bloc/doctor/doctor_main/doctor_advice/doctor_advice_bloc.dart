import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_advice/client_medicine_response.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_advice/clients_response.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_advice/get_all_medicine_response.dart';
import '../../../../../data/models/doctor/doctor_main/doctor_advice/unit_of_medicine.dart';
import '../../../../../domain/repositories/doctor/doctor_main/doctor_advice/doctor_advice_repository.dart';
import '../../../../pages/doctor/doctor_main/doctor_advice/doctor_advice_page.dart';

part 'doctor_advice_event.dart';
part 'doctor_advice_state.dart';

class DoctorAdviceBloc extends Bloc<DoctorAdviceEvent, DoctorAdviceState> {
  DoctorAdviceBloc(this.doctorAdviceRepository) : super(const DoctorAdviceState()) {
    on<DoctorAdviceEvent>(
      (event, emit) => switch (event) {
        GetClients$DoctorAdviceEvent _ => _getClients(event, emit),
        GetMedicine$DoctorAdviceEvent _ => _getMedicine(event, emit),
        SelectClient$DoctorAdviceEvent _ => _selectClient(event, emit),
        SelectMedicine$DoctorAdviceEvent _ => _selectMedicine(event, emit),
        SendAdvice$DoctorAdviceEvent _ => _sendAdvice(event, emit),
        SelectPage$DoctorAdviceEvent _ => _selectPage(event, emit),
        AddMedicine$DoctorAdviceEvent _ => _addMedicine(event, emit),
        RemoveMedicine$DoctorAdviceEvent _ => _removeMedicine(event, emit),
        SendFullAdvice$DoctorAdviceEvent _ => _sendFullAdvice(event, emit),
        GetAllMedicines$DoctorAdviceEvent _ => _getAllMedicine(event, emit),
      },
    );
  }

  final DoctorAdviceRepository doctorAdviceRepository;

  Future<void> _getClients(
    GetClients$DoctorAdviceEvent event,
    Emitter<DoctorAdviceState> emit,
  ) async {
    try {
      final response = await doctorAdviceRepository.getClients(
        request: {
          'data': {
            'phone_number': event.phone,
            'limit': 6,
            'view_fields': ['phone_number']
          }
        },
      );
      if (response.isRight) {
        emit(state.copyWith(clients: response.right.data.data.response));
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _getMedicine(
    GetMedicine$DoctorAdviceEvent event,
    Emitter<DoctorAdviceState> emit,
  ) async {
    try {
      final response = await doctorAdviceRepository.getMedicine(
        request: {
          'data': {
            'search': event.name,
            'limit': 10,
            'view_fields': ['illness_name']
          }
        },
      );
      final units = await doctorAdviceRepository.getUnitOfMedicine(
        request: {
          'data': {
            'data': {
              'limit': 20,
              'offset': 0,
              'search': '',
            }
          }
        },
      );
      if (response.isRight) {
        emit(state.copyWith(
            medicines: response.right.data.data.response,
            units: units.right.response.take(4).toList(),
            selectedMedicine: response.right.data.data.response.first));
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void _selectClient(
    SelectClient$DoctorAdviceEvent event,
    Emitter<DoctorAdviceState> emit,
  ) {
    emit(state.copyWith(selectedClient: event.client));
  }

  void _selectMedicine(
    SelectMedicine$DoctorAdviceEvent event,
    Emitter<DoctorAdviceState> emit,
  ) {
    emit(state.copyWith(selectedMedicine: event.medicine));
  }

  Future<void> _sendAdvice(
    SendAdvice$DoctorAdviceEvent event,
    Emitter<DoctorAdviceState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final result = await doctorAdviceRepository.sendAdvice(
        request: {
          'data': {
            'cleints_id': state.selectedClient?.guid,
            'client_name': state.selectedClient?.clientName,
            'client_surname': state.selectedClient?.clientLastname,
            'consultation_type': 'бесплатная консультация',
            'doctor_id': localSource.userId,
            'ill_id': state.selectedMedicine?.guid,
            'ill_name': '',
            'invite': false,
            'multi': []
          }
        },
      );
      emit(state.copyWith(isLoading: false, adviceId: result.right.guid));
    } on Exception catch (e) {
      debugPrint(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _selectPage(
    SelectPage$DoctorAdviceEvent event,
    Emitter<DoctorAdviceState> emit,
  ) {
    emit(state.copyWith(selectedPage: event.page, medicinesInfo: event.page == 0 ? [] : state.medicinesInfo));
  }

  void _addMedicine(
    AddMedicine$DoctorAdviceEvent event,
    Emitter<DoctorAdviceState> emit,
  ) {
    emit(state.copyWith(medicinesInfo: [...state.medicinesInfo, event.medicine]));
  }

  void _removeMedicine(
    RemoveMedicine$DoctorAdviceEvent event,
    Emitter<DoctorAdviceState> emit,
  ) {
    emit(state.copyWith(
      medicinesInfo: state.medicinesInfo.where((e) => e.hashCode != event.id).toList(),
    ));
  }

  Future<void> _sendFullAdvice(
    SendFullAdvice$DoctorAdviceEvent event,
    Emitter<DoctorAdviceState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      for (final i in state.medicinesInfo) {
        await doctorAdviceRepository.sendFullAdvice(
          request: {
            'data': {
              'naznachenie_id': state.adviceId,
              'preparati_id': i.name?.guid,
              'medicine_name': '',
              'frequency': [i.event],
              'week_days': i.days,
              'unit_of_measure_id': i.type,
              'description': i.description,
              'dosage': i.doze,
              'current_amount': i.reserve,
              'invite': false,
              'multi': [],
              'is_from_patient': false,
              'cleints_id': state.selectedClient?.guid,
              'json_body': i.times
            }
          },
        );
      }
      emit(state.copyWith(isLoading: false));
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    emit(state.copyWith(isLoading: false, selectedPage: 0, medicinesInfo: []));
  }

  Future<void> _getAllMedicine(
    GetAllMedicines$DoctorAdviceEvent event,
    Emitter<DoctorAdviceState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final result = await doctorAdviceRepository.getAllMedicine(
        request: {
          'data': {
            'limit': 50,
            'offset': null,
            'view_fields': ['brand_name'],
            'search': event.name
          }
        },
      );
      emit(state.copyWith(isLoading: false, medicinesName: result.right.data.data.response));
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }
}
