class DoctorsTypesResponse {
  DoctorsTypesResponse({
    this.doctorsTypes,
  });

  DoctorsTypesResponse.fromJson(Map<String, dynamic> json) {
    doctorsTypes = json['data']['data']['response'] is List
        ? List.generate(
            ((json['data']['data']['response'] as List?) ?? []).length,
            (index) => DoctorTypeModel.fromJson(
              (json['data']['data']['response'] as List)[index],
            ),
          )
        : null;
  }

  Map<String, dynamic> toJson() => {};

  List<DoctorTypeModel>? doctorsTypes;
}

class DoctorTypeModel {
  DoctorTypeModel({
    this.categoryName,
    this.description,
    this.categoryNameEng,
    this.categoryNameUz,
    this.descriptionUz,
    this.descriptionEng,
    this.guid,
    this.icon,
  });

  DoctorTypeModel.fromJson(Map json) {
    categoryName = json['category_name'];
    categoryNameUz = json['category_name_uz'];
    categoryNameEng = json['category_name_eng'];
    description = json['description'];
    descriptionUz = json['description_uz'];
    descriptionEng = json['description_eng'];
    guid = json['guid'];
    icon = json['icon'];
  }

  String? categoryName;
  String? categoryNameEng;
  String? categoryNameUz;
  String? description;
  String? descriptionUz;
  String? descriptionEng;
  String? guid;
  String? icon;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorTypeModel &&
          runtimeType == other.runtimeType &&
          categoryName == other.categoryName &&
          categoryNameUz == other.categoryNameUz &&
          categoryNameEng == other.categoryNameEng &&
          description == other.description &&
          descriptionUz == other.descriptionUz &&
          descriptionEng == other.descriptionEng &&
          guid == other.guid &&
          icon == other.icon;

  @override
  int get hashCode =>
      categoryName.hashCode ^
      description.hashCode ^
      categoryNameUz.hashCode ^
      categoryNameEng.hashCode ^
      guid.hashCode ^
      descriptionUz.hashCode ^
      descriptionEng.hashCode ^
      icon.hashCode;
}
