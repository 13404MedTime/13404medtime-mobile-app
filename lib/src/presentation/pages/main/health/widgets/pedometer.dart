import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';

class PedometerWidget extends StatelessWidget {
  const PedometerWidget({
    required this.onTap,
    this.steps = 0,
    this.hour = 0,
    this.minutes = 0,
    this.distance = 0,
    this.date = '',
    super.key,
  });

  final void Function()? onTap;
  final num steps;
  final num hour;
  final num minutes;
  final num distance;
  final String date;

  @override
  Widget build(BuildContext context) => Ink(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.onSecondary,
          borderRadius: AppUtils.kBorderRadius8,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: AppUtils.kBorderRadius8,
          child: Padding(
            padding: AppUtils.kPaddingAll12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 16,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.directions_walk_outlined,
                        size: 16,
                      ),
                      AppUtils.kBoxWidth6,
                      Text(
                        context.translate('pedometer'),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1,
                        ),
                      ),
                      AppUtils.kSpacer,
                      const Icon(
                        AppIcons.rightArrow,
                        size: 12,
                      ),
                    ],
                  ),
                ),
                AppUtils.kBoxHeight16,
                Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: context.theme.colorScheme.error,
                          child: const Center(
                            child: Icon(
                              Icons.directions_walk,
                              size: 15,
                            ),
                          ),
                        ),
                        AppUtils.kGap8,
                        Expanded(
                          child: Text(
                            '$steps',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: context.theme.colorScheme.onBackground,
                            ),
                          ),
                        ),
                        AppUtils.kGap4,
                        Expanded(
                          child: Text(
                            context.translate('steps'),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: context.theme.colorScheme.error,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppUtils.kGap8,
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: context.theme.colorScheme.primaryContainer,
                          child: const Center(
                            child: Icon(
                              Icons.access_time_outlined,
                              size: 15,
                            ),
                          ),
                        ),
                        AppUtils.kGap8,
                        Expanded(
                          child: RichText(
                            maxLines: 1,
                            text: TextSpan(
                              text: '',
                              children: [
                                TextSpan(
                                  text: '${hour.toInt()} ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: context.theme.colorScheme.onBackground,
                                  ),
                                ),
                                TextSpan(
                                  text: context.translate('hour'),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: context.theme.colorScheme.onSurface,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: context.theme.colorScheme.onSurface,
                                  ),
                                ),
                                TextSpan(
                                  text: '${minutes.toInt()} ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: context.theme.colorScheme.onBackground,
                                  ),
                                ),
                                TextSpan(
                                  text: context.translate('min'),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: context.theme.colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppUtils.kGap4,
                        Expanded(
                          child: Text(
                            context.translate('time'),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: context.theme.colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppUtils.kGap8,
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: context.theme.colorScheme.secondary,
                          child: const Center(
                            child: Icon(
                              Icons.timeline,
                              size: 15,
                            ),
                          ),
                        ),
                        AppUtils.kGap8,
                        Expanded(
                          child: RichText(
                            maxLines: 1,
                            text: TextSpan(
                              text: '',
                              children: [
                                TextSpan(
                                  text: '${distance == 0 ? 0 : distance.moneyFormat} ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: context.theme.colorScheme.onBackground,
                                  ),
                                ),
                                TextSpan(
                                  text: context.translate('km'),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: context.theme.colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppUtils.kGap4,
                        Expanded(
                          child: Text(
                            context.translate('passed'),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: context.theme.colorScheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                if (date.isNotEmpty) ...[
                  AppUtils.kBoxHeight16,
                  Text(
                    date.fromApiDateTimeForHealth,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
}
