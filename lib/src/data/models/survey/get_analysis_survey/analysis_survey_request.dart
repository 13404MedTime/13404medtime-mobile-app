class AnalysisSurveyRequest {
  AnalysisSurveyRequest({
    this.data,
  });

  AnalysisSurveyRequest.fromJson(json) {
    data = json['data'] != null ? AnalysisSurveyDataRequest.fromJson(json['data']) : null;
  }

  AnalysisSurveyDataRequest? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class AnalysisSurveyDataRequest {
  AnalysisSurveyDataRequest({
    this.cleintsId,
    this.order,
  });

  AnalysisSurveyDataRequest.fromJson(json) {
    cleintsId = json['cleints_id'];
    order = json['order'] != null ? AnalysisSurveyOrderRequest.fromJson(json['order']) : null;
  }

  String? cleintsId;
  AnalysisSurveyOrderRequest? order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cleints_id'] = cleintsId;
    if (order != null) {
      map['order'] = order?.toJson();
    }
    return map;
  }
}

class AnalysisSurveyOrderRequest {
  AnalysisSurveyOrderRequest({
    this.createdAt,
  });

  AnalysisSurveyOrderRequest.fromJson(json) {
    createdAt = json['createdAt'];
  }

  num? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    return map;
  }
}
