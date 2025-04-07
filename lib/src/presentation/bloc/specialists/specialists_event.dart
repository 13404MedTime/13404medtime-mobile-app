part of 'specialists_bloc.dart';

@freezed
class SpecialistsEvent with _$SpecialistsEvent {
  const factory SpecialistsEvent.searchDoctors({
    @Default('') String searchText,
    @Default('') String categoryGuid,
  }) = SearchDoctorsEvent;
}
