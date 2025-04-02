import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../../../../core/extension/extension.dart';
import '../../add_medicine/metrics/metrics_response.dart';
import '../../my_appointments/my_appointments_response.dart';

class MedicineTakingResponse {
  MedicineTakingResponse({
    this.count,
    this.medicineTaking,
  });

  MedicineTakingResponse.fromJson(json) {
    count = json['data']['data']['count'];
    if (json['data']['data']['response'] != null) {
      medicineTaking = <MedicineTakingModel>[];
      json['data']['data']['response'].forEach((v) {
        medicineTaking?.add(MedicineTakingModel.fromJson(v));
      });
    }
    // medicineTaking = json['data']['data']['response'] is List
    //     ? List.generate(
    //         (json['data']['data']['response'] as List).length,
    //         (index) => MedicineTakingModel.fromJson(
    //             (json['data']['data']['response'] as List)[index]),
    //       )
    //     : null;
  }

  int? count;
  List<MedicineTakingModel>? medicineTaking;
}

class MedicineTakingModel {
  MedicineTakingModel();

  MedicineTakingModel.fromJson(json) {
    amountMedicine = json['amount_medicine'];
    amountMedicineTake = json['amount_medicine_take'];
    cardioAppDeletePatientMedicineDisable = json['cardioapp-deletepatientmedicine_disable'];
    clientsId = json['cleints_id'];
    clientsIdData = json['cleints_id_data'] is Map ? ClientIdData.fromJson(json['cleints_id_data']) : null;
    comment = json['comment'];
    createdByPatient = json['created_by_patient'];
    currentAmount = json['current_amount'];
    currentLeft = json['current_left'];
    description =
        json['description'] is List && (json['description'] as List).isNotEmpty ? json['description'][0] : null;
    dosage = json['dosage'];
    frequency = json['frequency'] is List && (json['frequency'] as List).isNotEmpty ? json['frequency'][0] : null;
    guid = json['guid'];
    try {
      // ignore: no_leading_underscores_for_local_identifiers
      final List _hoursOfTheDay = jsonDecode(json['json_body'])?['hours_of_day'] as List;
      hoursOfTheDay =
          List.generate(_hoursOfTheDay.length, (index) => _hoursOfTheDay[index]?.toString().hhmmString ?? '');
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      hoursOfTheDay = [];
      debugPrint('e: $e');
    }
    if (hoursOfTheDay?.isNotEmpty ?? false) {
      hoursOfTheDay!.sort((a, b) {
        final DateTime? dateA = a.hhmmToDateTime;
        final DateTime? dateB = b.hhmmToDateTime;
        return dateA != null && dateB != null ? dateA.compareTo(dateB) : -1;
      });
    }
    isFromPatient = json['is_from_patient'];
    medicineName = json['medicine_name'];
    photo = json['photo'];
    naznachenieId = json['naznachenie_id'];
    naznachenieIdData =
        json['naznachenie_id_data'] != null ? NaznachenieIdData.fromJson(json['naznachenie_id_data']) : null;
    number = json['number'];
    preparatiId = json['preparati_id'];
    if (kDebugMode) {
      print('json: ${json['preparati_id_data']}');
    }

    preparatiIdData = json['preparati_id_data'] != null ? PreparatiIdData.fromJson(json['preparati_id_data']) : null;
    unitOfMeasureId = json['unit_of_measure_id'];
    unitOfMeasureIdData =
        json['unit_of_measure_id_data'] != null ? MetricModel.fromJson(json['unit_of_measure_id_data']) : null;
    weekDays = json['week_days'] is List
        ? List.generate((json['week_days'] as List).length, (index) => (json['week_days'] as List)[index])
        : null;
  }

  dynamic? amountMedicine;
  dynamic? amountMedicineTake;
  bool? cardioAppDeletePatientMedicineDisable;
  String? clientsId;
  ClientIdData? clientsIdData;
  String? comment;
  bool? createdByPatient;
  int? currentAmount;
  dynamic currentLeft;
  String? description;
  num? dosage;
  String? frequency;
  String? guid;
  List<String>? hoursOfTheDay;
  bool? isFromPatient;
  String? medicineName;
  String? photo;
  String? naznachenieId;
  NaznachenieIdData? naznachenieIdData;
  int? number;
  String? preparatiId;
  PreparatiIdData? preparatiIdData;
  String? unitOfMeasureId;
  MetricModel? unitOfMeasureIdData;
  List<String>? weekDays;

  Map<String, dynamic> toJson() => {
        'comment': comment,
        'number': number,
        'guid': guid,
        'amount_medicine': amountMedicine,
        'amount_medicine_take': amountMedicineTake,
        'cardio_app_delete_patient_medicine_disable': cardioAppDeletePatientMedicineDisable,
        'current_amount': currentAmount
      };

  @override
  String toString() =>
      'MedicineTakingModel(comment: $comment, number: $number, guid: $guid, amount_medicine: $amountMedicine, amount_medicine_take: $amountMedicineTake, cardio_app_delete_patient_medicine_disable: $cardioAppDeletePatientMedicineDisable, current_amount: $currentAmount)';
}
