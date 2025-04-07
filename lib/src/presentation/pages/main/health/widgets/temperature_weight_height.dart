import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';

class TemperatureWeightHeightWidget extends StatelessWidget {
  const TemperatureWeightHeightWidget({
    required this.onTap,
    this.date = '',
    this.bodyTemperature = 0,
    this.weight = 0,
    this.height = 0,
    this.imt = 0,
    super.key,
  });

  final void Function() onTap;
  final String date;
  final num bodyTemperature;
  final num weight;
  final num height;
  final num imt;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 0,
        margin: AppUtils.kPadding0,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppUtils.kBorderRadius8,
          child: SizedBox(
            height: 190,
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
                              Icons.thermostat,
                              size: 16,
                            ),
                            AppUtils.kBoxWidth6,
                            Text(
                              context.translate('temp_weight_height'),
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
                      AppUtils.kSpacer,
                      Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: context.theme.colorScheme.error,
                                child: const Center(
                                  child: Icon(
                                    Icons.thermostat,
                                    size: 15,
                                  ),
                                ),
                              ),
                              AppUtils.kGap8,
                              Expanded(
                                child: Text(
                                  bodyTemperature.toString(),
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
                                  context.translate('temperature'),
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
                                    Icons.monitor_weight_outlined,
                                    size: 15,
                                  ),
                                ),
                              ),
                              AppUtils.kGap8,
                              Expanded(
                                child: Text(
                                  weight.toString(),
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
                                  context.translate('weight'),
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
                                backgroundColor: context.theme.colorScheme.secondaryContainer,
                                child: const Center(
                                  child: Icon(
                                    Icons.height,
                                    size: 15,
                                  ),
                                ),
                              ),
                              AppUtils.kGap8,
                              Expanded(
                                child: Text(
                                  height.toString(),
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
                                  context.translate('height'),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: context.theme.colorScheme.secondaryContainer,
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
                                backgroundColor: context.theme.colorScheme.primary,
                                child: const Center(
                                  child: Icon(
                                    Icons.line_weight,
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
                                        text: imt.formatNum,
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
                                  context.translate('bmi'),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: context.theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        date.fromApiDateTimeNotZ,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: context.theme.colorScheme.onSurface,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  right: 12,
                  bottom: -4,
                  child: Image(
                    image: AssetImage('assets/png/degree_img.png'),
                    height: 100,
                    width: 60,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
