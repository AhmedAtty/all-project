import 'package:json_annotation/json_annotation.dart';

part 'support_request.g.dart';

@JsonSerializable(explicitToJson: true)
class SupportRequest {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'message')
  String? message;

  SupportRequest({this.name, this.email, this.phone, this.message});

  factory SupportRequest.fromJson(Map<String, dynamic> json) =>
      _$SupportRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SupportRequestToJson(this);
}
