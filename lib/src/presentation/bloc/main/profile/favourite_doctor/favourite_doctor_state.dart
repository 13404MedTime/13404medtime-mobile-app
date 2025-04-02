part of 'favourite_doctor_bloc.dart';

@freezed
class FavouriteDoctorState with _$FavouriteDoctorState {
  const factory FavouriteDoctorState({
    @Default(false) bool isLoading,
    @Default([]) List<DoctorIdData> favouriteDoctorList,
  }) = _FavouriteDoctorState;
}
