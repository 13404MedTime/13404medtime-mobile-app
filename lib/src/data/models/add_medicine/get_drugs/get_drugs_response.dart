class DrugsResponse {
  DrugsResponse({this.drugs});

  DrugsResponse.fromJson(json) {
    drugs = json['data']['data']['response'] is List
        ? List.generate((json['data']['data']['response'] as List).length,
            (index) => DrugModel.fromJson((json['data']['data']['response'] as List)[index]))
        : [];
  }

  List<DrugModel>? drugs;
}

class DrugModel {
  DrugModel({
    this.name,
    this.dosageForm,
    this.guid,
  });

  DrugModel.fromJson(json) {
    name = json['brand_name'];
    dosageForm = json['dosage_form'];
    guid = json['guid'];
  }

  String? name;
  String? dosageForm;
  String? guid;
}
