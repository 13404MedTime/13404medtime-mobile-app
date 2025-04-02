part of 'favourite_doctor_bloc.dart';

@freezed
class FavouriteDoctorEvent with _$FavouriteDoctorEvent {
  const factory FavouriteDoctorEvent.getFavouriteDoctor() = GetFavouriteDoctorEvent;
}
