import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../data/models/health/sub_health_response.dart';
import '../../args/health_args.dart';

enum _WidgetColorType { red, blue, green }

enum _MediumFieldType { distance, time, steps, pressure, pulse, value, temperature, weight, imt }

class SubHealthMediumInfoWidget extends StatelessWidget {
  const SubHealthMediumInfoWidget({
    super.key,
    required this.type,
    required this.list,
  });

  final SubHealthType type;
  final List<SubHealthModel> list;

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: AppUtils.kPaddingHorizontal16,
        sliver: SliverToBoxAdapter(
          child: Ink(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: AppUtils.kBorderRadius8,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    AppUtils.kBoxWidth16,
                    if (type == SubHealthType.pedometer) ...[
                      _SubHealthMediumInfoAdditionalWidget(
                        colorType: _WidgetColorType.red,
                        title: _getMedium(_MediumFieldType.distance, list, isTitle: true, context: context),
                        value: _getMedium(_MediumFieldType.distance, list, isTitle: false, context: context),
                      ),
                      AppUtils.kBoxWidth12,
                      _SubHealthMediumInfoAdditionalWidget(
                        colorType: _WidgetColorType.blue,
                        title: _getMedium(_MediumFieldType.time, list, isTitle: true, context: context),
                        value: _getMedium(_MediumFieldType.time, list, isTitle: false, context: context),
                      ),
                      AppUtils.kBoxWidth12,
                      _SubHealthMediumInfoAdditionalWidget(
                        colorType: _WidgetColorType.green,
                        title: _getMedium(_MediumFieldType.steps, list, isTitle: true, context: context),
                        value: _getMedium(_MediumFieldType.steps, list, isTitle: false, context: context),
                      ),
                    ] else if (type == SubHealthType.arterialPressure) ...[
                      _SubHealthMediumInfoAdditionalWidget(
                        colorType: _WidgetColorType.red,
                        title: _getMedium(_MediumFieldType.pressure, list, isTitle: true, context: context),
                        value: _getMedium(_MediumFieldType.pressure, list, isTitle: false, context: context),
                      ),
                      AppUtils.kBoxWidth12,
                      _SubHealthMediumInfoAdditionalWidget(
                        colorType: _WidgetColorType.green,
                        title: _getMedium(_MediumFieldType.pulse, list, isTitle: true, context: context),
                        value: _getMedium(_MediumFieldType.pulse, list, isTitle: false, context: context),
                      ),
                    ] else if (type == SubHealthType.bloodSugar) ...[
                      _SubHealthMediumInfoAdditionalWidget(
                        colorType: _WidgetColorType.red,
                        title: _getMedium(_MediumFieldType.value, list, isTitle: true, context: context),
                        value: _getMedium(_MediumFieldType.value, list, isTitle: false, context: context),
                      ),
                    ] else if (type == SubHealthType.twh) ...[
                      _SubHealthMediumInfoAdditionalWidget(
                        colorType: _WidgetColorType.red,
                        title: _getMedium(_MediumFieldType.temperature, list, isTitle: true, context: context),
                        value: _getMedium(_MediumFieldType.temperature, list, isTitle: false, context: context),
                      ),
                      AppUtils.kBoxWidth12,
                      _SubHealthMediumInfoAdditionalWidget(
                        colorType: _WidgetColorType.blue,
                        title: _getMedium(_MediumFieldType.weight, list, isTitle: true, context: context),
                        value: _getMedium(_MediumFieldType.weight, list, isTitle: false, context: context),
                      ),
                      AppUtils.kBoxWidth12,
                      _SubHealthMediumInfoAdditionalWidget(
                        colorType: _WidgetColorType.green,
                        title: _getMedium(_MediumFieldType.imt, list, isTitle: true, context: context),
                        value: _getMedium(_MediumFieldType.imt, list, isTitle: false, context: context),
                      ),
                    ],
                    AppUtils.kBoxWidth16,
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  String _getMedium(final _MediumFieldType valueType, final List<SubHealthModel> list,
      {required final bool isTitle, required BuildContext context}) {
    if (isTitle) {
      switch (valueType) {
        case _MediumFieldType.distance:
          return context.translate('avarage_distance');
        case _MediumFieldType.time:
          return context.translate('avarage_time');
        case _MediumFieldType.steps:
          return context.translate('avarage_step');
        case _MediumFieldType.pressure:
          return context.translate('average_pressure');
        case _MediumFieldType.pulse:
          return context.translate('avarage_heart_rate');
        case _MediumFieldType.value:
          return context.translate('avarage_sugar_level');
        case _MediumFieldType.temperature:
          return context.translate('avarage_temp');
        case _MediumFieldType.weight:
          return context.translate('avarage_weight');
        case _MediumFieldType.imt:
          return context.translate('avarage_bmi');
      }
    } else {
      if (list.isEmpty) return '0';
      switch (valueType) {
        case _MediumFieldType.distance:
          return '${(list.fold<num>(0, (previousValue, element) => previousValue + (element.distance ?? 0)) / list.length).formatNum} ${context.translate('km')}';
        case _MediumFieldType.time:
          final num minutes = list.fold<num>(
              0, (previousValue, element) => previousValue + (element.minutes ?? 0) + ((element.hour ?? 0) * 60));
          return '${(minutes ~/ list.length) ~/ 60} ${context.translate('hour')} ${(minutes ~/ list.length) % 60} ${context.translate('min')}';
        case _MediumFieldType.steps:
          return '${list.fold<num>(0, (previousValue, element) => previousValue + (element.stepCount ?? 0)) ~/ list.length}';
        case _MediumFieldType.pressure:
          return '${list.fold<num>(0, (previousValue, element) => previousValue + (element.sistolicheskoe ?? 0)) ~/ list.length}/${list.fold<num>(0, (previousValue, element) => previousValue + (element.diastolicheskoe ?? 0)) ~/ list.length} ${context.translate('mmhg')}';
        case _MediumFieldType.pulse:
          return '${list.fold<num>(0, (previousValue, element) => previousValue + (element.pulse ?? 0)) ~/ list.length} ${context.translate('beats_min')}';
        case _MediumFieldType.value:
          return '${(list.fold<num>(0, (previousValue, element) => previousValue + (element.value ?? 0)) / list.length).formatNum} ${context.translate('mmol')}';
        case _MediumFieldType.temperature:
          return '${(list.fold<num>(0, (previousValue, element) => previousValue + (element.bodyTemperature ?? 0)) / list.length).formatNum} с°';
        case _MediumFieldType.weight:
          return '${(list.fold<num>(0, (previousValue, element) => previousValue + (element.weight ?? 0)) / list.length).formatNum} ${context.translate('kg')}';
        case _MediumFieldType.imt:
          return (list.fold<num>(0, (previousValue, element) => previousValue + (element.averageBmi ?? 0)) /
                  list.length)
              .formatNum;
      }
    }
  }
}

class _SubHealthMediumInfoAdditionalWidget extends StatelessWidget {
  const _SubHealthMediumInfoAdditionalWidget({
    required this.colorType,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;
  final _WidgetColorType colorType;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            maxLines: 1,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: context.theme.colorScheme.onSurface,
              overflow: TextOverflow.ellipsis,
              height: 1,
            ),
          ),
          Text(
            value,
            maxLines: 1,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: _getColor(colorType, context),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );

  Color _getColor(_WidgetColorType colorType, BuildContext context) {
    switch (colorType) {
      case _WidgetColorType.red:
        return context.theme.colorScheme.error;
      case _WidgetColorType.blue:
        return context.theme.colorScheme.primaryContainer;
      case _WidgetColorType.green:
        return context.theme.colorScheme.primary;
    }
  }
}
