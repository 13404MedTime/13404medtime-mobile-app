class CheckConsultationDaysRequest {
  CheckConsultationDaysRequest({this.data});

  CheckConsultationDaysRequest.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Data? data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Data({this.clientsId});

  Data.fromJson(Map<String, dynamic> json) {
    clientsId = json['clients_id'];
  }

  String? clientsId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clients_id'] = clientsId;
    return data;
  }
}
