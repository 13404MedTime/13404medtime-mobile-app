part of 'consultation_bloc.dart';

@freezed
class ConsultationState with _$ConsultationState {
  const factory ConsultationState({
    @Default([]) List<DoctorTypeModel> doctorsTypes,
  }) = _ConsultationStatel;
}
