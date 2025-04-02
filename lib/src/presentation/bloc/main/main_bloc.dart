import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_bloc.freezed.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState(bottomMenu: BottomMenu.search, appStarted: false)) {
    on<MainEventChanged>(_onChangeMenu);
  }

  void _onChangeMenu(MainEventChanged event, Emitter<MainState> emit) {
    emit(state.copyWith(bottomMenu: event.menu));
  }
}

enum BottomMenu { search, orders, favorites, treatments, profile }
