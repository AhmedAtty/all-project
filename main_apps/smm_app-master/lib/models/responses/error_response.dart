import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ErrorResponse {
  @JsonKey(name: 'message')
  String? error;

  ErrorResponse({this.error});

  factory ErrorResponse.fromJson(dynamic json) => _$ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
