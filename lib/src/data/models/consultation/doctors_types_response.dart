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
    this.descriptionUz,
    this.guid,
    this.icon,
  });

  DoctorTypeModel.fromJson(Map json) {
    categoryName = json['category_name'];
    categoryNameUz = json['category_name_uz'];
    description = json['description'];
    descriptionUz = json['description_uz'];
    guid = json['guid'];
    icon = json['icon'];
  }

  String? categoryName;
  String? categoryNameUz;
  String? description;
  String? descriptionUz;
  String? guid;
  String? icon;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorTypeModel &&
          runtimeType == other.runtimeType &&
          categoryName == other.categoryName &&
          categoryNameUz == other.categoryNameUz &&
          description == other.description &&
          descriptionUz == other.descriptionUz &&
          guid == other.guid &&
          icon == other.icon;

  @override
  int get hashCode =>
      categoryName.hashCode ^
      description.hashCode ^
      categoryNameUz.hashCode ^
      guid.hashCode ^
      descriptionUz.hashCode ^
      icon.hashCode;
}
