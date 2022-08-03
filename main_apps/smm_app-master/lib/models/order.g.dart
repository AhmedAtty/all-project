// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      serviceId: json['service_id'] as int?,
      paymentId: json['payment_id'] as int?,
      qty: json['qty'] as int?,
      total: json['total'] as int?,
      price: json['price'] as int?,
      status: json['status'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      service: json['service'] == null
          ? null
          : Service.fromJson(json['service'] as Map<String, dynamic>),
      serviceStatus: json['service_status'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'service_id': instance.serviceId,
      'payment_id': instance.paymentId,
      'qty': instance.qty,
      'total': instance.total,
      'price': instance.price,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'service': instance.service?.toJson(),
      'service_status': instance.serviceStatus,
    };
