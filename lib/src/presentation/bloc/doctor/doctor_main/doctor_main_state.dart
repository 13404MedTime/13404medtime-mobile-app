part of 'doctor_main_bloc.dart';

class DoctorMainState extends Equatable {
  const DoctorMainState({this.pageIndex = 0});

  final int pageIndex;

  @override
  List<Object?> get props => [pageIndex];

  DoctorMainState copyWith({int? pageIndex}) => DoctorMainState(pageIndex: pageIndex ?? this.pageIndex);
}
