class UploadFileImageRequest {
  UploadFileImageRequest({
    this.data,
  });

  UploadFileImageRequest.fromJson(json) {
    data = json['data'] != null ? UploadFileImageDataRequest.fromJson(json['data']) : null;
  }

  UploadFileImageDataRequest? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class UploadFileImageDataRequest {
  UploadFileImageDataRequest({
    this.cleintsId,
    this.fileTitle,
    this.file,
    this.image,
  });

  UploadFileImageDataRequest.fromJson(json) {
    cleintsId = json['cleints_id'];
    cleintsId = json['flie_title'];
    file = json['file'];
    image = json['image'];
  }

  String? cleintsId;
  String? fileTitle;
  String? file;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cleints_id'] = cleintsId;
    map['flie_title'] = fileTitle;
    map['file'] = file;
    map['image'] = image;
    return map;
  }
}
