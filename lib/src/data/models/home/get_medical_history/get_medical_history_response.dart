import '../../my_appointments/my_appointments_response.dart';

class GetMedicalHistoryResponse {
  GetMedicalHistoryResponse({
    this.medicalHistory,
  });

  GetMedicalHistoryResponse.fromJson(Map json) {
    count = json['data']['data']['count'] is int ? json['data']['data']['count']! : 0;
    medicalHistory = json['data']['data']['response'] is List
        ? List.generate(
            (json['data']['data']['response'] as List).length,
            (index) => NaznachenieIdData.fromJson((json['data']['data']['response'] as List)[index]),
          )
        : [];
  }

  List<NaznachenieIdData>? medicalHistory;
  int? count;

  Map<String, dynamic> toJson() => {};
}
