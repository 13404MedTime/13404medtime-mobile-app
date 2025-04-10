import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../config/router/routes_arguments.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../bloc/main/main_bloc.dart';
import '../../../../bloc/payment_methods/payment_methods_bloc.dart';
import '../../../../components/empty_case/empty_case_widget.dart';
import '../../../../components/loading_widgets/custom_circular_progress_indicator.dart';
import '../../../../components/snack/snack.dart';
import 'widgets/paid_successful_bottom_sheet.dart';
import 'widgets/payment_method_item.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({
    super.key,
    required this.subscription,
  });

  final PaymentMethodsPageArgument? subscription;

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    context.read<PaymentMethodsBloc>().add(
          const GetPaymentMethodsEvent(),
        );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (context.mounted) {
      if (state == AppLifecycleState.resumed) {
        context.read<PaymentMethodsBloc>().add(const CheckPaymentStatusEvent());
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<PaymentMethodsBloc, PaymentMethodsState>(
        listener: (context, state) async {
          if (state.hasError) {
            Snack.showSnackBar(
              context,
              context.translate('try_again'),
              hasError: true,
            );
            context.read<PaymentMethodsBloc>().add(const ChangeErrorStatusEvent(hasError: false));
          }
          if (state.isPaymentSuccess) {
            await showModalBottomSheet<void>(
              barrierColor: context.color.black.withOpacity(0.45),
              isDismissible: false,
              enableDrag: false,
              context: context,
              builder: (_) => PaidSuccessfulBottomSheet(
                subscription: PaymentMethodsPageArgument(
                  subscriptionId: '',
                  subscriptionName: state.name,
                  subscriptionPrice: state.price,
                  afterPriceText: state.afterPriceText,
                  features: state.features,
                  consultationCounts: state.consultationDays,
                ),
              ),
            );
          }
        },
        builder: (context, state) => Scaffold(
            appBar: AppBar(
              centerTitle: false,
              titleSpacing: 0,
              leading: IconButton(
                splashColor: Colors.transparent,
                onPressed: () {
                  if (state.isPaymentSuccess) {
                    context.read<MainBloc>().add(MainEventChanged(BottomMenu.values[0]));
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.main,
                      (route) => false,
                    );
                  } else {
                    Navigator.pop(context);
                  }
                },
                icon: Platform.isIOS ? const Icon(Icons.arrow_back_ios) : const Icon(Icons.arrow_back),
              ),
              bottom: PreferredSize(
                preferredSize: const Size(double.infinity, 34),
                child: Padding(
                  padding: AppUtils.kPaddingAll16,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      context.translate('payment_method'),
                      style: context.textStyle.appBarTitle,
                    ),
                  ),
                ),
              ),
            ),
            body: state.isLoading
                ? const Center(child: CustomCircularProgressIndicator())
                : state.paymentTypes.isEmpty
                    ? EmptyCasePage(
                        title: '',
                        desc: context.translate('nothing_found'),
                        iconPath: 'assets/png/visit_empty.png',
                      )
                    : CustomScrollView(
                        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                        slivers: [
                          SliverPadding(
                            padding: AppUtils.kPaddingAll16,
                            sliver: SliverToBoxAdapter(
                              child: Text(
                                context.translate('you_may_pay_payment'),
                                style: context.textStyle.regularCaption1.copyWith(
                                  color: context.color.midGrey,
                                ),
                                maxLines: 4,
                              ),
                            ),
                          ),
                          SliverPadding(
                            padding: AppUtils.kPaddingAll16,
                            sliver: SliverList.separated(
                              itemCount: state.paymentTypes.length,
                              itemBuilder: (_, index) => PaymentMethodItem(
                                onTap: () {
                                  context.read<PaymentMethodsBloc>().add(
                                        PayForSubscriptionEvent(
                                          subscriptionPrice: widget.subscription?.subscriptionPrice ?? 0,
                                        ),
                                      );
                                },
                                paymentItem: state.paymentTypes[index],
                              ),
                              separatorBuilder: (_, index) => const Padding(
                                padding: AppUtils.kPaddingBottom16,
                              ),
                            ),
                          ),
                        ],
                      )),
      );
}
