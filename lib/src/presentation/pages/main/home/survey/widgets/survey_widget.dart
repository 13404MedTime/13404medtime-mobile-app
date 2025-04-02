import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';

class SurveyWidget extends StatelessWidget {
  const SurveyWidget({
    super.key,
    required this.onTap,
    required this.countAnalysis,
  });

  final VoidCallback onTap;
  final int countAnalysis;

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: AppUtils.kPaddingHorizontal16,
        sliver: SliverToBoxAdapter(
          child: InkWell(
            onTap: onTap,
            borderRadius: AppUtils.kBorderRadius12,
            child: Ink(
              padding: AppUtils.kPaddingAll12,
              decoration: const BoxDecoration(
                borderRadius: AppUtils.kBorderRadius8,
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Ink(
                      height: 40,
                      width: 40,
                      padding: AppUtils.kPaddingAll8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.color.primary20,
                      ),
                      child: Icon(
                        Icons.analytics_rounded,
                        color: context.colorScheme.primary,
                      )),
                  AppUtils.kBoxWidth8,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.translate('exam'),
                          style: context.textStyle.buttonStyle,
                        ),
                        AppUtils.kBoxHeight4,
                        Text(
                          '$countAnalysis ${countAnalysis.numberToWordRussian(context.translate('analysis_s'), context.translate('analysis_g'), context.translate('analysis_m'))}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                    color: context.theme.colorScheme.onSurface,
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
