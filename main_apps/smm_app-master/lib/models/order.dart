import 'package:json_annotation/json_annotation.dart';
import 'package:smm_app/models/service.dart';

part 'order.g.dart';

@JsonSerializable(explicitToJson: true)
class Order {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'service_id')
  int? serviceId;
  @JsonKey(name: 'payment_id')
  int? paymentId;
  @JsonKey(name: 'qty')
  int? qty;
  @JsonKey(name: 'total')
  int? total;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'service')
  Service? service;
  @JsonKey(name: 'service_status')
  String? serviceStatus;

  Order(
      {this.id,
      this.userId,
      this.serviceId,
      this.paymentId,
      this.qty,
      this.total,
      this.price,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.service,
      this.serviceStatus});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
