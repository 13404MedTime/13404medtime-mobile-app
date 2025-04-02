class AnalysisSurveyHomeResponse {
  AnalysisSurveyHomeResponse({
    this.status,
    this.description,
    this.data,
  });

  AnalysisSurveyHomeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? status;
  String? description;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['description'] = description;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.tableSlug,
    this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? AnalysisSurveyHomeData.fromJson(json['data']) : null;
  }

  String? tableSlug;
  AnalysisSurveyHomeData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['table_slug'] = tableSlug;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class AnalysisSurveyHomeData {
  AnalysisSurveyHomeData({
    this.count,
  });

  AnalysisSurveyHomeData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  num? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    return map;
  }
}
