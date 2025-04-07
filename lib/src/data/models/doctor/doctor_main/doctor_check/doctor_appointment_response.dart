class DoctorAppointmentResponse {
  const DoctorAppointmentResponse({
    required this.status,
    required this.description,
    required this.data,
    required this.customMessage,
  });

  factory DoctorAppointmentResponse.fromJson(Map<String, Object?> json) => DoctorAppointmentResponse(
        status: json['status'] as String? ?? '',
        description: json['description'] as String? ?? '',
        data: DataWrapper.fromJson(json['data'] as Map<String, Object?>? ?? {}),
        customMessage: json['custom_message'] as String? ?? '',
      );
  final String status;
  final String description;
  final DataWrapper data;
  final String customMessage;
}

class DataWrapper {
  const DataWrapper({
    required this.tableSlug,
    required this.data,
  });

  factory DataWrapper.fromJson(Map<String, Object?> json) => DataWrapper(
        tableSlug: json['table_slug'] as String? ?? '',
        data: Data.fromJson(json['data'] as Map<String, Object?>? ?? {}),
      );
  final String tableSlug;
  final Data data;
}

class Data {
  const Data({
    required this.count,
    required this.response,
  });

  factory Data.fromJson(Map<String, Object?> json) => Data(
        count: json['count'] as int? ?? 0,
        response: (json['response'] as List<Object?>?)
                ?.map((e) => Appointment.fromJson(e as Map<String, Object?>? ?? {}))
                .toList() ??
            [],
      );
  final int count;
  final List<Appointment> response;
}

class Appointment {
  const Appointment({
    required this.amount,
    required this.amountMedTaken,
    required this.clientsId,
    required this.clientsIdData,
    required this.clientName,
    required this.clientSurname,
    required this.comment,
    required this.consultationType,
    required this.createdTime,
    required this.defaultNumber,
    required this.doctorId,
    required this.doctorIdData,
    required this.file,
    required this.guid,
    required this.illId,
    required this.illIdData,
    required this.illName,
    required this.incrementId,
    required this.patientVisitsIds,
    required this.preparatiIds,
    required this.prescriptionDetails,
  });

  factory Appointment.fromJson(Map<String, Object?> json) => Appointment(
        amount: json['amount'] as int? ?? 0,
        amountMedTaken: json['amount_med_taken'].toString(),
        clientsId: json['cleints_id'] as String? ?? '',
        clientsIdData: ClientData.fromJson(json['cleints_id_data'] as Map<String, Object?>? ?? {}),
        clientName: json['client_name'] as String? ?? '',
        clientSurname: json['client_surname'] as String? ?? '',
        comment: json['comment'] as String? ?? '',
        consultationType: json['consultation_type'] as String? ?? '',
        createdTime: json['created_time'] as String? ?? '',
        defaultNumber: json['default_number'] as int? ?? 0,
        doctorId: json['doctor_id'] as String? ?? '',
        doctorIdData: DoctorData.fromJson(json['doctor_id_data'] as Map<String, Object?>? ?? {}),
        file: json['file'] as String? ?? '',
        guid: json['guid'] as String? ?? '',
        illId: json['ill_id'] as String? ?? '',
        illIdData: IllnessData.fromJson(json['ill_id_data'] as Map<String, Object?>? ?? {}),
        illName: json['ill_name'] as String? ?? '',
        incrementId: json['increment_id'] as String? ?? '',
        patientVisitsIds: (json['patient_visits_ids'] as List<Object?>?)?.map((e) => e as String? ?? '').toList() ?? [],
        preparatiIds: (json['preparati_ids'] as List<Object?>?)?.map((e) => e as String? ?? '').toList() ?? [],
        prescriptionDetails: json['prescription_details'] as String? ?? '',
      );
  final int amount;
  final String amountMedTaken;
  final String clientsId;
  final ClientData clientsIdData;
  final String clientName;
  final String clientSurname;
  final String comment;
  final String consultationType;
  final String createdTime;
  final int defaultNumber;
  final String doctorId;
  final DoctorData doctorIdData;
  final String file;
  final String guid;
  final String illId;
  final IllnessData illIdData;
  final String illName;
  final String incrementId;
  final List<String> patientVisitsIds;
  final List<String> preparatiIds;
  final String prescriptionDetails;
}

class ClientData {
  const ClientData({
    required this.fullName,
    required this.phoneNumber,
    required this.birthDate,
    required this.weight,
    required this.height,
  });

  factory ClientData.fromJson(Map<String, Object?> json) => ClientData(
        fullName: json['full_name'] as String? ?? '',
        phoneNumber: json['phone_number'] as String? ?? '',
        birthDate: json['birth_date'] as String? ?? '',
        weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
        height: (json['height'] as num?)?.toDouble() ?? 0.0,
      );
  final String fullName;
  final String phoneNumber;
  final String birthDate;
  final double weight;
  final double height;
}

class DoctorData {
  const DoctorData({
    required this.doctorName,
    required this.experience,
    required this.hospital,
    required this.login,
    required this.medicPhoto,
    required this.telegramNick,
    required this.specialization,
    required this.availability,
  });

  factory DoctorData.fromJson(Map<String, Object?> json) => DoctorData(
        doctorName: json['doctor_name'] as String? ?? '',
        experience: json['experience'] as int? ?? 0,
        hospital: json['hospital'] as String? ?? '',
        login: json['login'] as String? ?? '',
        medicPhoto: json['medic_photo'] as String? ?? '',
        telegramNick: json['telegram_nick'] as String? ?? '',
        specialization: json['specialization'] as String? ?? '',
        availability: json['availability'] as String? ?? '',
      );
  final String doctorName;
  final int experience;
  final String hospital;
  final String login;
  final String medicPhoto;
  final String telegramNick;
  final String specialization;
  final String availability;
}

class IllnessData {
  const IllnessData({
    required this.illnessName,
    required this.symptoms,
    required this.severity,
  });

  factory IllnessData.fromJson(Map<String, Object?> json) => IllnessData(
        illnessName: json['illness_name'] as String? ?? '',
        symptoms: json['symptoms'] as String? ?? '',
        severity: json['severity'] as String? ?? '',
      );
  final String illnessName;
  final String symptoms;
  final String severity;
}
