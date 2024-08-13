// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$MessageDtoToJson(MessageDto instance) =>
    <String, dynamic>{
      'chat_id': instance.chatId,
      'text': instance.text,
    };

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

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      json['id'] as String,
      json['is_bot'] as bool,
      json['first_name'] as String,
      json['username'] as String?,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'is_bot': instance.isBot,
      'first_name': instance.firstname,
      'username': instance.username,
    };

ResponseMessageDto _$ResponseMessageDtoFromJson(Map<String, dynamic> json) =>
    ResponseMessageDto(
      json['message_id'] as String,
      (json['date'] as num).toInt(),
      json['text'] as String?,
    );

Map<String, dynamic> _$ResponseMessageDtoToJson(ResponseMessageDto instance) =>
    <String, dynamic>{
      'message_id': instance.messageId,
      'date': instance.dateInUnix,
      'text': instance.text,
    };
