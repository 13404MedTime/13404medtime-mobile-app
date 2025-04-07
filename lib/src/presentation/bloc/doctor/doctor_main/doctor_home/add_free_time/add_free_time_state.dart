part of 'add_free_time_bloc.dart';

class AddFreeTimeState extends Equatable {
  const AddFreeTimeState({
    this.isLoading = false,
  });

  final bool isLoading;

  @override
  List<Object?> get props => [isLoading];

  AddFreeTimeState copyWith({
    bool? isLoading,
  }) =>
      AddFreeTimeState(
        isLoading: isLoading ?? this.isLoading,
      );
}
