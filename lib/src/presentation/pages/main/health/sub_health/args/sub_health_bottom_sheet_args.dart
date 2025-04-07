import '../../../../../../config/router/app_routes.dart';
import '../../args/health_args.dart';

class SubHealthBottomSheetArgs {
  SubHealthBottomSheetArgs({
    this.distance,
    this.stepCount,
    this.hour,
    this.minutes,
    this.sistolicheskoe,
    this.diastolicheskoe,
    this.pulse,
    this.value,
    this.temperature,
    this.weight,
    this.height,
    this.date,
    this.checkedData,
    this.checkedHour,
    this.checkedMinute,
  });

  void copyWithOther(SubHealthBottomSheetArgs? data) {
    distance = data?.distance ?? distance;
    stepCount = data?.stepCount ?? stepCount;
    hour = data?.hour ?? hour;
    minutes = data?.minutes ?? minutes;
    sistolicheskoe = data?.sistolicheskoe ?? sistolicheskoe;
    diastolicheskoe = data?.diastolicheskoe ?? diastolicheskoe;
    pulse = data?.pulse ?? pulse;
    value = data?.value ?? value;
    temperature = data?.temperature ?? temperature;
    weight = data?.weight ?? weight;
    height = data?.height ?? height;
    checkedData = data?.checkedData ?? checkedData;
    checkedMinute = data?.checkedMinute ?? checkedMinute;
    checkedHour = data?.checkedHour ?? checkedHour;
    date = data?.date ?? date;
  }

  DateTime? date;
  String? checkedData;
  int? checkedMinute;
  int? checkedHour;

  // pedometer
  num? distance;
  int? stepCount;
  int? hour;
  int? minutes;

  // arterial pressure
  int? sistolicheskoe;
  int? diastolicheskoe;
  int? pulse;

  // blood sugar
  num? value;

  // twh
  num? temperature;
  int? weight;
  int? height;

  Map<String, dynamic> toJson(SubHealthType type) => {
        'multi': <dynamic>[],
        'cleints_id': localSource.userId,
        if (type == SubHealthType.pedometer) ...{
          'distance': distance,
          'step_count': stepCount,
          'hour': hour,
          'minutes': minutes,
          'date':
              '${checkedData.toString()} ${checkedHour == 0 ? '00' : checkedHour.toString().length == 1 ? '0$checkedHour' : checkedHour}:${checkedMinute == 0 ? '00' : checkedMinute.toString().length == 1 ? '0$checkedMinute' : checkedMinute}',
        },
        if (type == SubHealthType.arterialPressure) ...{
          'diastolicheskoe': diastolicheskoe,
          'sistolicheskoe': sistolicheskoe,
          'puls': pulse,
          'date':
              '${checkedData.toString()} ${checkedHour == 0 ? '00' : checkedHour.toString().length == 1 ? '0$checkedHour' : checkedHour}:${checkedMinute == 0 ? '00' : checkedMinute.toString().length == 1 ? '0$checkedMinute' : checkedMinute}',
        },
        if (type == SubHealthType.bloodSugar) ...{
          'value': value,
          'date':
              '${checkedData.toString()} ${checkedHour == 0 ? '00' : checkedHour.toString().length == 1 ? '0$checkedHour' : checkedHour}:${checkedMinute == 0 ? '00' : checkedMinute.toString().length == 1 ? '0$checkedMinute' : checkedMinute}',
        },
        if (type == SubHealthType.twh) ...{
          'height': height,
          'weight': weight,
          'average_bmi': height != null ? (((weight ?? 0) / ((height ?? 1) * (height ?? 1))) * 10000) : 0,
          'body_temperature': temperature,
          'date':
              '${checkedData.toString()} ${checkedHour == 0 ? '00' : checkedHour.toString().length == 1 ? '0$checkedHour' : checkedHour}:${checkedMinute == 0 ? '00' : checkedMinute.toString().length == 1 ? '0$checkedMinute' : checkedMinute}',
        },
      };

  @override
  String toString() =>
      'SubHealthBottomSheetArgs{distance: $distance, stepCount: $stepCount, hour: $hour, minutes: $minutes, sistolicheskoe: $sistolicheskoe, diastolicheskoe: $diastolicheskoe, pulse: $pulse, bloodSugar: $value, temperature: $temperature, weight: $weight, height: $height, date: $date, checkedData: $checkedData, checkedMinute: $checkedMinute, checkedHour: $checkedHour}';
}
