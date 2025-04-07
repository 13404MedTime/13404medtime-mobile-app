import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../../../config/router/app_routes.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../data/models/health/sub_health_response.dart';
import '../../args/health_args.dart';
import '../sub_health_page.dart';

enum _HeightType { pedometer, sistolicheskoe, pulse, bloodSugar, temperature, weight, height }

enum _ColorType { primary, red, green, blue }

class CustomBarchartWidget extends StatelessWidget {
  const CustomBarchartWidget({
    super.key,
    required this.type,
    required this.listviewKey,
    required this.dateWidgetKey,
    required this.length,
    required this.subHealthData,
    required this.itemWidth,
    required this.dateLeftSize,
    required this.seperatedDistance,
    this.selectedIndex,
    required this.isScrollable,
    required this.detectTapedItem,
    required this.clearSelection,
    required this.changeScroll,
    required this.maxNum,
  });

  final SubHealthType type;
  final GlobalKey listviewKey;
  final GlobalKey dateWidgetKey;
  final int length;
  final MaxNums maxNum;
  final Map<DateTime, List<SubHealthModel>> subHealthData;
  final double itemWidth;
  final double dateLeftSize;
  final double seperatedDistance;
  final int? selectedIndex;
  final bool isScrollable;
  final void Function(PointerEvent event) detectTapedItem;
  final void Function(PointerUpEvent event) clearSelection;

  // ignore: avoid_positional_boolean_parameters
  final void Function(bool isScrollable) changeScroll;

