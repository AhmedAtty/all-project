// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) =>
    CreateOrderRequest(
      serviceId: json['service_id'] as int?,
      paymentId: json['payment_id'] as String?,
      qty: json['qty'] as int?,
    );

Map<String, dynamic> _$CreateOrderRequestToJson(CreateOrderRequest instance) =>
    <String, dynamic>{
      'service_id': instance.serviceId,
      'payment_id': instance.paymentId,
      'qty': instance.qty,
    };
