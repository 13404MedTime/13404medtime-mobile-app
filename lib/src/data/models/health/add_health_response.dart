class HealthResponse {
  HealthResponse();

  HealthResponse.fromJson(Map json) {
    response = json['data']['data']['data'];
  }

  Map<String, dynamic>? response;
}
