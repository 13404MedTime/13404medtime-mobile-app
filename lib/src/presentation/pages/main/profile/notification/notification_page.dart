// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/base_functions.dart';
import '../../../../../data/models/home/notification/notifications_response.dart';
import '../../../../bloc/main/home/home_bloc.dart';
import '../../../../bloc/notification/notification_bloc.dart';
import '../../../../components/loading_widgets/custom_circular_progress_indicator.dart';
import '../../home/widgets/empty_item.dart';
import 'widgets/notification_item.dart';
import 'widgets/notification_shimmer_item.dart';

part 'mixin/notification_mixin.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({
    super.key,
    required this.bloc,
  });

  final HomeBloc bloc;

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> with NotificationMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            context.translate('alerts'),
            style: context.theme.appBarTheme.titleTextStyle,
          ),
        ),
        body: SafeArea(
          child: BlocConsumer<NotificationBloc, NotificationState>(
            listener: (_, state) {
              if (state.notificationStatus == NotificationStatus.pagination &&
                  state.notificationStatus != NotificationStatus.paginationEnd) {
                Future.delayed(const Duration(milliseconds: 1), () {
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn,
                  );
                });
              }
            },
            builder: (_, state) => CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController,
              slivers: [
                /// [when loading]
                if (state.notifications.isEmpty && state.notificationStatus == NotificationStatus.loading) ...[
                  SliverPadding(
                    padding: AppUtils.kPaddingAll16,
                    sliver: SliverFillRemaining(
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => const NotificationShimmerItem(),
                        separatorBuilder: (context, index) => AppUtils.kBoxHeight8,
                        itemCount: 12,
                      ),
                    ),
                  )

                  /// [when empty]
                ] else if (state.notifications.isEmpty && state.notificationStatus != NotificationStatus.loading) ...[
                  SliverFillRemaining(
                    child: EmptyItem(
                      padding: AppUtils.kPaddingAll16,
                      title: '',
                      desc: context.translate('no_alerts'),
                      iconPath: 'assets/png/notification_empty.png',
                      backGroundColor: context.theme.colorScheme.surface,
                    ),
                  ),

                  /// [when data isNotEmpty]
                ] else ...[
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final NotificationData data = state.notifications[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: NotificationItem(
                              isRead: data.isRead ?? true,
                              desc: getLocalText(
                                '${data.bodyUz ?? ''}${data.preparatiIdData != null ? data.preparatiIdData?.drugs ?? '' : ''}',
                                '${data.body ?? ''}${data.preparatiIdData != null ? data.preparatiIdData?.drugs ?? '' : ''}',
                              ),
                              onTap: () {},
                              time: (data.timeTake ?? '').dateTime(),
                              title: getLocalText(
                                data.titleUz ?? '',
                                data.title ?? '',
                              ),
                              isBirthData: data.isBirthData ?? false,
                            ),
                          );
                        },
                        childCount: state.notifications.length,
                      ),
                    ),
                  ),
                  if (state.notificationStatus == NotificationStatus.pagination &&
                      state.notificationStatus != NotificationStatus.paginationEnd)
                    const SliverPadding(
                      padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
                      sliver: SliverToBoxAdapter(
                        child: CustomCircularProgressIndicator(),
                      ),
                    ),
                  // if (state.notificationStatus ==
                  //     NotificationStatus.paginationEnd)
                  //   SliverPadding(
                  //     padding: const EdgeInsets.only(
                  //         right: 16, left: 16, bottom: 16),
                  //     sliver: SliverToBoxAdapter(
                  //       child: Center(
                  //           child:
                  //               Text(context.translate('no_more_alerts'))),
                  //     ),
                  //   )
                ]
              ],
            ),
          ),
        ),
      );
}
