import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterRequest {
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'password')
  String? password;

  RegisterRequest({this.firstName, this.lastName, this.email, this.password});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
