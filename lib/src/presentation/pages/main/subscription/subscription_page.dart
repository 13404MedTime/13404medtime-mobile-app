import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extension.dart';
import '../../../bloc/subscription/subscription_bloc.dart';
import '../../../components/empty_case/empty_case_widget.dart';
import '../../../components/loading_widgets/custom_circular_progress_indicator.dart';
import 'widget/subscription_item.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  void initState() {
    context.read<SubscriptionBloc>().add(const GetSubscriptionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 0,
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 35),
            child: Padding(
              padding: AppUtils.kPaddingAll16,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  context.translate('buy_subscription'),
                  style: context.textStyle.appBarTitle,
                ),
              ),
            ),
          ),
        ),
        body: BlocBuilder<SubscriptionBloc, SubscriptionState>(
          builder: (context, state) => state.isLoading
              ? const Center(child: CustomCircularProgressIndicator())
              : state.subscriptions.isEmpty
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
                          sliver: SliverList.separated(
                            itemCount: state.subscriptions.length,
                            itemBuilder: (_, index) => SubscriptionItemWidget(
                              subscription: state.subscriptions[index],
                            ),
                            separatorBuilder: (_, index) => const Padding(
                              padding: AppUtils.kPaddingBottom16,
                            ),
                          ),
                        ),
                      ],
                    ),
        ),
      );
}
