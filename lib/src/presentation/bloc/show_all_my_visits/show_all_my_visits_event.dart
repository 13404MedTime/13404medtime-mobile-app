part of 'show_all_my_visits_bloc.dart';

@freezed
class ShowAllMyVisitsEvent with _$ShowAllMyVisitsEvent {
  const factory ShowAllMyVisitsEvent.searchDoctor({
    required String searchText,
  }) = SearchDoctorEvent;
}
