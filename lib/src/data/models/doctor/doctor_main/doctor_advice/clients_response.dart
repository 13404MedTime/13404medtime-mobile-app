class ClientsResponse {
  const ClientsResponse({
    required this.status,
    required this.description,
    required this.data,
    required this.customMessage,
  });

  factory ClientsResponse.fromJson(Map<String, Object?> json) => ClientsResponse(
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
        data: ClientsData.fromJson(json['data'] as Map<String, Object?>? ?? {}),
      );
  final String tableSlug;
  final ClientsData data;
}

class ClientsData {
  const ClientsData({
    required this.count,
    required this.response,
  });

  factory ClientsData.fromJson(Map<String, Object?> json) => ClientsData(
        count: (json['count'] as int?) ?? 0,
        response: (json['response'] as List?)?.map((e) => Client.fromJson(e as Map<String, Object?>)).toList() ?? [],
      );
  final int count;
  final List<Client> response;
}

class Client {
  const Client({
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
    required this.clientLang,
    required this.clientLastname,
    required this.clientName,
    required this.clientTypeId,
    required this.clientTypeIdData,
    required this.consultationCount,
    required this.email,
    required this.fcmToken,
    required this.fullName,
    required this.guid,
    required this.height,
    required this.login,
    required this.passport,
    required this.password,
    required this.phone,
    required this.phoneNumber,
    required this.platform,
    required this.roleId,
    required this.roleIdData,
    required this.telegramNick,
    required this.userLang,
    required this.userNumberId,
    required this.weight,
  });

  factory Client.fromJson(Map<String, Object?> json) => Client(
        adres: json['adres'] as String? ?? '',
        amountDoctors: json['amount_doctors'] as int? ?? 0,
        amountMedicine: json['amount_medicine'] as int? ?? 0,
        amountVisits: json['amount_visits'] as int? ?? 0,
        avarageDistance: (json['avarage_distance'] as num?)?.toDouble() ?? 0.0,
        avarageHeart: (json['avarage_heart'] as num?)?.toDouble() ?? 0.0,
        balanceId: json['balance_id'] as int? ?? 0,
        bestDistance: (json['best_distance'] as num?)?.toDouble() ?? 0.0,
        bestTime: (json['best_time'] as num?)?.toDouble() ?? 0.0,
        birthDate: DateTime.tryParse(json['birth_date'] as String? ?? '') ?? DateTime(1970),
        clientLang: json['cleint_lang'] as String? ?? '',
        clientLastname: json['cleint_lastname'] as String? ?? '',
        clientName: json['client_name'] as String? ?? '',
        clientTypeId: json['client_type_id'] as String? ?? '',
        clientTypeIdData: ClientType.fromJson(json['client_type_id_data'] as Map<String, Object?>? ?? {}),
        consultationCount: json['consultation_count'] as int? ?? 0,
        email: json['email'] as String? ?? '',
        fcmToken: json['fcm_token'] as String? ?? '',
        fullName: json['full_name'] as String? ?? '',
        guid: json['guid'] as String? ?? '',
        height: json['height'] as int? ?? 0,
        login: json['login'] as String? ?? '',
        passport: json['pasport'] as String? ?? '',
        password: json['password'] as String? ?? '',
        phone: json['phone'] as String? ?? '',
        phoneNumber: json['phone_number'] as String? ?? '',
        platform: json['platform'] as int? ?? 0,
        roleId: json['role_id'] as String? ?? '',
        roleIdData: Role.fromJson(json['role_id_data'] as Map<String, Object?>? ?? {}),
        telegramNick: json['telegram_nick'] as String? ?? '',
        userLang: json['user_lang'] as String? ?? '',
        userNumberId: json['user_number_id'] as String? ?? '',
        weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      );
  final String adres;
  final int amountDoctors;
  final int amountMedicine;
  final int amountVisits;
  final double avarageDistance;
  final double avarageHeart;
  final int balanceId;
  final double bestDistance;
  final double bestTime;
  final DateTime birthDate;
  final String clientLang;
  final String clientLastname;
  final String clientName;
  final String clientTypeId;
  final ClientType clientTypeIdData;
  final int consultationCount;
  final String email;
  final String fcmToken;
  final String fullName;
  final String guid;
  final int height;
  final String login;
  final String passport;
  final String password;
  final String phone;
  final String phoneNumber;
  final int platform;
  final String roleId;
  final Role roleIdData;
  final String telegramNick;
  final String userLang;
  final String userNumberId;
  final double weight;
}

class ClientType {
  const ClientType({
    required this.guid,
    required this.name,
    required this.projectId,
    required this.selfRecover,
    required this.selfRegister,
    required this.sessionLimit,
    required this.tableSlug,
  });

  factory ClientType.fromJson(Map<String, Object?> json) => ClientType(
        guid: json['guid'] as String? ?? '',
        name: json['name'] as String? ?? '',
        projectId: json['project_id'] as String? ?? '',
        selfRecover: json['self_recover'] as bool? ?? false,
        selfRegister: json['self_register'] as bool? ?? false,
        sessionLimit: json['session_limit'] as int? ?? 0,
        tableSlug: json['table_slug'] as String? ?? '',
      );
  final String guid;
  final String name;
  final String projectId;
  final bool selfRecover;
  final bool selfRegister;
  final int sessionLimit;
  final String tableSlug;
}

class Role {
  const Role({
    required this.guid,
    required this.name,
    required this.projectId,
    required this.status,
  });

  factory Role.fromJson(Map<String, Object?> json) => Role(
        guid: json['guid'] as String? ?? '',
        name: json['name'] as String? ?? '',
        projectId: json['project_id'] as String? ?? '',
        status: json['status'] as bool? ?? false,
      );
  final String guid;
  final String name;
  final String projectId;
  final bool status;
}
