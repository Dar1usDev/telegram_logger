// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDto _$ResponseDtoFromJson(Map<String, dynamic> json) => ResponseDto(
      json['ok'] as bool,
      json['description'] as String?,
      (json['error_code'] as num?)?.toInt(),
      json['result'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ResponseDtoToJson(ResponseDto instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'description': instance.description,
      'error_code': instance.errorCode,
      'result': instance.result,
    };
