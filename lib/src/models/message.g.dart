// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$MessageDtoToJson(MessageDto instance) =>
    <String, dynamic>{
      'chat_id': instance.chatId,
      'text': instance.text,
      'message_thread_id': instance.threadId,
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
