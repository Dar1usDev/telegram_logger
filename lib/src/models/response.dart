// Telegram API response dto
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class ResponseDto {
  final bool ok;
  final String? description;
  @JsonKey(name: 'error_code')
  final int? errorCode;
  final Map<String, dynamic>? result;

  ResponseDto(
    this.ok,
    this.description,
    this.errorCode,
    this.result,
  );

  factory ResponseDto.fromJson(Map<String, dynamic> json) => _$ResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDtoToJson(this);

  @override
  String toString() => toJson().toString();
}
