class DoctorLoginResponse {
  const DoctorLoginResponse({
    required this.name,
    required this.id,
    required this.phone,
    required this.accessToken,
    required this.refreshToken,
    required this.imageUrl,
    required this.address,
    required this.telegramNick,
  });

  factory DoctorLoginResponse.fromJson(Map<String, dynamic> json) => DoctorLoginResponse(
        name: json['data']['user_data']['doctor_name'] ?? '',
        id: json['data']['user_data']['guid'] ?? '',
        phone: json['data']['user_data']['phone_number'] ?? '',
        accessToken: json['data']['token']['access_token'] ?? '',
        refreshToken: json['data']['token']['refresh_token'] ?? '',
        imageUrl: json['data']['user_data']['medic_photo'] ?? '',
        address: json['data']['user_data']['hospital'] ?? '',
        telegramNick: json['data']['user_data']['telegram_nick'] ?? '',
      );
  final String name;
  final String id;
  final String phone;
  final String accessToken;
  final String refreshToken;
  final String imageUrl;
  final String address;
  final String telegramNick;

  Map<String, dynamic> toJson() => {
        'name': name,
        'guid': id,
        'phone': phone,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'imageUrl': imageUrl,
        'address': address,
        'telegramNick': telegramNick,
      };
}
