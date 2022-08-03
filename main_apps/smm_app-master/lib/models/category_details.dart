import 'package:json_annotation/json_annotation.dart';
import 'package:smm_app/models/service.dart';

part 'category_details.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryDetails {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'services')
  List<Service>? services;

  CategoryDetails(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.services});

  factory CategoryDetails.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryDetailsToJson(this);
}
