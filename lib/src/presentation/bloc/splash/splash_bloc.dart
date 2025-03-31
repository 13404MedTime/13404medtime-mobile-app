import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/splash/splash_repository.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this.repository) : super(const SplashState()) {
    on<SplashEvent>(_splashHandler);
    on<CheckForReleaseEvent>(_checkForRelease);
  }

  final SplashRepository repository;

  Future<void> _splashHandler(
    SplashEvent event,
    Emitter<SplashState> emit,
  ) async {
    await Future<void>.delayed(const Duration(seconds: 2)).then(
      (value) => emit(
        const SplashState(isTimerFinished: true),
      ),
    );
  }

  Future<void> _checkForRelease(
    CheckForReleaseEvent event,
    Emitter<SplashState> emit,
  ) async {
    // if (Platform.isIOS) {
    //   final response = await repository.checkForProduction(
    //     version: packageInfo.version,
    //   );
    //   await response.fold(
    //     (e) async {
    //       await sl<LocalSource>().setIsForProduction(false);
    //     },
    //     (r) async {
    //       await sl<LocalSource>().setIsForProduction(
    //         r.data?.data?.response?.status ?? false,
    //       );
    //     },
    //   );
    // }
  }
}
