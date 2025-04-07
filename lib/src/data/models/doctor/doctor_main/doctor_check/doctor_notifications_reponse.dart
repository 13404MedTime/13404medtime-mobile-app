class DoctorNotificationsResponse {
  const DoctorNotificationsResponse({
    required this.status,
    required this.description,
    required this.data,
    required this.customMessage,
  });
  factory DoctorNotificationsResponse.fromJson(Map<String, Object?> json) => DoctorNotificationsResponse(
        status: json['status'] as String? ?? '',
        description: json['description'] as String? ?? '',
        data: NotificationData.fromJson(json['data'] as Map<String, Object?>? ?? {}),
        customMessage: json['custom_message'] as String? ?? '',
      );
  final String status;
  final String description;
  final NotificationData data;
  final String customMessage;
}

class NotificationData {
  const NotificationData({
    required this.tableSlug,
    required this.data,
  });

  factory NotificationData.fromJson(Map<String, Object?> json) => NotificationData(
        tableSlug: json['table_slug'] as String? ?? '',
        data: NotificationDetails.fromJson(json['data'] as Map<String, Object?>? ?? {}),
      );
  final String tableSlug;
  final NotificationDetails data;
}

class NotificationDetails {
  const NotificationDetails({
    required this.count,
    required this.response,
  });

  factory NotificationDetails.fromJson(Map<String, Object?> json) => NotificationDetails(
        count: json['count'] as int? ?? 0,
        response: (json['response'] as List?)
                ?.map((e) => NotificationItem.fromJson(e as Map<String, Object?>? ?? {}))
                .toList() ??
            [],
      );
  final int count;
  final List<NotificationItem> response;
}

class NotificationItem {
  const NotificationItem({
    required this.body,
    required this.bodyUz,
    required this.clientId,
    required this.clientData,
    required this.guid,
    required this.isRead,
    required this.preparatiId,
    required this.timeTake,
    required this.title,
    required this.titleUz,
  });

  factory NotificationItem.fromJson(Map<String, Object?> json) => NotificationItem(
        body: json['body'] as String? ?? '',
        bodyUz: json['body_uz'] as String? ?? '',
        clientId: json['client_id'] as String? ?? '',
        clientData: ClientData.fromJson(json['client_id_data'] as Map<String, Object?>? ?? {}),
        guid: json['guid'] as String? ?? '',
        isRead: json['is_read'] as bool? ?? false,
        preparatiId: json['preparati_id'] as String? ?? '',
        timeTake: json['time_take'] as String? ?? '',
        title: json['title'] as String? ?? '',
        titleUz: json['title_uz'] as String? ?? '',
      );
  final String body;
  final String bodyUz;
  final String clientId;
  final ClientData clientData;
  final String guid;
  final bool isRead;
  final String preparatiId;
  final String timeTake;
  final String title;
  final String titleUz;
}

class ClientData {
  const ClientData({
    required this.adres,
    required this.amountDoctors,
    required this.amountMedicine,
    required this.amountVisits,
    required this.avarageDistance,
    required this.avarageHeart,
    required this.balanceId,
    required this.bestDistance,
    required this.bestTime,
    required this.birthDate,
    required this.clientLastname,
    required this.clientName,
    required this.clientTypeId,
    required this.consultationCount,
    required this.fullName,
    required this.guid,
    required this.height,
    required this.phone,
    required this.platform,
    required this.roleId,
    required this.userLang,
    required this.userNumberId,
    required this.weight,
  });

  factory ClientData.fromJson(Map<String, Object?> json) => ClientData(
        adres: json['adres'] as String? ?? '',
        amountDoctors: json['amount_doctors'] as int? ?? 0,
        amountMedicine: json['amount_medicine'] as int? ?? 0,
        amountVisits: json['amount_visits'] as int? ?? 0,
        avarageDistance: json['avarage_distance'] as int? ?? 0,
        avarageHeart: json['avarage_heart'] as int? ?? 0,
        balanceId: json['balance_id'] as int? ?? 0,
        bestDistance: json['best_distance'] as int? ?? 0,
        bestTime: (json['best_time'] as num?)?.toDouble() ?? 0.0,
        birthDate: json['birth_date'] as String? ?? '',
        clientLastname: json['cleint_lastname'] as String? ?? '',
        clientName: json['client_name'] as String? ?? '',
        clientTypeId: json['client_type_id'] as String? ?? '',
        consultationCount: json['consultation_count'] as int? ?? 0,
        fullName: json['full_name'] as String? ?? '',
        guid: json['guid'] as String? ?? '',
        height: json['height'] as int? ?? 0,
        phone: json['phone'] as String? ?? '',
        platform: json['platform'] as int? ?? 0,
        roleId: json['role_id'] as String? ?? '',
        userLang: json['user_lang'] as String? ?? '',
        userNumberId: json['user_number_id'] as String? ?? '',
        weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      );
  final String adres;
  final int amountDoctors;
  final int amountMedicine;
  final int amountVisits;
  final int avarageDistance;
  final int avarageHeart;
  final int balanceId;
  final int bestDistance;
  final double bestTime;
  final String birthDate;
  final String clientLastname;
  final String clientName;
  final String clientTypeId;
  final int consultationCount;
  final String fullName;
  final String guid;
  final int height;
  final String phone;
  final int platform;
  final String roleId;
  final String userLang;
  final String userNumberId;
  final double weight;
}
