class DoctorBookingRequestResponse {
  const DoctorBookingRequestResponse({
    required this.status,
    required this.description,
    required this.data,
    required this.customMessage,
  });

  factory DoctorBookingRequestResponse.fromJson(Map<String, Object?> json) =>
      DoctorBookingRequestResponse(
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
        data: BookingData.fromJson(json['data'] as Map<String, Object?>? ?? {}),
      );
  final String tableSlug;
  final BookingData data;
}

class BookingData {
  const BookingData({
    required this.count,
    required this.response,
  });

  factory BookingData.fromJson(Map<String, Object?> json) => BookingData(
        count: (json['count'] as int?) ?? 0,
        response: (json['response'] as List<Object?>?)
                ?.map((e) =>
                    BookingResponse.fromJson(e as Map<String, Object?>? ?? {}))
                .toList() ??
            [],
      );
  final int count;
  final List<BookingResponse> response;
}

class BookingResponse {
  const BookingResponse({
    required this.clientsId,
    required this.clientsIdData,
    required this.doctorBookingId,
    required this.doctorBookingIdData,
    required this.doctorId,
    required this.doctorIdData,
    required this.doctorDescription,
    required this.guid,
    required this.patientDescription,
    required this.status,
  });

  factory BookingResponse.fromJson(Map<String, Object?> json) =>
      BookingResponse(
        clientsId: json['cleints_id'] as String? ?? '',
        clientsIdData: ClientData.fromJson(
            json['cleints_id_data'] as Map<String, Object?>? ?? {}),
        doctorBookingId: json['doctor_booking_id'] as String? ?? '',
        doctorBookingIdData: DoctorBookingData.fromJson(
            (json['doctor_booking_id_data'] as Map<String, Object?>?) ?? {}),
        doctorId: json['doctor_id'] as String? ?? '',
        doctorIdData: DoctorData.fromJson(
            json['doctor_id_data'] as Map<String, Object?>? ?? {}),
        doctorDescription: json['doctor_description'] as String? ?? '',
        guid: json['guid'] as String? ?? '',
        patientDescription: json['patient_description'] as String? ?? '',
        status: (json['status'] as List<Object?>?)
                ?.map((e) => e as String? ?? '')
                .toList() ??
            [],
      );
  final String clientsId;
  final ClientData clientsIdData;
  final String doctorBookingId;
  final DoctorBookingData doctorBookingIdData;
  final String doctorId;
  final DoctorData doctorIdData;
  final String doctorDescription;
  final String guid;
  final String patientDescription;
  final List<String> status;
}

class DoctorData {
  const DoctorData({
    required this.doctorId,
    required this.doctorName,
    required this.categoryId,
    required this.clientTypeId,
    required this.hospital,
    required this.telegramNick,
    required this.userIdAuth,
  });

  factory DoctorData.fromJson(Map<String, Object?> json) => DoctorData(
        doctorId: json['doctor_id'] as String? ?? '',
        doctorName: json['doctor_name'] as String? ?? '',
        categoryId: json['category_id'] as String? ?? '',
        clientTypeId: json['client_type_id'] as String? ?? '',
        hospital: json['hospital'] as String? ?? '',
        telegramNick: json['telegram_nick'] as String? ?? '',
        userIdAuth: json['user_id_auth'] as String? ?? '',
      );
  final String doctorId;
  final String doctorName;
  final String categoryId;
  final String clientTypeId;
  final String hospital;
  final String telegramNick;
  final String userIdAuth;
}

class DoctorBookingData {
  const DoctorBookingData({
    required this.bookingId,
    required this.date,
    required this.doctorId,
    required this.finished,
    required this.fromTime,
    required this.guid,
    required this.isBooked,
    required this.toTime,
  });

  factory DoctorBookingData.fromJson(Map<String, Object?> json) =>
      DoctorBookingData(
        bookingId: json['_id'] as Map<String, Object?>? ?? {},
        date: json['date'] as String? ?? '',
        doctorId: json['doctor_id'] as String? ?? '',
        finished: json['finished'] as bool? ?? false,
        fromTime: json['from_time'] as String? ?? '',
        guid: json['guid'] as String? ?? '',
        isBooked: json['is_booked'] as bool? ?? false,
        toTime: json['to_time'] as String? ?? '',
      );
  final Map<String, Object?> bookingId;
  final String date;
  final String doctorId;
  final bool finished;
  final String fromTime;
  final String guid;
  final bool isBooked;
  final String toTime;
}

class ClientData {
  const ClientData({
    required this.clientId,
    required this.clientName,
    required this.clientLastName,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.birthDate,
    required this.height,
    required this.weight,
    required this.userLang,
    required this.roleId,
    required this.amountDoctors,
    required this.amountMedicine,
    required this.amountVisits,
    required this.consultationCount,
    required this.platform,
    required this.userNumberId,
    required this.fcmToken,
  });

  factory ClientData.fromJson(Map<String, Object?> json) => ClientData(
        clientId: json['_id'] as Map<String, Object?>? ?? {},
        clientName: json['client_name'] as String? ?? '',
        clientLastName: json['cleint_lastname'] as String? ?? '',
        fullName: json['full_name'] as String? ?? '',
        phone: json['phone'] as String? ?? '',
        email: json['email'] as String? ?? '',
        birthDate: json['birth_date'] as String? ?? '',
        height: (json['height'] as num?)?.toDouble() ?? 0.0,
        weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
        userLang: json['user_lang'] as String? ?? '',
        roleId: json['role_id'] as String? ?? '',
        amountDoctors: json['amount_doctors'] as int? ?? 0,
        amountMedicine: json['amount_medicine'] as int? ?? 0,
        amountVisits: json['amount_visits'] as int? ?? 0,
        consultationCount: json['consultation_count'] as int? ?? 0,
        platform: json['platform'] as int? ?? 0,
        userNumberId: json['user_number_id'] as String? ?? '',
        fcmToken: json['fcm_token'] as String? ?? '',
      );
  final Map<String, Object?> clientId;
  final String clientName;
  final String clientLastName;
  final String fcmToken;
  final String fullName;
  final String phone;
  final String email;
  final String birthDate;
  final double height;
  final double weight;
  final String userLang;
  final String roleId;
  final int amountDoctors;
  final int amountMedicine;
  final int amountVisits;
  final int consultationCount;
  final int platform;
  final String userNumberId;
}
