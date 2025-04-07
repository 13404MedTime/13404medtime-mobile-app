class UnitOfMedicineResponse {
  const UnitOfMedicineResponse({
    required this.status,
    required this.description,
    required this.tableSlug,
    required this.count,
    required this.response,
    required this.customMessage,
  });

  factory UnitOfMedicineResponse.fromJson(Map<String, Object?> json) {
    final data = json['data'] as Map<String, Object?>? ?? {};
    final dataContent = data['data'] as Map<String, Object?>? ?? {};

    return UnitOfMedicineResponse(
      status: json['status'] as String? ?? '',
      description: json['description'] as String? ?? '',
      tableSlug: data['table_slug'] as String? ?? '',
      count: (dataContent['count'] as num?)?.toInt() ?? 0,
      response: (dataContent['response'] as List?)
              ?.map((item) => UnitOfMedicine.fromJson(item as Map<String, Object?>? ?? {}))
              .toList() ??
          [],
      customMessage: json['custom_message'] as String? ?? '',
    );
  }

  final String status;
  final String description;
  final String tableSlug;
  final int count;
  final List<UnitOfMedicine> response;
  final String customMessage;
}

class UnitOfMedicine {
  const UnitOfMedicine({
    required this.guid,
    required this.unitOfMeasureEng,
    required this.unitOfMeasureRu1,
    required this.unitOfMeasureRu2,
    required this.unitOfMeasureRu3,
    required this.unitOfMeasureUz,
  });

  factory UnitOfMedicine.fromJson(Map<String, Object?> json) => UnitOfMedicine(
        guid: json['guid'] as String? ?? '',
        unitOfMeasureEng: json['unit_of_measure_eng'] as String? ?? '',
        unitOfMeasureRu1: json['unit_of_measure_ru_1'] as String? ?? '',
        unitOfMeasureRu2: json['unit_of_measure_ru_2'] as String? ?? '',
        unitOfMeasureRu3: json['unit_of_measure_ru_3'] as String? ?? '',
        unitOfMeasureUz: json['unit_of_measure_uz'] as String? ?? '',
      );
  final String guid;
  final String unitOfMeasureEng;
  final String unitOfMeasureRu1;
  final String unitOfMeasureRu2;
  final String unitOfMeasureRu3;
  final String unitOfMeasureUz;
}
