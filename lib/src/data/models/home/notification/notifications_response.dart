import '../../my_appointments/my_appointments_response.dart';

class NotificationsResponse {
  NotificationsResponse({this.count, this.notificationData});

  NotificationsResponse.fromJson(Map<String, dynamic> json) {
    count = json['data']['data']['count'];
    if (json['data']['data']['data'] != null) {
      notificationData = <NotificationData>[];
      json['data']['data']['data'].forEach(
        (v) {
          notificationData?.add(NotificationData.fromJson(v));
        },
      );
    }
  }

  int? count;
  List<NotificationData>? notificationData;
}

class NotificationData {
  NotificationData(
      {this.body,
      this.bodyUz,
      this.guid,
      this.isRead,
      this.preparatiIdData,
      this.timeTake,
      this.title,
      this.titleUz,
      this.isBirthData});

  NotificationData.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    bodyUz = json['body_uz'];
    guid = json['guid'];
    isRead = json['is_read'];
    preparatiIdData = json['preparati_id_data'] != null ? PreparatiIdData.fromJson(json['preparati_id_data']) : null;
    timeTake = json['time_take'];
    title = json['title'];
    titleUz = json['title_uz'];
  }

  String? body;
  String? bodyUz;
  String? guid;
  bool? isRead;
  PreparatiIdData? preparatiIdData;
  String? timeTake;
  String? title;
  String? titleUz;
  bool? isBirthData;
}
