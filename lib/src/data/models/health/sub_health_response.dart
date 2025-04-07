import '../my_appointments/my_appointments_response.dart';
import 'arterial_pressure_response.dart';
import 'blood_sugar_response.dart';
import 'pedometer_response.dart';
import 'twn_response.dart';

class SubHealthModel {
  SubHealthModel({
    this.clientsId,
    this.clientsIdData,
    this.date,
    this.guid,
    this.patientCardsId,
    this.distance,
    this.hour,
    this.minutes,
    this.stepCount,
    this.time,
    this.diastolicheskoe,
    this.pulse,
    this.sistolicheskoe,
    this.value,
    this.averageBmi,
    this.bodyTemperature,
    this.height,
    this.weight,
  });

  SubHealthModel.fromPedometer(PedometerModel data) {
    clientsId = data.clientsId;
    clientsIdData = data.clientsIdData;
    date = data.date;
    guid = data.guid;

    distance = data.distance;
    hour = data.hour;
    minutes = data.minutes;
    stepCount = data.stepCount;
    // time = data.time;
  }

  SubHealthModel.fromArterialPressure(ArterialPressureModel data) {
    clientsId = data.clientsId;
    clientsIdData = data.clientsIdData;
    date = data.date;
    guid = data.guid;

    diastolicheskoe = data.diastolicheskoe;
    pulse = data.pulse;
    sistolicheskoe = data.sistolicheskoe;
    patientCardsId = data.patientCardsId;
  }

  SubHealthModel.fromBloodSugar(BloodSugarModel data) {
    clientsId = data.clientsId;
    clientsIdData = data.clientsIdData;
    date = data.date;
    guid = data.guid;

    value = data.value;
  }

  SubHealthModel.fromTemperatureWeightHeight(TWHModel data) {
    clientsId = data.clientsId;
    clientsIdData = data.clientsIdData;
    date = data.date;
    guid = data.guid;

    averageBmi = data.averageBmi;
    bodyTemperature = data.bodyTemperature;
    height = data.height;
    weight = data.weight;
  }

  SubHealthModel.fromJson(Map json) {
    //default
    clientsId = json['cleints_id'];
    clientsIdData = json['cleints_id_data'] != null ? ClientIdData.fromJson(json['cleints_id_data']) : null;
    date = json['date'];
    guid = json['guid'];

    // pedometer
    distance = json['distance'] is String ? num.tryParse(json['distance']) ?? 0 : json['distance'];
    hour = json['hour'];
    minutes = json['minutes'];
    stepCount = json['step_count'];
    time = json['time'];

    // arterial pressure
    diastolicheskoe = json['diastolicheskoe'];
    pulse = json['puls'];
    sistolicheskoe = json['sistolicheskoe'];
    value = json['value'];
    patientCardsId = json['patient_cards_id'];

    // blood sugar
    value = json['value'];

    // temperature weight height
    height = json['height'];
    weight = json['weight'];
    averageBmi = json['average_bmi'];
    bodyTemperature = json['body_temperature'];
  }

  SubHealthModel copyWith({
    num? distance,
    num? hour,
    num? minutes,
    num? stepCount,
  }) =>
      SubHealthModel(
        minutes: minutes ?? this.minutes,
        hour: hour ?? this.hour,
        distance: distance ?? this.distance,
        stepCount: stepCount ?? this.stepCount,
        weight: weight,
        height: height,
        value: value,
        pulse: pulse,
        diastolicheskoe: diastolicheskoe,
        sistolicheskoe: sistolicheskoe,
        date: date,
        time: time,
        guid: guid,
        averageBmi: averageBmi,
        bodyTemperature: bodyTemperature,
        clientsId: clientsId,
        clientsIdData: clientsIdData,
        patientCardsId: patientCardsId,
      );

  // default
  String? clientsId;
  ClientIdData? clientsIdData;
  String? date;
  String? guid;

  // pedometer
  num? distance;
  num? hour;
  num? minutes;
  num? stepCount;
  num? time;

  // arterial pressure
  num? diastolicheskoe;
  num? pulse;
  num? sistolicheskoe;
  String? patientCardsId;

  // blood sugar
  num? value;

  // temperature weight height
  num? averageBmi;
  num? bodyTemperature;
  num? height;
  num? weight;

  @override
  String toString() => '{ distance: $distance }';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubHealthModel &&
          runtimeType == other.runtimeType &&
          clientsId == other.clientsId &&
          clientsIdData == other.clientsIdData &&
          date == other.date &&
          guid == other.guid &&
          patientCardsId == other.patientCardsId &&
          distance == other.distance &&
          hour == other.hour &&
          minutes == other.minutes &&
          stepCount == other.stepCount &&
          time == other.time &&
          diastolicheskoe == other.diastolicheskoe &&
          pulse == other.pulse &&
          sistolicheskoe == other.sistolicheskoe &&
          value == other.value &&
          averageBmi == other.averageBmi &&
          bodyTemperature == other.bodyTemperature &&
          height == other.height &&
          weight == other.weight;

  @override
  int get hashCode =>
      clientsId.hashCode ^
      clientsIdData.hashCode ^
      date.hashCode ^
      guid.hashCode ^
      patientCardsId.hashCode ^
      distance.hashCode ^
      hour.hashCode ^
      minutes.hashCode ^
      stepCount.hashCode ^
      time.hashCode ^
      diastolicheskoe.hashCode ^
      pulse.hashCode ^
      sistolicheskoe.hashCode ^
      value.hashCode ^
      averageBmi.hashCode ^
      bodyTemperature.hashCode ^
      height.hashCode ^
      weight.hashCode;
}
