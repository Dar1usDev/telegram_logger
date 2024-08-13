import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

/// Sending message dto
@JsonSerializable(createFactory: false)
class MessageDto {
  @JsonKey(name: 'chat_id')
  final String chatId;
  final String text;
  @JsonKey(name: 'message_thread_id')
  final String? threadId;

  MessageDto({
    required this.chatId,
    required this.text,
    this.threadId,
  });

  Map<String, dynamic> toJson() => _$MessageDtoToJson(this);
}

/// Telegram Message dto
@JsonSerializable()
class ResponseMessageDto {
  @JsonKey(name: 'message_id')
  final String messageId;
  @JsonKey(name: 'date')
  final int dateInUnix;
  final String? text;

  ResponseMessageDto(
    this.messageId,
    this.dateInUnix,
    this.text,
  );

  factory ResponseMessageDto.fromJson(Map<String, dynamic> json) =>
      _$ResponseMessageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseMessageDtoToJson(this);

  @override
  String toString() => toJson().toString();
}
