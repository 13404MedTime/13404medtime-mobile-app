import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../data/models/health/sub_health_response.dart';
import '../../args/health_args.dart';

enum WidgetSizeType { left, medium, right, only }

enum WidgetColorType { red, blue, green }

class SubHealthHistoryWidget extends StatelessWidget {
  const SubHealthHistoryWidget({
    super.key,
    required this.historyList,
    required this.type,
    required this.tabIndex,
  });

  final Map<String, List<SubHealthModel>> historyList;
  final SubHealthType type;
  final int tabIndex;

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: AppUtils.kPaddingHorizontal16,
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index == 0) {
                return Card(
                  elevation: 0,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                    child: Text(
                      context.translate('general_history'),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                );
              }
              if (index == 1 || index.isOdd) {
                return Divider(
                  height: 0,
                  color: context.theme.colorScheme.background,
                );
              } else {
                index = (index - 2).exactIndex;
                final List<SubHealthModel> list = historyList.values.elementAt(index)
                  ..sort((a, b) {
                    final DateTime? dateA = a.date?.toDateTimeForHealth;
                    final DateTime? dateB = b.date?.toDateTimeForHealth;
                    return dateA != null && dateB != null ? dateB.compareTo(dateA) : -1;
                  });
                return ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(index == historyList.length - 1 ? 8 : 0),
                  ),
                  child: ColoredBox(
                    color: context.theme.colorScheme.surface,
                    child: Padding(
                      padding: AppUtils.kPaddingHor16Ver12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            Platform.isIOS
                                ? historyList.keys.elementAt(index)
                                : '${list[0].date?.hhmmForHealth} | ${historyList.keys.elementAt(index)}',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: context.theme.colorScheme.onSurface,
                            ),
                          ),
                          AppUtils.kBoxHeight4,
                          for (final SubHealthModel val in list) ...[
                            AppUtils.kBoxHeight4,
                            if (historyList.values.elementAt(index).first.guid != val.guid)
                              Text(
                                val.date?.hhmmForHealth ?? '',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: context.theme.colorScheme.onSurface,
                                ),
                              ),
                            AppUtils.kBoxHeight4,
                            if (type == SubHealthType.pedometer) ...[
                              SizedBox(
                                height: 24,
                                child: Row(
                                  children: [
                                    SubHealthHistoryAdditionalWidget(
                                      colorType: WidgetColorType.red,
                                      sideType: WidgetSizeType.left,
                                      text: '${val.stepCount ?? 0} ${context.translate('step').toLowerCase()}',
                                    ),
                                    SubHealthHistoryAdditionalWidget(
                                      colorType: WidgetColorType.blue,
                                      sideType: WidgetSizeType.medium,
                                      text:
                                          '${val.hour ?? 0} ${context.translate('hour')} ${val.minutes ?? 0} ${context.translate('min')}',
                                    ),
                                    SubHealthHistoryAdditionalWidget(
                                      colorType: WidgetColorType.green,
                                      sideType: WidgetSizeType.right,
                                      text: '${val.distance?.formatNum ?? 0} ${context.translate('km')}',
                                    ),
                                  ],
                                ),
                              ),
                            ] else if (type == SubHealthType.arterialPressure) ...[
                              SizedBox(
                                height: 24,
                                child: Row(
                                  children: [
                                    SubHealthHistoryAdditionalWidget(
                                      colorType: WidgetColorType.red,
                                      sideType: WidgetSizeType.left,
                                      text:
                                          '${val.sistolicheskoe?.formatNum ?? 0}/${val.diastolicheskoe?.formatNum ?? 0} ${context.translate('mmhg')}',
                                    ),
                                    SubHealthHistoryAdditionalWidget(
                                      colorType: WidgetColorType.green,
                                      sideType: WidgetSizeType.right,
                                      text: '${val.pulse?.formatNum ?? 0} ${context.translate('beats_min')}',
                                    ),
                                  ],
                                ),
                              ),
                            ] else if (type == SubHealthType.bloodSugar) ...[
                              SizedBox(
                                height: 24,
                                child: Row(
                                  children: [
                                    SubHealthHistoryAdditionalWidget(
                                      colorType: WidgetColorType.red,
                                      sideType: WidgetSizeType.only,
                                      text: '${val.value?.formatNum ?? 0} ${context.translate('mmol')}',
                                    ),
                                  ],
                                ),
                              ),
                            ] else if (type == SubHealthType.twh) ...[
                              SizedBox(
                                height: 24,
                                child: Row(
                                  children: [
                                    SubHealthHistoryAdditionalWidget(
                                      colorType: WidgetColorType.red,
                                      sideType: WidgetSizeType.left,
                                      text: '${val.bodyTemperature?.formatNum ?? 0} с°',
                                    ),
                                    SubHealthHistoryAdditionalWidget(
                                      colorType: WidgetColorType.blue,
                                      sideType: WidgetSizeType.medium,
                                      text: '${val.weight?.formatNum} ${context.translate('kg')}',
                                    ),
                                    SubHealthHistoryAdditionalWidget(
                                      colorType: WidgetColorType.green,
                                      sideType: WidgetSizeType.right,
                                      text: '${val.averageBmi?.formatNum ?? 0} ИМТ',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
            childCount: tabIndex == 0
                ? historyList.length >= 7
                    ? 7.doubleTheListCount + 2
                    : historyList.length.doubleTheListCount + 2
                : historyList.length.doubleTheListCount + 2,
          ),
        ),
      );
}

class SubHealthHistoryAdditionalWidget extends StatelessWidget {
  const SubHealthHistoryAdditionalWidget({
    required this.sideType,
    required this.colorType,
    required this.text,
    super.key,
  });

  final WidgetSizeType sideType;
  final WidgetColorType colorType;
  final String text;

  @override
  Widget build(BuildContext context) => Expanded(
        child: ClipRRect(
          borderRadius: _getBorderRadius(sideType),
          child: ColoredBox(
            color: _getColor(colorType, context, isMainColor: false),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: _getColor(colorType, context),
                  overflow: TextOverflow.ellipsis,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );

  BorderRadius _getBorderRadius(WidgetSizeType sideType) {
    switch (sideType) {
      case WidgetSizeType.left:
        return const BorderRadius.horizontal(left: Radius.circular(50));
      case WidgetSizeType.medium:
        return BorderRadius.zero;
      case WidgetSizeType.right:
        return const BorderRadius.horizontal(right: Radius.circular(50));
      case WidgetSizeType.only:
        return const BorderRadius.all(Radius.circular(50));
    }
  }

  Color _getColor(WidgetColorType colorType, BuildContext context, {bool isMainColor = true}) {
    if (isMainColor) {
      switch (colorType) {
        case WidgetColorType.red:
          return context.theme.colorScheme.error;
        case WidgetColorType.blue:
          return context.theme.colorScheme.primaryContainer;
        case WidgetColorType.green:
          return context.theme.colorScheme.primary;
      }
    } else {
      switch (colorType) {
        case WidgetColorType.red:
          return context.color.error10;
        case WidgetColorType.blue:
          return context.color.primaryContainer10;
        case WidgetColorType.green:
          return context.color.primary10;
      }
    }
  }
}
