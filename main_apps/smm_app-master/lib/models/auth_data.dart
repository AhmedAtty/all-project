import 'package:json_annotation/json_annotation.dart';
import 'package:smm_app/models/user.dart';

part 'auth_data.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthData {
  @JsonKey(name: 'token')
  String? token;
  @JsonKey(name: 'user')
  User? user;

  AuthData({this.token, this.user});

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);
  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}
