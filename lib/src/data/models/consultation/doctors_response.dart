import '../my_appointments/my_appointments_response.dart';

class DoctorsResponse {
  DoctorsResponse({
    this.doctorsTypes,
  });

  DoctorsResponse.fromJson(Map json) {
    doctorsTypes = json['data']['data']['response'] is List
        ? List.generate(
            (json['data']['data']['response'] as List).length,
            (index) => DoctorIdData.fromJson((json['data']['data']['response'] as List)[index]),
          )
        : null;
  }

  List<DoctorIdData>? doctorsTypes;
}
