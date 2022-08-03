import 'dart:convert';

class ResponseModel {
  ResponseModel({
    this.success,
    this.message,
    this.data,
    this.statusCode,
  });

  bool? success;
  String? message;
  dynamic data;
  int? statusCode;

  factory ResponseModel.fromRawJson(String str) => ResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    success: json["Success"],
    message: json["Message"],
    data: json["Data"],
    statusCode: json["StatusCode"],
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "Message": message,
    "Data": data,
    "StatusCode": statusCode,
  };
}