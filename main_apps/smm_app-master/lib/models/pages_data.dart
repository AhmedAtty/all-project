import 'package:json_annotation/json_annotation.dart';
import 'package:smm_app/models/info_page.dart';

part 'pages_data.g.dart';

@JsonSerializable(explicitToJson: true)
class PagesData {
  @JsonKey(name: 'data')
  List<InfoPage>? data;

  PagesData({this.data});

  factory PagesData.fromJson(Map<String, dynamic> json) =>
      _$PagesDataFromJson(json);

  Map<String, dynamic> toJson() => _$PagesDataToJson(this);
}
