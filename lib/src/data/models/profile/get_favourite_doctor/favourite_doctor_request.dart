class FavouriteDoctorRequest {
  FavouriteDoctorRequest({
    this.data,
  });

  FavouriteDoctorRequest.fromJson(json) {
    data = json['data'] != null ? FavouriteDoctorRequestData.fromJson(json['data']) : null;
  }

  FavouriteDoctorRequestData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class FavouriteDoctorRequestData {
  FavouriteDoctorRequestData({
    this.isFavourite,
    this.cleintsId,
  });

  FavouriteDoctorRequestData.fromJson(json) {
    isFavourite = json['is_favourite'];
    cleintsId = json['cleints_id'];
  }

  bool? isFavourite;
  String? cleintsId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_favourite'] = isFavourite;
    map['cleints_id'] = cleintsId;
    return map;
  }
}
