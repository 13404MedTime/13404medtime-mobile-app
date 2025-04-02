class SendCodeRequest {
  SendCodeRequest({
    this.recipient,
    this.text,
    this.type,
  });

  SendCodeRequest.fromJson(json) {
    recipient = json['recipient'];
    text = json['text'];
    type = json['type'];
  }

  String? recipient;
  String? text;
  String? type;

  Map<String, dynamic> toJson() => {
        'recipient': recipient,
        'text': text,
        'type': type,
      };
}
