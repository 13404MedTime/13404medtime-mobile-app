part of 'upcoming_visits_bloc.dart';

sealed class UpcomingVisitsEvent {
  const UpcomingVisitsEvent();
}

final class GetDoctorRequests$UpcomingVisitsEvent extends UpcomingVisitsEvent {
  const GetDoctorRequests$UpcomingVisitsEvent();
}

final class ChangeSelected$UpcomingVisitsEvent extends UpcomingVisitsEvent {
  const ChangeSelected$UpcomingVisitsEvent(this.selected);

  final Set<int> selected;
}
