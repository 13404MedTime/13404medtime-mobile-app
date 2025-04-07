import '../my_appointments/my_appointments_response.dart';

class FilesResponse {
  FilesResponse.fromJson(Map json) {
    files = json['data']['data']['response'] is List
        ? List.generate(
            (json['data']['data']['response'] as List).length,
            (index) => FileModel.fromJson((json['data']['data']['response'] as List)[index]),
          )
        : null;
  }

  List<FileModel>? files;
}

class FileModel {
  FileModel({
    this.createdDate,
    this.file,
    this.guid,
    this.naznachenieIdData,
    this.photo,
  });

  FileModel.fromJson(Map json) {
    createdDate = json['created_date'];
    file = json['file'];
    guid = json['guid'];
    photo = json['photo'];
    naznachenieIdData =
        json['naznachenie_id_data'] != null ? NaznachenieIdData.fromJson(json['naznachenie_id_data']) : null;
  }

  String? createdDate;
  String? file;
  String? guid;
  String? naznachenieId;
  NaznachenieIdData? naznachenieIdData;
  String? photo;
}
