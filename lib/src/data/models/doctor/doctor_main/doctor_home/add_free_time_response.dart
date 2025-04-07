class AddFreeTimeResponse {
  const AddFreeTimeResponse({
    required this.status,
  });

  factory AddFreeTimeResponse.fromJson(Map<String, Object?> json) => AddFreeTimeResponse(
        status: json['status'] as String? ?? '',
      );

  final String status;
}
