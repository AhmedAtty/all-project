import 'package:json_annotation/json_annotation.dart';

part 'data_response.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class DataResponse<T> {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'error')
  List<String>? error;
  @JsonKey(name: 'data')
  T? data;

  DataResponse({this.message, this.error, this.data});

  factory DataResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$DataResponseFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$DataResponseToJson(this, toJsonT);
}
