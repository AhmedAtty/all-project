import 'package:json_annotation/json_annotation.dart';

part 'create_order_request.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateOrderRequest {
  @JsonKey(name: 'service_id')
  int? serviceId;
  @JsonKey(name: 'payment_id')
  String? paymentId;
  @JsonKey(name: 'qty')
  int? qty;

  CreateOrderRequest({this.serviceId, this.paymentId, this.qty});

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateOrderRequestToJson(this);
}
