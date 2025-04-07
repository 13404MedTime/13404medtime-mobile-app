import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';

class ArterialPressureWidget extends StatelessWidget {
  const ArterialPressureWidget({
    super.key,
    required this.onTap,
    this.pressure = '0',
    this.pulse = 0,
    this.date = '',
    this.isLoading = false,
  });

  final void Function() onTap;
  final String pressure;
  final num pulse;
  final String date;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 0,
        margin: AppUtils.kPadding0,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppUtils.kBorderRadius8,
          child: SizedBox(
            height: isLoading ? 94 : 125,
            child: Stack(
              children: [
                Padding(
                  padding: AppUtils.kPaddingAll12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 16,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.monitor_heart_outlined,
                              size: 16,
                            ),
                            AppUtils.kBoxWidth6,
                            Text(
                              context.translate('blood_pressure'),
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
                                    Icons.speed_rounded,
                                    size: 15,
                                  ),
                                ),
                              ),
                              AppUtils.kGap8,
                              Expanded(
                                child: Text(
                                  pressure,
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
                                  context.translate('pressure'),
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
                                    Icons.monitor_heart,
                                    size: 15,
                                  ),
                                ),
                              ),
                              AppUtils.kGap8,
                              Expanded(
                                child: Text(
                                  pulse.moneyFormat,
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
                                  context.translate('pulse'),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: context.theme.colorScheme.primaryContainer,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (!isLoading && date.isNotEmpty) ...[
                        // AppUtils.kBoxHeight16,
                        AppUtils.kSpacer,
                        Text(
                          date.fromApiDateTimeForHealth,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: context.theme.colorScheme.onSurface,
                            height: 1,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                      child: ColoredBox(
                        color: Colors.red.withBlue(50),
                        child: const SizedBox(
                          height: 80,
                          width: 16,
                        ),
                      ),
                    ),
                    AppUtils.kBoxWidth12,
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                      child: ColoredBox(
                        color: Colors.green.withBlue(50),
                        child: const SizedBox(
                          height: 50,
                          width: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: double.infinity,
                      width: 12,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
