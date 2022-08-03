import 'package:json_annotation/json_annotation.dart';

part 'validation_error.g.dart';

@JsonSerializable(explicitToJson: true)
class ValidationError {
  @JsonKey(name: 'message')
  String? message;
  // @JsonKey(name: 'errors')
  // Errors? errors;

  ValidationError({this.message});

  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationErrorToJson(this);
}
