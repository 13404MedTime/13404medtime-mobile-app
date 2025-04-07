import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'doctor_main_event.dart';
part 'doctor_main_state.dart';

class DoctorMainBloc extends Bloc<DoctorMainEvent, DoctorMainState> {
  DoctorMainBloc() : super(const DoctorMainState()) {
    on<DoctorMainEvent>(
      (event, emit) => switch (event) {
        ChangePage$DoctorMainEvent _ => _changePage(event, emit),
      },
    );
  }

  void _changePage(ChangePage$DoctorMainEvent event, Emitter<DoctorMainState> emit) {
    emit(state.copyWith(pageIndex: event.index));
  }
}
