import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/router/app_routes.dart';
import '../../../../../../domain/repositories/doctor/doctor_main/doctor_home/add_free_time/add_free_time_repository.dart';

part 'add_free_time_event.dart';
part 'add_free_time_state.dart';

class AddFreeTimeBloc extends Bloc<AddFreeTimeEvent, AddFreeTimeState> {
  AddFreeTimeBloc(this.addFreeTimeRepository) : super(const AddFreeTimeState()) {
    on<AddFreeTimeEvent>(
      (event, emit) => switch (event) {
        AddTime$AddFreeTimeEvent _ => _addTime(event, emit),
        UpdateTime$AddFreeTimeEvent _ => _updateTime(event, emit),
      },
    );
  }

  final AddFreeTimeRepository addFreeTimeRepository;

  Future<void> _addTime(
    AddTime$AddFreeTimeEvent event,
    Emitter<AddFreeTimeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final result = await addFreeTimeRepository.addFreeTime(
        request: {
          'data': {
            'doctor_id': localSource.userId,
            'date': '${event.date.add(const Duration(days: 1)).toIso8601String()}Z',
            'from_time': event.startTime,
            'to_time': event.endTime,
            'is_booked': false,
            'finished': false
          }
        },
      );
      if (result.isRight) {
        Navigator.pop(event.context);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _updateTime(
    UpdateTime$AddFreeTimeEvent event,
    Emitter<AddFreeTimeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await addFreeTimeRepository.updateFreeTime(request: {
      'data': {
        'date': event.date.toIso8601String(),
        'from_time': event.startTime,
        'guid': event.id,
        'is_booked': false,
        'to_time': event.endTime,
        'status': ['pending'],
      }
    });
    if (result.isRight && event.context.mounted) {
      Navigator.pop(event.context);
    }
    emit(state.copyWith(isLoading: false));
  }
}
