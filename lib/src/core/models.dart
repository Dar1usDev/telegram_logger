import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

class BotParams {
  /// Telegram bot token
  final String botToken;

  /// Telegram bot token
  final String chatId;

  const BotParams({
    required this.botToken,
    required this.chatId,
  });
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
