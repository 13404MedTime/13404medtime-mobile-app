class GetMedicalHistoryRequest {
  const GetMedicalHistoryRequest({
    required this.data,
  });

  final Map<String, dynamic> data;

  Map<String, dynamic> toJson() => data;
}
