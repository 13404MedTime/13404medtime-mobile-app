class DoctorPatientResponse {
  const DoctorPatientResponse({
    required this.status,
    required this.description,
    required this.data,
    required this.customMessage,
  });

  factory DoctorPatientResponse.fromJson(Map<String, Object?> json) => DoctorPatientResponse(
        status: json['status'] as String? ?? '',
        description: json['description'] as String? ?? '',
        data: DoctorPatientData.fromJson(json['data'] as Map<String, Object?>? ?? {}),
        customMessage: json['custom_message'] as String? ?? '',
      );
  final String status;
  final String description;
  final DoctorPatientData data;
  final String customMessage;
}

class DoctorPatientData {
  const DoctorPatientData({
    required this.tableSlug,
    required this.data,
  });

  factory DoctorPatientData.fromJson(Map<String, Object?> json) => DoctorPatientData(
        tableSlug: json['table_slug'] as String? ?? '',
        data: DoctorPatientDetails.fromJson(json['data'] as Map<String, Object?>? ?? {}),
      );
  final String tableSlug;
  final DoctorPatientDetails data;
}

class DoctorPatientDetails {
  const DoctorPatientDetails({
    required this.count,
    required this.response,
  });

  factory DoctorPatientDetails.fromJson(Map<String, Object?> json) => DoctorPatientDetails(
        count: (json['count'] as num?)?.toInt() ?? 0,
        response: (json['response'] as List?)
                ?.map((e) => DoctorBooking.fromJson(e as Map<String, Object?>? ?? {}))
                .toList() ??
            [],
      );
  final int count;
  final List<DoctorBooking> response;
}

class DoctorBooking {
  const DoctorBooking({
    required this.clientsId,
    required this.clientsIdData,
    required this.date,
    required this.doctorId,
    required this.doctorIdData,
    required this.finished,
    required this.fromTime,
    required this.guid,
    required this.isBooked,
    required this.toTime,
  });

  factory DoctorBooking.fromJson(Map<String, Object?> json) => DoctorBooking(
        clientsId: json['cleints_id'] as String? ?? '',
        clientsIdData: ClientInfo.fromJson(json['cleints_id_data'] as Map<String, Object?>? ?? {}),
        date: DateTime.tryParse(json['date'] as String? ?? '') ?? DateTime(1970),
        doctorId: json['doctor_id'] as String? ?? '',
        doctorIdData: DoctorInfo.fromJson(json['doctor_id_data'] as Map<String, Object?>? ?? {}),
        finished: json['finished'] as bool? ?? false,
        fromTime: json['from_time'] as String? ?? '',
        guid: json['guid'] as String? ?? '',
        isBooked: json['is_booked'] as bool? ?? false,
        toTime: json['to_time'] as String? ?? '',
      );
  final String clientsId;
  final ClientInfo clientsIdData;
  final DateTime date;
  final String doctorId;
  final DoctorInfo doctorIdData;
  final bool finished;
  final String fromTime;
  final String guid;
  final bool isBooked;
  final String toTime;
}

class ClientInfo {
  const ClientInfo({
    required this.fullName,
    required this.phone,
    required this.weight,
    required this.height,
    required this.birthDate,
  });

  factory ClientInfo.fromJson(Map<String, Object?> json) => ClientInfo(
        fullName: json['full_name'] as String? ?? '',
        phone: json['phone'] as String? ?? '',
        weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
        height: (json['height'] as num?)?.toInt() ?? 0,
        birthDate: DateTime.tryParse(json['birth_date'] as String? ?? '') ?? DateTime(1970),
      );
  final String fullName;
  final String phone;
  final double weight;
  final int height;
  final DateTime birthDate;
}

class DoctorInfo {
  const DoctorInfo({
    required this.experience,
    required this.doctorName,
    required this.hospital,
    required this.telegramNick,
  });

  factory DoctorInfo.fromJson(Map<String, Object?> json) => DoctorInfo(
        experience: (json['experience'] as num?)?.toInt() ?? 0,
        doctorName: json['doctor_name'] as String? ?? '',
        hospital: json['hospital'] as String? ?? '',
        telegramNick: json['telegram_nick'] as String? ?? '',
      );
  final int experience;
  final String doctorName;
  final String hospital;
  final String telegramNick;
}