  @override
  Widget build(BuildContext context) => Listener(
        onPointerDown: detectTapedItem,
        onPointerMove: detectTapedItem,
        onPointerUp: clearSelection,
        child: SingleChildScrollView(
          key: listviewKey,
          scrollDirection: Axis.horizontal,
          physics: isScrollable ? null : const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(left: dateLeftSize + 16),
                child: Opacity(
                  opacity: selectedIndex == null ? 0 : 1,
                  child: Card(
                    key: dateWidgetKey,
                    elevation: 0,
                    color: context.theme.colorScheme.primary,
                    shape: const RoundedRectangleBorder(borderRadius: AppUtils.kBorderRadius50),
                    child: Padding(
                      padding: AppUtils.kPaddingAll5,
                      child: Text(
                        subHealthData.keys.elementAt(selectedIndex ?? 0).formatForChartBar,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: context.theme.colorScheme.surface,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AppUtils.kBoxHeight8,
              Row(
                children: [
                  AppUtils.kBoxWidth12,
                  for (int i = 0; i < length.doubleTheListCount; i++)
                    if (i.isOdd) ...[
                      SizedBox(width: seperatedDistance)
                    ] else ...[
                      Foo(
                        index: i.exactIndex,
                        child: GestureDetector(
                          onLongPressUp: () {
                            changeScroll(true);
                          },
                          onLongPressStart: (val) {
                            changeScroll(false);
                          },
                          child: _BarchartItemWidget(
                            type: type,
                            index: i,
                            itemWidth: itemWidth,
                            maxNum: maxNum,
                            subHealthData: subHealthData,
                            selectedIndex: selectedIndex,
                          ),
                        ),
                      ),
                    ],
                  AppUtils.kBoxWidth16,
                ],
              ),
              AppUtils.kBoxHeight12,
            ],
          ),
        ),
      );

// double getHeight(num maxHeight, num maxNum, List<SubHealthModel> list) {
//   if (maxNum == 0 || list.isEmpty) {
//     return 2;
//   }
//   return maxHeight / (maxNum / _getMaxNumByType(list));
// }
//
// num _getMaxNumByType(final List<SubHealthModel> list) {
//   switch (type) {
//     case SubHealthType.pedometer:
//       return list.fold<num>(
//           0, (val, element) => val + (element.distance ?? 0));
//     case SubHealthType.arterialPressure:
//       return list.first.pulse ?? 0;
//     case SubHealthType.bloodSugar:
//       return list.first.value ?? 0;
//     case SubHealthType.twh:
//       return list.first.averageBmi ?? 0;
//   }
// }
//
// String _weekDayFirth(String weekdayEnShortName) {
//   if (localSource.locale == 'ru') {
//     final Map<String, String> map = {
//       'Tue': 'В',
//       'Wed': 'С',
//       'Thu': 'Ч',
//       'Fri': 'П',
//       'Sat': 'С',
//       'Sun': 'В',
//       'Mon': 'П'
//     };
//     return map[weekdayEnShortName] ?? '';
//   } else {
//     return weekdayEnShortName.substring(0, 1);
//   }
// }
}

class _BarchartItemWidget extends StatelessWidget {
  const _BarchartItemWidget({
    required this.type,
    required this.index,
    required this.itemWidth,
    required this.maxNum,
    required this.subHealthData,
    this.selectedIndex,
  });

  final SubHealthType type;
  final int index;
  final double itemWidth;
  final MaxNums maxNum;
  final Map<DateTime, List<SubHealthModel>> subHealthData;
  final int? selectedIndex;

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: Colors.transparent,
        child: SizedBox(
          height: 136,
          width: itemWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (type == SubHealthType.pedometer) ...[
                AppUtils.kSpacer,
                Container(
                  width: itemWidth,
                  height: min(
                    117,
                    getHeight(
                      117,
                      maxNum.pedometer,
                      subHealthData.values.elementAt(index.exactIndex),
                      _HeightType.pedometer,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                    color:
                        selectedIndex == index.exactIndex && subHealthData.values.elementAt(index.exactIndex).isNotEmpty
                            ? _color(_ColorType.primary, context)
                            : context.color.disabledCard,
                  ),
                ),
              ] else if (type == SubHealthType.arterialPressure) ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 117,
                        child: Column(
                          children: [
                            AppUtils.kSpacer,
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                                color: selectedIndex == index.exactIndex &&
                                        subHealthData.values.elementAt(index.exactIndex).isNotEmpty
                                    ? _color(_ColorType.red, context)
                                    : context.color.disabledCard,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: min(
                                  117,
                                  getHeight(
                                    117,
                                    maxNum.sistolicheskoe,
                                    subHealthData.values.elementAt(index.exactIndex),
                                    _HeightType.sistolicheskoe,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppUtils.kBoxWidth6,
                    Expanded(
                      child: SizedBox(
                        height: 117,
                        child: Column(
                          children: [
                            AppUtils.kSpacer,
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                                color: selectedIndex == index.exactIndex &&
                                        subHealthData.values.elementAt(index.exactIndex).isNotEmpty
                                    ? _color(_ColorType.green, context)
                                    : context.color.disabledCard,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: min(
                                  117,
                                  getHeight(
                                    117,
                                    maxNum.pulse,
                                    subHealthData.values.elementAt(index.exactIndex),
                                    _HeightType.pulse,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ] else if (type == SubHealthType.bloodSugar) ...[
                AppUtils.kSpacer,
                Container(
                  width: itemWidth,
                  height: min(
                    117,
                    getHeight(
                      117,
                      maxNum.bloodSugar,
                      subHealthData.values.elementAt(index.exactIndex),
                      _HeightType.bloodSugar,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                    color:
                        selectedIndex == index.exactIndex && subHealthData.values.elementAt(index.exactIndex).isNotEmpty
                            ? _color(_ColorType.primary, context)
                            : context.color.disabledCard,
                  ),
                ),
              ] else ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 117,
                        child: Column(
                          children: [
                            AppUtils.kSpacer,
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                                color: selectedIndex == index.exactIndex &&
                                        subHealthData.values.elementAt(index.exactIndex).isNotEmpty
                                    ? _color(_ColorType.red, context)
                                    : context.color.disabledCard,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: min(
                                  117,
                                  getHeight(
                                    117,
                                    maxNum.temperature,
                                    subHealthData.values.elementAt(index.exactIndex),
                                    _HeightType.temperature,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppUtils.kBoxWidth6,
                    Expanded(
                      child: SizedBox(
                        height: 117,
                        child: Column(
                          children: [
                            AppUtils.kSpacer,
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                                color: selectedIndex == index.exactIndex &&
                                        subHealthData.values.elementAt(index.exactIndex).isNotEmpty
                                    ? _color(_ColorType.blue, context)
                                    : context.color.disabledCard,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: min(
                                  117,
                                  getHeight(
                                    117,
                                    maxNum.weight,
                                    subHealthData.values.elementAt(index.exactIndex),
                                    _HeightType.weight,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppUtils.kBoxWidth6,
                    Expanded(
                      child: SizedBox(
                        height: 117,
                        child: Column(
                          children: [
                            AppUtils.kSpacer,
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                                color: selectedIndex == index.exactIndex &&
                                        subHealthData.values.elementAt(index.exactIndex).isNotEmpty
                                    ? _color(_ColorType.green, context)
                                    : context.color.disabledCard,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: min(
                                  117,
                                  getHeight(
                                    117,
                                    maxNum.height,
                                    subHealthData.values.elementAt(index.exactIndex),
                                    _HeightType.height,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              AppUtils.kBoxHeight6,
              Text(
                _weekDayFirth(subHealthData.keys.elementAt(index.exactIndex).getWeekdayShort),
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: context.theme.colorScheme.onSurface,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      );

  Color _color(_ColorType colorType, BuildContext context) {
    switch (colorType) {
      case _ColorType.primary:
        return context.theme.colorScheme.primary;
      case _ColorType.red:
        return context.theme.colorScheme.error;
      case _ColorType.green:
        return context.theme.colorScheme.secondary;
      case _ColorType.blue:
        return context.theme.colorScheme.primaryContainer;
    }
  }

  double getHeight(num maxHeight, num maxNum, List<SubHealthModel> list, _HeightType heightType) {
    if (maxNum == 0 || list.isEmpty) {
      return 2;
    }
    return maxHeight /
        (maxNum /
            _getMaxNumByType(
              list: list,
              heightType: heightType,
            ));
  }

  num _getMaxNumByType({
    required final List<SubHealthModel> list,
    required final _HeightType heightType,
  }) {
    switch (heightType) {
      case _HeightType.pedometer:
        return list.fold<num>(0, (val, element) => val + (element.distance ?? 0));
      case _HeightType.sistolicheskoe:
        return list.first.sistolicheskoe ?? 0;
      case _HeightType.pulse:
        return list.first.pulse ?? 0;
      case _HeightType.bloodSugar:
        return list.first.value ?? 0;
      case _HeightType.weight:
        return list.first.weight ?? 0;
      case _HeightType.height:
        return list.first.height ?? 0;
      case _HeightType.temperature:
        return list.first.bodyTemperature ?? 0;
    }
  }

  String _weekDayFirth(String weekdayEnShortName) {
    if (localSource.locale == 'ru') {
      final Map<String, String> map = {
        'Tue': 'В',
        'Wed': 'С',
        'Thu': 'Ч',
        'Fri': 'П',
        'Sat': 'С',
        'Sun': 'В',
        'Mon': 'П'
      };
      return map[weekdayEnShortName] ?? '';
    } else {
      return weekdayEnShortName.substring(0, 1);
    }
  }
}

class Foo extends SingleChildRenderObjectWidget {
  const Foo({required Widget super.child, required this.index, super.key});

  final int index;

  @override
  FooBox createRenderObject(BuildContext context) => FooBox(index);

  @override
  void updateRenderObject(BuildContext context, FooBox renderObject) {
    renderObject.index = index;
  }
}

class FooBox extends RenderProxyBox {
  FooBox(this.index);

  int index;
}
