class UnreadNotificationsCountResponse {
  UnreadNotificationsCountResponse({
    this.count,
  });

  UnreadNotificationsCountResponse.fromJson(Map<String, dynamic> json) {
    count = json['data']['data']['count'];
  }

  int? count;
}
