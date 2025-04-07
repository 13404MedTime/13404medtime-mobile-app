class Metrics {
  Metrics({
    this.metrics,
  });

  Metrics.fromJson(Map<String, dynamic> json) {
    metrics = json['data']['data']['response'] is List
        ? List.generate(
            (json['data']['data']['response'] as List).length,
            (index) => MetricModel.fromJson(
              (json['data']['data']['response'] as List)[index],
            ),
          )
        : [];
  }

  List<MetricModel>? metrics;
}

class MetricModel {
  MetricModel({
    this.unitOfMeasureRu1,
    this.unitOfMeasureRu2,
    this.unitOfMeasureRu3,
    this.unitOfMeasureUz,
    this.guid,
    this.unitOfMeasureEng,
  });

  MetricModel.fromJson(json) {
    unitOfMeasureRu1 = json['unit_of_measure_ru_1'];
    unitOfMeasureRu2 = json['unit_of_measure_ru_2'];
    unitOfMeasureRu3 = json['unit_of_measure_ru_3'];
    unitOfMeasureUz = json['unit_of_measure_uz'];
    guid = json['guid'];
    unitOfMeasureEng = json['unit_of_measure_eng'];
  }

  String? unitOfMeasureRu1;
  String? unitOfMeasureRu2;
  String? unitOfMeasureRu3;
  String? unitOfMeasureUz;
  String? guid;
  String? unitOfMeasureEng;

  @override
  String toString() =>
      'MetricModel(unitOfMeasureRu1: $unitOfMeasureRu1, unitOfMeasureRu2: $unitOfMeasureRu2, unitOfMeasureRu3: $unitOfMeasureRu3, unitOfMeasureUz: $unitOfMeasureUz, guid: $guid, unitOfMeasureEng: $unitOfMeasureEng)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MetricModel &&
        o.unitOfMeasureRu1 == unitOfMeasureRu1 &&
        o.unitOfMeasureRu2 == unitOfMeasureRu2 &&
        o.unitOfMeasureRu3 == unitOfMeasureRu3 &&
        o.unitOfMeasureUz == unitOfMeasureUz &&
        o.guid == guid &&
        o.unitOfMeasureEng == unitOfMeasureEng;
  }

  @override
  int get hashCode =>
      unitOfMeasureRu1.hashCode ^
      unitOfMeasureRu2.hashCode ^
      unitOfMeasureRu3.hashCode ^
      unitOfMeasureUz.hashCode ^
      guid.hashCode ^
      unitOfMeasureEng.hashCode;
}
