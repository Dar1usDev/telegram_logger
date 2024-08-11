import 'package:telegram_logger/src/core/models.dart';
import 'package:telegram_logger/src/web/client.dart';

class MessageRepository {
  final Client client;

  final BotParams bot;

  MessageRepository({
    required this.client,
    required this.bot,
  });

  Future<UserDto> getBotInfo() => client.getBotInfo(token: bot.botToken);

  Future<void> sendMessage(
    String text,
  ) async {
    await client.sendMessage(
      token: bot.botToken,
      message: MessageDto(
        chatId: bot.chatId,
        text: text,
      ),
    );
  }
}
