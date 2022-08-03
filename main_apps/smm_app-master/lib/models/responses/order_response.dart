import 'package:json_annotation/json_annotation.dart';

part 'order_response.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderResponse {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'code')
  int? code;
  @JsonKey(name: 'total')
  int? total;

  OrderResponse({this.message, this.code, this.total});

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}
