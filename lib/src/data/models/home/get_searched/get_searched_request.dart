class GetSearchedRequest {
  const GetSearchedRequest({
    required this.data,
  });

  final Map<String, dynamic> data;

  Map<String, dynamic> toJson() => data;
}
