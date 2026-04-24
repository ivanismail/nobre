// To parse this JSON data, do
//
//     final statusRes = statusResFromMap(jsonString);

import 'dart:convert';

class MessageResModel {
  MessageResModel({
    this.message,
  });

  String? message;

  factory MessageResModel.fromJson(String str) =>
      MessageResModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MessageResModel.fromMap(Map<String, dynamic> json) => MessageResModel(
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
      };
}
