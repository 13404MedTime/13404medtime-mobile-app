class AnalysisSurveyHomeRequest {
  AnalysisSurveyHomeRequest({
    this.data,
  });

  AnalysisSurveyHomeRequest.fromJson(json) {
    data = json['data'] != null ? AnalysisSurveyHomeDataRequest.fromJson(json['data']) : null;
  }

  AnalysisSurveyHomeDataRequest? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class AnalysisSurveyHomeDataRequest {
  AnalysisSurveyHomeDataRequest({
    this.cleintsId,
    this.order,
  });

  AnalysisSurveyHomeDataRequest.fromJson(json) {
    cleintsId = json['cleints_id'];
    order = json['order'] != null ? AnalysisSurveyHomeOrderRequest.fromJson(json['order']) : null;
  }

  String? cleintsId;
  AnalysisSurveyHomeOrderRequest? order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cleints_id'] = cleintsId;
    if (order != null) {
      map['order'] = order?.toJson();
    }
    return map;
  }
}

class AnalysisSurveyHomeOrderRequest {
  AnalysisSurveyHomeOrderRequest({
    this.createdAt,
  });

  AnalysisSurveyHomeOrderRequest.fromJson(json) {
    createdAt = json['createdAt'];
  }

  num? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    return map;
  }
}
