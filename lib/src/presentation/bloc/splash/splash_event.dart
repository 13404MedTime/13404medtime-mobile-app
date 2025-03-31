part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class InitialSplashEvent extends SplashEvent {
  const InitialSplashEvent();

  @override
  List<Object> get props => [];
}

class CheckForReleaseEvent extends SplashEvent {
  const CheckForReleaseEvent();

  @override
  List<Object> get props => [];
}
