import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';

class HomeTopPerformanceWidget extends StatelessWidget {
  const HomeTopPerformanceWidget({
    super.key,
    this.bestDistance = 0,
    this.bestTime = 0,
  });

  final num bestDistance;
  final num bestTime;

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
        sliver: SliverToBoxAdapter(
          child: Row(
            children: [
              Expanded(
                child: Card(
                  elevation: 0,
                  margin: AppUtils.kPaddingAll8,
                  child: Padding(
                    padding: AppUtils.kPaddingAll16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${(bestDistance % 1) == 0 ? bestDistance.toInt() : bestDistance.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: context.theme.colorScheme.primaryContainer,
                          ),
                        ),
                        Text(
                          context.translate('steps').toLowerCase(),
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 0,
                  margin: AppUtils.kPaddingAll8,
                  child: Padding(
                    padding: AppUtils.kPaddingAll16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${bestTime.toInt()} ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: context.theme.colorScheme.primaryContainer,
                                  ),
                                ),
                                Text(
                                  context.translate('hours'),
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: context.theme.colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                            AppUtils.kBoxWidth6,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${60 ~/ (1 / (bestTime % 1))} ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: context.theme.colorScheme.primaryContainer,
                                  ),
                                ),
                                Text(
                                  context.translate('min'),
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: context.theme.colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
