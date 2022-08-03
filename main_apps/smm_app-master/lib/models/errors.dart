import 'package:json_annotation/json_annotation.dart';

part 'errors.g.dart';

@JsonSerializable(explicitToJson: true)
class Errors {
  @JsonKey(name: 'city')
  List<String>? city;
  @JsonKey(name: 'facility_type')
  List<String>? facilityType;
  @JsonKey(name: 'location')
  List<String>? location;
  @JsonKey(name: 'manager_name')
  List<String>? managerName;
  @JsonKey(name: 'manager_email')
  List<String>? managerEmail;
  @JsonKey(name: 'manage_phone')
  List<String>? managerPhone;
  @JsonKey(name: 'place_name')
  List<String>? placeName;
  @JsonKey(name: 'street_name')
  List<String>? streetName;
  @JsonKey(name: 'license')
  List<String>? license;

  Errors(
      this.city,
      this.facilityType,
      this.location,
      this.license,
      this.managerEmail,
      this.managerName,
      this.managerPhone,
      this.placeName,
      this.streetName);

  factory Errors.fromJson(dynamic json) => _$ErrorsFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorsToJson(this);
}
