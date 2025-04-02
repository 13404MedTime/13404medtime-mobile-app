part of 'show_all_my_visits_bloc.dart';

@freezed
class ShowAllMyVisitsState with _$ShowAllMyVisitsState {
  const factory ShowAllMyVisitsState({
    @Default([]) List<MyVisitModel> doctors,
    @Default(ShowAllMyVisitsStatus.initial) ShowAllMyVisitsStatus status,
  }) = _ShowAllMyVisitsState;
}
