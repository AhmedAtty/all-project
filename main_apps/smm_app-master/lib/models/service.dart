import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable(explicitToJson: true)
class Service {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'currancy')
  String? currency;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'cat_id')
  int? catId;
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'cat_name')
  String? catName;
  @JsonKey(name: 'price_after')
  int? priceAfter;

  Service(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.currency,
      this.image,
      this.catId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.catName,
      this.priceAfter});

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
