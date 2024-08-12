import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

class BotParams {
  /// Telegram bot token
  final String botToken;

  /// Telegram chat id
  final String chatId;

  const BotParams({
    required this.botToken,
    required this.chatId,
  });
}

/// Sending message dto
@JsonSerializable(createFactory: false)
class MessageDto {
  @JsonKey(name: 'chat_id')
  final String chatId;
  final String text;

  MessageDto({
    required this.chatId,
    required this.text,
  });

  Map<String, dynamic> toJson() => _$MessageDtoToJson(this);
}

/// Telegram API response dto
@JsonSerializable()
class ResponseDto {
  final bool ok;
  final String? description;
  @JsonKey(name: 'error_code')
  final int? errorCode;
  final String? result;

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

/// Telegram User dto
@JsonSerializable()
class UserDto {
  final String id;
  @JsonKey(name: 'is_bot')
  final bool isBot;
  @JsonKey(name: 'first_name')
  final String firstname;
  final String? username;

  UserDto(
    this.id,
    this.isBot,
    this.firstname,
    this.username,
  );

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @override
  String toString() => toJson().toString();
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
