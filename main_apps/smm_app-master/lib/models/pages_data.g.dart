// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pages_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagesData _$PagesDataFromJson(Map<String, dynamic> json) => PagesData(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => InfoPage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PagesDataToJson(PagesData instance) => <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
