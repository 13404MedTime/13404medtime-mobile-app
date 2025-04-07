part of 'specialists_bloc.dart';

@freezed
class SpecialistsState with _$SpecialistsState {
  const factory SpecialistsState({
    @Default([]) List<DoctorIdData> doctors,
    @Default(false) bool isLoading,
  }) = _SpecialistsState;
}
