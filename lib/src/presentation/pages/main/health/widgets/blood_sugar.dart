import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';

class BloodSugarWidget extends StatelessWidget {
  const BloodSugarWidget({
    required this.onTap,
    this.bloodSugar = 0,
    this.date = '',
    super.key,
  });

  final void Function() onTap;
  final num bloodSugar;
  final String date;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 0,
        margin: AppUtils.kPadding0,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppUtils.kBorderRadius8,
          child: SizedBox(
            height: 125,
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
                              Icons.water_drop,
                              size: 16,
                            ),
                            AppUtils.kBoxWidth6,
                            Text(
                              context.translate('blood_sugar'),
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
                      Text(
                        context.translate('blood_sugar_level'),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: context.theme.colorScheme.error,
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: context.theme.colorScheme.error,
                            child: const Center(
                              child: Icon(
                                Icons.speed_sharp,
                                size: 15,
                              ),
                            ),
                          ),
                          AppUtils.kGap8,
                          Expanded(
                            child: Text(
                              bloodSugar.moneyFormat,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: context.theme.colorScheme.onBackground,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  right: 12,
                  bottom: 0,
                  child: Image(
                    image: AssetImage('assets/png/blood_sugar_img.png'),
                    height: 81,
                    width: 62,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
