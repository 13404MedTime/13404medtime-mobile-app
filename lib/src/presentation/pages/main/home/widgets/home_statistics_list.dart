import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';

class HomeStatisticsWidget extends StatelessWidget {
  const HomeStatisticsWidget({
    super.key,
    this.avarageDistance = 0,
    this.avarageHeart = 0,
  });

  final num avarageDistance;
  final num avarageHeart;

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: AppUtils.kPaddingAll8,
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: AppUtils.kPaddingAll8,
                child: ListTile(
                  enabled: false,
                  onTap: () {},
                  tileColor: context.theme.colorScheme.surface,
                  shape: const RoundedRectangleBorder(borderRadius: AppUtils.kBorderRadius8),
                  contentPadding: AppUtils.kPaddingHorizontal16,
                  trailing: Ink(
                    padding: AppUtils.kPaddingAll12,
                    decoration: BoxDecoration(
                      color: context.color.primaryContainer10,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.directions_walk_outlined,
                      color: context.theme.colorScheme.primaryContainer,
                      size: 20,
                    ),
                  ),
                  title: Text(
                    '${(avarageDistance % 1) == 0 ? avarageDistance.toInt() : avarageDistance.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: context.theme.colorScheme.primaryContainer,
                    ),
                  ),
                  subtitle: Text(
                    context.translate('statistics_steps_on_average'),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: ListTile(
                  enabled: false,
                  onTap: () {},
                  contentPadding: AppUtils.kPaddingHorizontal16,
                  trailing: Ink(
                    padding: AppUtils.kPaddingAll12,
                    decoration: BoxDecoration(
                      color: context.color.error10,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.monitor_heart,
                      color: context.theme.colorScheme.error,
                      size: 20,
                    ),
                  ),
                  title: Text(
                    '${(avarageHeart % 1) == 0 ? avarageHeart.toInt() : avarageHeart.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: context.theme.colorScheme.error,
                    ),
                  ),
                  subtitle: Text(
                    context.translate('statistics_beats_per_minute'),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
