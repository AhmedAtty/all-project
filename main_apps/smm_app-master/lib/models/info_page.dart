import 'package:json_annotation/json_annotation.dart';

part 'info_page.g.dart';

@JsonSerializable(explicitToJson: true)
class InfoPage {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'data')
  String? data;

  InfoPage({this.id, this.data});

  factory InfoPage.fromJson(Map<String, dynamic> json) =>
      _$InfoPageFromJson(json);
  Map<String, dynamic> toJson() => _$InfoPageToJson(this);
}
