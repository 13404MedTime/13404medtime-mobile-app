class ClientMedicineResponse {
  const ClientMedicineResponse({
    required this.status,
    required this.description,
    required this.data,
    required this.customMessage,
  });

  factory ClientMedicineResponse.fromJson(Map<String, Object?> json) => ClientMedicineResponse(
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
        data: MedicineDetails.fromJson(json['data'] as Map<String, Object?>? ?? {}),
      );
  final String tableSlug;
  final MedicineDetails data;
}

class MedicineDetails {
  const MedicineDetails({
    required this.count,
    required this.response,
  });

  factory MedicineDetails.fromJson(Map<String, Object?> json) => MedicineDetails(
        count: (json['count'] as num?)?.toInt() ?? 0,
        response: (json['response'] as List?)
                ?.map((e) => MedicineResponse.fromJson(e as Map<String, Object?>? ?? {}))
                .toList() ??
            [],
      );
  final int count;
  final List<MedicineResponse> response;
}

class MedicineResponse {
  const MedicineResponse({
    required this.className,
    required this.group,
    required this.guid,
    required this.illnessName,
    required this.subgroup,
  });

  factory MedicineResponse.fromJson(Map<String, Object?> json) => MedicineResponse(
        className: json['class'] as String? ?? '',
        group: json['group'] as String? ?? '',
        guid: json['guid'] as String? ?? '',
        illnessName: json['illness_name'] as String? ?? '',
        subgroup: json['subgroup'] as String? ?? '',
      );
  final String className;
  final String group;
  final String guid;
  final String illnessName;
  final String subgroup;
}
