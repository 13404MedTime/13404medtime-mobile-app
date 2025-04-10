import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/router/app_routes.dart';
import '../../../data/models/home/payment_types/payment_types_response.dart';
import '../../../domain/repositories/home/home_repository.dart';

part 'payment_methods_bloc.freezed.dart';
part 'payment_methods_event.dart';
part 'payment_methods_state.dart';

class PaymentMethodsBloc extends Bloc<PaymentMethodsEvent, PaymentMethodsState> {
  PaymentMethodsBloc(this.repository) : super(const PaymentMethodsState()) {
    on<GetPaymentMethodsEvent>(_getPaymentMethods);
    on<PayForSubscriptionEvent>(_payForSubscription);
    on<CheckPaymentStatusEvent>(_hasSubscription);
    on<ChangeErrorStatusEvent>(_changeErrorStatus);
  }

  final HomeRepository repository;

  Future<void> _getPaymentMethods(
    GetPaymentMethodsEvent event,
    Emitter<PaymentMethodsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await repository.getPaymentTypes();
    response.fold(
      (error) => emit(state.copyWith(isLoading: false)),
      (r) {
        emit(
          state.copyWith(
            isLoading: false,
            paymentTypes: r.data?.data?.response ?? [],
          ),
        );
      },
    );
  }

  Future<void> _payForSubscription(
    PayForSubscriptionEvent event,
    Emitter<PaymentMethodsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await repository.getPaymentLink(
      request: {
        'data': {
          'app_id': 'P-JV2nVIRUtgyPO5xRNeYll2mT4F5QG4bS',
          'object_data': {
            'amount': event.subscriptionPrice,
            'user_id': localSource.userId,
          }
        }
      },
    );
    await result.fold(
      (e) {
        emit(state.copyWith(isLoading: false, hasError: true));
      },
      (r) async {
        emit(state.copyWith(isLoading: false));
        final Uri url = Uri.parse(r.data?.data?.response?.first.link ?? '');
        await launchUrl(url, mode: LaunchMode.externalApplication);
      },
    );
  }

  Future<void> _hasSubscription(
    CheckPaymentStatusEvent event,
    Emitter<PaymentMethodsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await repository.getSubscriptionStatusOfUser(
      request: jsonEncode({
        'with_relations': true,
        'cleints_id': localSource.userId.isNotEmpty ? localSource.userId : null,
        'status': ['активный'],
      }),
    );
    return result.fold(
      (e) {
        emit(state.copyWith(isPaymentSuccess: false, isLoading: false));
      },
      (r) async {
        final subscriptions = r.data?.data?.response ?? [];
        if (subscriptions.isNotEmpty) {
          final subscription = subscriptions.first;

          if (localSource.subscriptionId != (subscription.subscriptionTypesId ?? '')) {
            emit(
              state.copyWith(
                // isPaymentSuccess: true,
                // isLoading: false,
                name: localSource.locale == 'uz'
                    ? subscription.subscriptionTypesIdData?.nameUz ?? ''
                    : subscription.subscriptionTypesIdData?.name ?? '',
                price: subscription.subscriptionTypesIdData?.price ?? 0,
                consultationDays: subscription.consultationCount ?? 0,
                afterPriceText: localSource.locale == 'uz'
                    ? subscription.subscriptionTypesIdData?.afterPriceTextUz ?? ''
                    : subscription.subscriptionTypesIdData?.afterPriceText ?? '',
                features: localSource.locale == 'uz'
                    ? subscription.subscriptionTypesIdData?.descriptionFeaturesUz ?? []
                    : subscription.subscriptionTypesIdData?.descriptionFeatures ?? [],
              ),
            );
            await localSource.setSubscriptionNameUz(
              subscription.subscriptionTypesIdData?.nameUz ?? '',
            );
            await localSource.setSubscriptionNameRu(
              subscription.subscriptionTypesIdData?.name ?? '',
            );
            await localSource.setSubscriptionDeadline(
              subscription.endDate ?? '',
            );
            emit(state.copyWith(isLoading: false, isPaymentSuccess: true));
          } else {
            emit(state.copyWith(isLoading: false, isPaymentSuccess: false));
          }
        } else {
          emit(state.copyWith(isLoading: false, isPaymentSuccess: false));
        }
      },
    );
  }

  void _changeErrorStatus(
    ChangeErrorStatusEvent event,
    Emitter<PaymentMethodsState> emit,
  ) =>
      emit(state.copyWith(hasError: event.hasError));
}
