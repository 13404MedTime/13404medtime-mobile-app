class SwitchModel {
  const SwitchModel({this.today = const [], this.tomorrow = const []});

  final List<SwitchDetailModel> today;
  final List<SwitchDetailModel> tomorrow;

  SwitchModel copyWith({
    List<SwitchDetailModel>? today,
    List<SwitchDetailModel>? tomorrow,
  }) =>
      SwitchModel(
        today: today ?? this.today,
        tomorrow: tomorrow ?? this.tomorrow,
      );
}

class SwitchDetailModel {
  const SwitchDetailModel({
    required this.medicineTakingId,
    required this.naznachenieId,
    required this.guid,
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.dateTime,
    required this.isTake,
    required this.notificationId,
    required this.branchName,
    required this.date,
  });

  final String medicineTakingId;
  final String naznachenieId;
  final String guid;
  final String imageUrl;
  final String title;
  final String desc;
  final String dateTime;
  final bool isTake;
  final String notificationId;
  final String branchName;
  final String date;

  SwitchDetailModel copyWith({
    final String? medicineTakingId,
    final String? naznachenieId,
    final String? guid,
    final String? imageUrl,
    final String? title,
    final String? desc,
    final String? dateTime,
    final bool? isTake,
    final String? notificationId,
    final String? branchName,
    final String? date,
  }) =>
      SwitchDetailModel(
        date: date ?? this.date,
        medicineTakingId: medicineTakingId ?? this.medicineTakingId,
        naznachenieId: naznachenieId ?? this.naznachenieId,
        guid: guid ?? this.guid,
        imageUrl: imageUrl ?? this.imageUrl,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        dateTime: dateTime ?? this.dateTime,
        isTake: isTake ?? this.isTake,
        notificationId: notificationId ?? this.notificationId,
        branchName: branchName ?? this.branchName,
      );
}
