import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../config/router/app_routes.dart';
import '../../../data/models/home/get_visits/get_visits_response.dart';
import '../../../domain/repositories/home/home_repository.dart';

part 'show_all_my_visits_bloc.freezed.dart';
part 'show_all_my_visits_event.dart';
part 'show_all_my_visits_state.dart';

class ShowAllMyVisitsBloc extends Bloc<ShowAllMyVisitsEvent, ShowAllMyVisitsState> {
  ShowAllMyVisitsBloc(this.repository) : super(const ShowAllMyVisitsState()) {
    on<SearchDoctorEvent>(_searchDoctors);
  }

  final HomeRepository repository;

  Future<void> _searchDoctors(SearchDoctorEvent event, Emitter<ShowAllMyVisitsState> emit) async {
    emit(state.copyWith(status: ShowAllMyVisitsStatus.loading));
    final response = await repository.getMyVisits(
      {
        'data': {
          'cleints_id': localSource.userId,
          'doctor_name': event.searchText,
          'limit': 10,
        }
      },
    );
    response.fold(
      (error) {
        emit(state.copyWith(status: ShowAllMyVisitsStatus.error));
      },
      (r) {
        emit(state.copyWith(
          status: ShowAllMyVisitsStatus.success,
          doctors: r.myVisits ?? state.doctors,
        ));
      },
    );
  }
}

enum ShowAllMyVisitsStatus {
  initial,
  success,
  loading,
  error,
}
