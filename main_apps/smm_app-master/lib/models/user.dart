import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'image')
  String? image;

  User(
      {this.id,
      this.firstName,
      this.email,
      this.phone,
      this.lastName,
      this.image});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
