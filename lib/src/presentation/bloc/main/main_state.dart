part of '../main/main_bloc.dart';

class MainState extends Equatable {
  const MainState({
    required this.bottomMenu,
    this.appStarted = true,
  });

  MainState copyWith({
    final BottomMenu? bottomMenu,
    final bool appStarted = true,
  }) =>
      MainState(
        bottomMenu: bottomMenu ?? this.bottomMenu,
        appStarted: appStarted,
      );

  final BottomMenu bottomMenu;
  final bool appStarted;

  @override
  List<Object?> get props => [bottomMenu, appStarted];
}
