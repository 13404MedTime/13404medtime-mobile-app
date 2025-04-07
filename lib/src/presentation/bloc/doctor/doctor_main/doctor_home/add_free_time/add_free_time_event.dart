part of 'add_free_time_bloc.dart';

sealed class AddFreeTimeEvent {
  const AddFreeTimeEvent();
}

final class AddTime$AddFreeTimeEvent extends AddFreeTimeEvent {
  const AddTime$AddFreeTimeEvent({
    required this.context,
    required this.startTime,
    required this.endTime,
    required this.date,
  });

  final BuildContext context;
  final DateTime date;
  final String startTime;
  final String endTime;
}

final class UpdateTime$AddFreeTimeEvent extends AddFreeTimeEvent {
  const UpdateTime$AddFreeTimeEvent({
    required this.context,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.id,
  });

  final BuildContext context;
  final DateTime date;
  final String startTime;
  final String endTime;
  final String id;
}
