class CreateHealthResponse {
  CreateHealthResponse({this.guid});

  CreateHealthResponse.fromJson(Map json) {
    guid = json['data']['data']['data']['guid'];
  }
  String? guid;
}
