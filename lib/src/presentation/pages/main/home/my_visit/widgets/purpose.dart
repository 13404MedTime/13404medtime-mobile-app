import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';

class PurposeWidget extends StatelessWidget {
  const PurposeWidget({
    required this.onTap,
    this.numberAppointments = 0,
    this.numberMedicationsTaken = 0,
    super.key,
  });

  final void Function() onTap;
  final int numberAppointments;
  final int numberMedicationsTaken;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Card(
          elevation: 0,
          child: InkWell(
            onTap: onTap,
            borderRadius: AppUtils.kBorderRadius8,
            child: Padding(
              padding: AppUtils.kPaddingHor16Ver12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 16,
                    child: Row(
                      children: [
                        const Icon(
                          AppIcons.stethoscoper,
                          size: 16,
                        ),
                        AppUtils.kBoxWidth6,
                        Text(
                          context.translate('appointment'),
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
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.translate('number_of_appointments'),
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: context.theme.colorScheme.error,
                              ),
                            ),
                            RichText(
                              maxLines: 1,
                              text: TextSpan(
                                text: '',
                                children: [
                                  TextSpan(
                                    text: '$numberAppointments ',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: context.theme.colorScheme.onBackground,
                                    ),
                                  ),
                                  TextSpan(
                                    text: context.translate('pc'),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: context.theme.colorScheme.onSurface,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        width: 28,
                        color: context.color.onSurface20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.translate('number_of_medications'),
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: context.theme.colorScheme.primaryContainer,
                              ),
                            ),
                            RichText(
                              maxLines: 1,
                              text: TextSpan(
                                text: '',
                                children: [
                                  TextSpan(
                                    text: '$numberMedicationsTaken ',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: context.theme.colorScheme.onBackground,
                                    ),
                                  ),
                                  TextSpan(
                                    text: context.translate('pc'),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: context.theme.colorScheme.onSurface,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
