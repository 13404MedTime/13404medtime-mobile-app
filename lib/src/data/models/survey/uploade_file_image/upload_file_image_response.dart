class UploadFileImageResponse {
  UploadFileImageResponse({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  UploadFileImageResponse.fromJson(Map json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    customMessage = json['custom_message'];
  }

  String? status;
  String? description;
  Data? data;
  String? customMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['description'] = description;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['custom_message'] = customMessage;
    return map;
  }
}

class Data {
  Data({
    this.tableSlug,
    this.data,
  });

  Data.fromJson(Map json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? UploadFileImageData.fromJson(json['data']) : null;
  }

  String? tableSlug;
  UploadFileImageData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['table_slug'] = tableSlug;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class UploadFileImageData {
  UploadFileImageData({
    this.data,
  });

  UploadFileImageData.fromJson(Map json) {
    data = json['data'] != null ? UploadFileImageDataResponse.fromJson(json['data']) : null;
  }

  UploadFileImageDataResponse? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class UploadFileImageDataResponse {
  UploadFileImageDataResponse({
    this.cleintsId,
    this.date,
    this.file,
    this.guid,
    this.image,
  });

  UploadFileImageDataResponse.fromJson(Map json) {
    cleintsId = json['cleints_id'];
    date = json['date'];
    file = json['file'];
    guid = json['guid'];
    image = json['image'];
  }

  String? cleintsId;
  String? date;
  String? file;
  String? guid;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cleints_id'] = cleintsId;
    map['date'] = date;
    map['file'] = file;
    map['guid'] = guid;
    map['image'] = image;
    return map;
  }
}
