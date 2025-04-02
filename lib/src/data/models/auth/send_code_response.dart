import 'package:flutter/foundation.dart';

@immutable
class SendCodeResponse {
  const SendCodeResponse({
    this.status,
    this.description,
    this.data,
    this.message,
  });

  factory SendCodeResponse.fromJson(Map<String, dynamic> json) => SendCodeResponse(
        status: json['message'],
        description: json['error'],
        data: json['data'] is Map ? json['data'] : {},
        message: json['data'] is String ? json['data'] : '',
      );
  final String? status;
  final String? description;
  final Map<String, dynamic>? data;
  final String? message;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SendCodeResponse &&
        other.status == status &&
        other.description == description &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ description.hashCode ^ data.hashCode;

  @override
  String toString() => 'SendCodeResponse{status: $status, description: $description, data: $data, message: $message}';
}
