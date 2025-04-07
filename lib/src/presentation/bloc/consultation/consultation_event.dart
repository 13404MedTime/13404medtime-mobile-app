part of 'consultation_bloc.dart';

@freezed
class ConsultationEvent with _$ConsultationEvent {
  const factory ConsultationEvent.searchDoctorsTypes({
    @Default('') String searchText,
  }) = SearchDoctorsTypesEvent;
}
