import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/home/subscription_types/subscription_types_response.dart';
import '../../../data/source/local_source.dart';
import '../../../domain/repositories/home/home_repository.dart';
import '../../../injector_container.dart';

part 'subscription_bloc.freezed.dart';
part 'subscription_event.dart';
part 'subscription_state.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  SubscriptionBloc(this.repository) : super(const SubscriptionState()) {
    on<GetSubscriptionEvent>(_getSubscriptionTypes);
  }

  final HomeRepository repository;

  Future<void> _getSubscriptionTypes(
    GetSubscriptionEvent event,
    Emitter<SubscriptionState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await repository.getSubscriptionTypes(
      request: {
        'data': {
          'object_data': {
            'cleints_id': sl<LocalSource>().userId,
            'lang': sl<LocalSource>().locale,
          }
        }
      },
    );
    response.fold(
      (error) => emit(state.copyWith(isLoading: false)),
      (r) {
        emit(
          state.copyWith(
            isLoading: false,
            subscriptions: r.data?.data?.subscriptions ?? [],
          ),
        );
      },
    );
  }
}
