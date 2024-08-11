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

@JsonSerializable()
class UserDto {
  final String id;
  @JsonKey(name: 'is_bot')
  final bool isBot;
  final String? username;

  UserDto(
    this.id,
    this.isBot,
    this.username,
  );

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @override
  String toString() => toJson().toString();
}

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
