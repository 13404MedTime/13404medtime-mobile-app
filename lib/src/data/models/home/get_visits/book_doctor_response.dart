class BookDoctorResponse {
  const BookDoctorResponse({
    required this.status,
    required this.description,
    required this.data,
    required this.customMessage,
  });

  factory BookDoctorResponse.fromJson(Map<String, Object?> json) => BookDoctorResponse(
        status: json['status'] as String? ?? '',
        description: json['description'] as String? ?? '',
        data: BookDoctorData.fromJson(json['data'] as Map<String, Object?>? ?? {}),
        customMessage: json['custom_message'] as String? ?? '',
      );
  final String status;
  final String description;
  final BookDoctorData data;
  final String customMessage;
}

class BookDoctorData {
  const BookDoctorData({
    required this.tableSlug,
    required this.data,
  });

  factory BookDoctorData.fromJson(Map<String, Object?> json) => BookDoctorData(
        tableSlug: json['table_slug'] as String? ?? '',
        data: DoctorBookingData.fromJson(json['data'] as Map<String, Object?>? ?? {}),
      );
  final String tableSlug;
  final DoctorBookingData data;
}

class DoctorBookingData {
  const DoctorBookingData({required this.data});

  factory DoctorBookingData.fromJson(Map<String, Object?> json) => DoctorBookingData(
        data: BookingDetails.fromJson(json['data'] as Map<String, Object?>? ?? {}),
      );
  final BookingDetails data;
}

class BookingDetails {
  const BookingDetails({
    required this.clientsId,
    required this.clientsIdData,
    required this.companyServiceEnvironmentId,
    required this.companyServiceProjectId,
    required this.date,
    required this.doctorId,
    required this.doctorIdData,
    required this.finished,
    required this.fromTime,
    required this.guid,
    required this.isBooked,
    required this.toTime,
  });

  factory BookingDetails.fromJson(Map<String, Object?> json) => BookingDetails(
        clientsId: json['cleints_id'] as String? ?? '',
        clientsIdData: ClientData.fromJson(json['cleints_id_data'] as Map<String, Object?>? ?? {}),
        companyServiceEnvironmentId: json['company_service_environment_id'] as String? ?? '',
        companyServiceProjectId: json['company_service_project_id'] as String? ?? '',
        date: json['date'] as String? ?? '',
        doctorId: json['doctor_id'] as String? ?? '',
        doctorIdData: DoctorData.fromJson(json['doctor_id_data'] as Map<String, Object?>? ?? {}),
        finished: json['finished'] as bool? ?? false,
        fromTime: json['from_time'] as String? ?? '',
        guid: json['guid'] as String? ?? '',
        isBooked: json['is_booked'] as bool? ?? false,
        toTime: json['to_time'] as String? ?? '',
      );
  final String clientsId;
  final ClientData clientsIdData;
  final String companyServiceEnvironmentId;
  final String companyServiceProjectId;
  final String date;
  final String doctorId;
  final DoctorData doctorIdData;
  final bool finished;
  final String fromTime;
  final String guid;
  final bool isBooked;
  final String toTime;
}

class ClientData {
  const ClientData({
    required this.adres,
    required this.amountDoctors,
    required this.amountMedicine,
    required this.amountVisits,
    required this.averageDistance,
    required this.averageHeart,
    required this.balanceId,
    required this.bestDistance,
    required this.bestTime,
    required this.birthDate,
    required this.bloodGroup,
    required this.clientLang,
    required this.clientLastname,
    required this.clientName,
    required this.clientTypeId,
    required this.consultationCount,
    required this.email,
    required this.fcmToken,
    required this.fullName,
    required this.guid,
    required this.height,
    required this.login,
    required this.madadioDeleteUserDisable,
    required this.madadioGenerateBalanceIdDisable,
    required this.passport,
    required this.password,
    required this.phone,
    required this.phoneNumber,
    required this.platform,
    required this.rhFactor,
    required this.roleId,
    required this.telegramNick,
    required this.userIdAuth,
    required this.userLang,
    required this.userNumberId,
    required this.weight,
  });

  factory ClientData.fromJson(Map<String, Object?> json) => ClientData(
        adres: json['adres'] as String? ?? '',
        amountDoctors: json['amount_doctors'] as int? ?? 0,
        amountMedicine: json['amount_medicine'] as int? ?? 0,
        amountVisits: json['amount_visits'] as int? ?? 0,
        averageDistance: json['avarage_distance'] as int? ?? 0,
        averageHeart: json['avarage_heart'] as int? ?? 0,
        balanceId: json['balance_id'] as int? ?? 0,
        bestDistance: json['best_distance'] as int? ?? 0,
        bestTime: json['best_time'] as int? ?? 0,
        birthDate: json['birth_date'] as String? ?? '',
        bloodGroup: json['bloods_group'] as String? ?? '',
        clientLang: json['cleint_lang'] as String? ?? '',
        clientLastname: json['cleint_lastname'] as String? ?? '',
        clientName: json['client_name'] as String? ?? '',
        clientTypeId: json['client_type_id'] as String? ?? '',
        consultationCount: json['consultation_count'] as int? ?? 0,
        email: json['email'] as String? ?? '',
        fcmToken: json['fcm_token'] as String? ?? '',
        fullName: json['full_name'] as String? ?? '',
        guid: json['guid'] as String? ?? '',
        height: json['height'] as int? ?? 0,
        login: json['login'] as String? ?? '',
        madadioDeleteUserDisable: json['madadio-delete-user_disable'] as bool? ?? false,
        madadioGenerateBalanceIdDisable: json['madadio-generate-balance-id_disable'] as bool? ?? false,
        passport: json['pasport'] as String? ?? '',
        password: json['password'] as String? ?? '',
        phone: json['phone'] as String? ?? '',
        phoneNumber: json['phone_number'] as String? ?? '',
        platform: json['platform'] as int? ?? 0,
        rhFactor: json['rh_factor'] as String? ?? '',
        roleId: json['role_id'] as String? ?? '',
        telegramNick: json['telegram_nick'] as String? ?? '',
        userIdAuth: json['user_id_auth'] as String? ?? '',
        userLang: json['user_lang'] as String? ?? '',
        userNumberId: json['user_number_id'] as String? ?? '',
        weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      );
  final String adres;
  final int amountDoctors;
  final int amountMedicine;
  final int amountVisits;
  final int averageDistance;
  final int averageHeart;
  final int balanceId;
  final int bestDistance;
  final int bestTime;
  final String birthDate;
  final String bloodGroup;
  final String clientLang;
  final String clientLastname;
  final String clientName;
  final String clientTypeId;
  final int consultationCount;
  final String email;
  final String fcmToken;
  final String fullName;
  final String guid;
  final int height;
  final String login;
  final bool madadioDeleteUserDisable;
  final bool madadioGenerateBalanceIdDisable;
  final String passport;
  final String password;
  final String phone;
  final String phoneNumber;
  final int platform;
  final String rhFactor;
  final String roleId;
  final String telegramNick;
  final String userIdAuth;
  final String userLang;
  final String userNumberId;
  final double weight;
}

class DoctorData {
  const DoctorData({
    required this.doctorId,
    required this.doctorName,
  });

  factory DoctorData.fromJson(Map<String, Object?> json) => DoctorData(
        doctorId: json['doctor_id'] as String? ?? '',
        doctorName: json['doctor_name'] as String? ?? '',
      );
  final String doctorId;
  final String doctorName;
}
