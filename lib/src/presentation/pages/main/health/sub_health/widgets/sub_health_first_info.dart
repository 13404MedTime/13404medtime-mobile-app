import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../data/models/health/sub_health_response.dart';
import '../../args/health_args.dart';

enum _FieldType { distance, time, steps, pressure, pulse, value, temperature, weight, height, imt }

enum _ColorType { red, blue, green, primary }

class SubHealthFirstInfoWidget extends StatelessWidget {
  const SubHealthFirstInfoWidget({
    super.key,
    required this.type,
    required this.data,
  });

  final SubHealthType type;
  final SubHealthModel data;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingHorizontal16,
        child: SizedBox(
          height: 37,
          child: Row(
            children: [
              if (type == SubHealthType.pedometer) ...[
                _SubHealthFirstInfoAdditionalWidget(
                  data: data,
                  valueType: _FieldType.steps,
                ),
                VerticalDivider(
                  width: 28,
                  color: context.color.onSurface20,
                ),
                _SubHealthFirstInfoAdditionalWidget(
                  data: data,
                  valueType: _FieldType.time,
                ),
                VerticalDivider(
                  width: 28,
                  color: context.color.onSurface20,
                ),
                _SubHealthFirstInfoAdditionalWidget(
                  data: data,
                  valueType: _FieldType.distance,
                ),
              ] else if (type == SubHealthType.arterialPressure) ...[
                _SubHealthFirstInfoAdditionalWidget(
                  data: data,
                  valueType: _FieldType.pressure,
                ),
                VerticalDivider(
                  width: 28,
                  color: context.color.onSurface20,
                ),
                _SubHealthFirstInfoAdditionalWidget(
                  data: data,
                  valueType: _FieldType.pulse,
                ),
              ] else if (type == SubHealthType.bloodSugar) ...[
                _SubHealthFirstInfoAdditionalWidget(
                  data: data,
                  valueType: _FieldType.value,
                ),
              ] else if (type == SubHealthType.twh) ...[
                _SubHealthFirstInfoAdditionalWidget(
                  data: data,
                  valueType: _FieldType.temperature,
                ),
                VerticalDivider(
                  width: 28,
                  color: context.color.onSurface20,
                ),
                _SubHealthFirstInfoAdditionalWidget(
                  data: data,
                  valueType: _FieldType.weight,
                ),
                VerticalDivider(
                  width: 28,
                  color: context.color.onSurface20,
                ),
                _SubHealthFirstInfoAdditionalWidget(
                  data: data,
                  valueType: _FieldType.height,
                ),
                VerticalDivider(
                  width: 28,
                  color: context.color.onSurface20,
                ),
                _SubHealthFirstInfoAdditionalWidget(
                  data: data,
                  valueType: _FieldType.imt,
                ),
              ],
            ],
          ),
        ),
      );
}

class _SubHealthFirstInfoAdditionalWidget extends StatelessWidget {
  const _SubHealthFirstInfoAdditionalWidget({
    required this.data,
    required this.valueType,
  });

  final _FieldType valueType;
  final SubHealthModel data;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _getTitle(valueType, context),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: _color(_colorType(valueType), context),
            ),
          ),
          RichText(
            maxLines: 1,
            text: TextSpan(
              text: '',
              children: [
                TextSpan(
                  text: _getValue1(valueType, data),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
                if (valueType != _FieldType.steps)
                  TextSpan(
                    text: _getValue2(valueType, context),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                if (valueType == _FieldType.time) ...[
                  TextSpan(
                    text: ' ${data.minutes?.toInt() ?? 0} ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: context.theme.colorScheme.onBackground,
                    ),
                  ),
                  TextSpan(
                    text: context.translate('min'),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                ]
              ],
            ),
          ),
        ],
      );

  String _getTitle(final _FieldType valueType, BuildContext context) {
    switch (valueType) {
      case _FieldType.distance:
        return context.translate('passed');
      case _FieldType.time:
        return context.translate('time');
      case _FieldType.steps:
        return context.translate('steps');
      case _FieldType.pressure:
        return context.translate('pressure');
      case _FieldType.pulse:
        return context.translate('heart_rate');
      case _FieldType.value:
        return context.translate('blood_sugar_level');
      case _FieldType.temperature:
        return context.translate('temperature');
      case _FieldType.weight:
        return context.translate('weight');
      case _FieldType.height:
        return context.translate('height');
      case _FieldType.imt:
        return context.translate('body_mass_index');
    }
  }

  String _getValue1(final _FieldType valueType, final SubHealthModel data) {
    switch (valueType) {
      case _FieldType.distance:
        return '${data.distance?.formatNum ?? 0} ';
      case _FieldType.time:
        return '${data.hour?.toInt() ?? 0} ';
      case _FieldType.steps:
        return '${data.stepCount?.toInt() ?? 0} ';
      case _FieldType.pressure:
        return '${data.sistolicheskoe?.toInt() ?? 0}/${data.diastolicheskoe?.toInt() ?? 0} ';
      case _FieldType.pulse:
        return '${data.pulse?.toInt() ?? 0} ';
      case _FieldType.value:
        return '${data.value?.formatNum ?? 0} ';
      case _FieldType.temperature:
        return '${data.bodyTemperature?.formatNum ?? 0} ';
      case _FieldType.weight:
        return '${data.weight?.formatNum ?? 0} ';
      case _FieldType.height:
        return '${data.height?.toInt() ?? 0} ';
      case _FieldType.imt:
        return '${data.averageBmi?.formatNum ?? 0} ';
    }
  }

  String _getValue2(final _FieldType valueType, BuildContext context) {
    switch (valueType) {
      case _FieldType.distance:
        return context.translate('km');
      case _FieldType.time:
        return context.translate('hours');
      case _FieldType.steps:
        return context.translate('thousands');
      case _FieldType.pressure:
        return context.translate('mmhg');
      case _FieldType.pulse:
        return context.translate('beats_min');
      case _FieldType.value:
        return context.translate('mmol');
      case _FieldType.temperature:
        return 'с°';
      case _FieldType.weight:
        return context.translate('kg');
      case _FieldType.height:
        return context.translate('sm');
      case _FieldType.imt:
        return context.translate('bmi');
    }
  }

  _ColorType _colorType(final _FieldType valueType) {
    switch (valueType) {
      case _FieldType.distance:
        return _ColorType.green;
      case _FieldType.time:
        return _ColorType.blue;
      case _FieldType.steps:
        return _ColorType.red;
      case _FieldType.pressure:
        return _ColorType.red;
      case _FieldType.pulse:
        return _ColorType.green;
      case _FieldType.value:
        return _ColorType.red;
      case _FieldType.temperature:
        return _ColorType.red;
      case _FieldType.weight:
        return _ColorType.blue;
      case _FieldType.height:
        return _ColorType.green;
      case _FieldType.imt:
        return _ColorType.primary;
    }
  }

  Color _color(final _ColorType colorType, final BuildContext context) {
    switch (colorType) {
      case _ColorType.red:
        return context.theme.colorScheme.error;
      case _ColorType.blue:
        return context.theme.colorScheme.primaryContainer;
      case _ColorType.green:
        return context.theme.colorScheme.secondary;
      case _ColorType.primary:
        return context.theme.colorScheme.primary;
    }
  }
}
