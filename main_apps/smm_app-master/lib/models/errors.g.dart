// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Errors _$ErrorsFromJson(Map<String, dynamic> json) => Errors(
      (json['city'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['facility_type'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['location'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['license'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['manager_email'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['manager_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['manage_phone'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['place_name'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['street_name'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'city': instance.city,
      'facility_type': instance.facilityType,
      'location': instance.location,
      'manager_name': instance.managerName,
      'manager_email': instance.managerEmail,
      'manage_phone': instance.managerPhone,
      'place_name': instance.placeName,
      'street_name': instance.streetName,
      'license': instance.license,
    };
