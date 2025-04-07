class GetAllMedicinesResponse {
  const GetAllMedicinesResponse({
    required this.status,
    required this.description,
    required this.data,
    required this.customMessage,
  });

  factory GetAllMedicinesResponse.fromJson(Map<String, Object?> json) => GetAllMedicinesResponse(
        status: json['status'] as String? ?? '',
        description: json['description'] as String? ?? '',
        data: MedicineData.fromJson(json['data'] as Map<String, Object?>? ?? {}),
        customMessage: json['custom_message'] as String? ?? '',
      );
  final String status;
  final String description;
  final MedicineData data;
  final String customMessage;
}

class MedicineData {
  const MedicineData({
    required this.tableSlug,
    required this.data,
  });

  factory MedicineData.fromJson(Map<String, Object?> json) => MedicineData(
        tableSlug: json['table_slug'] as String? ?? '',
        data: MedicineList.fromJson(json['data'] as Map<String, Object?>? ?? {}),
      );
  final String tableSlug;
  final MedicineList data;
}

class MedicineList {
  const MedicineList({
    required this.count,
    required this.response,
  });

  factory MedicineList.fromJson(Map<String, Object?> json) => MedicineList(
        count: json['count'] as int? ?? 0,
        response: (json['response'] as List<Object?>? ?? [])
            .map((e) => Medicine.fromJson(e as Map<String, Object?>? ?? {}))
            .toList(),
      );
  final int count;
  final List<Medicine> response;
}

class Medicine {
  const Medicine({
    required this.brandName,
    required this.dosageForm,
    required this.guid,
    required this.naznachenieIds,
    required this.photo,
  });

  factory Medicine.fromJson(Map<String, Object?> json) => Medicine(
        brandName: json['brand_name'] as String? ?? '',
        dosageForm: json['dosage_form'] as String? ?? '',
        guid: json['guid'] as String? ?? '',
        naznachenieIds: (json['naznachenie_ids'] as List<Object?>? ?? []).map((e) => e as String? ?? '').toList(),
        photo: json['photo'] as String? ?? '',
      );
  final String brandName;
  final String dosageForm;
  final String guid;
  final List<String> naznachenieIds;
  final String photo;
}
