import 'package:telegram_logger/src/core/models.dart';
import 'package:telegram_logger/src/web/client.dart';

class MessageRepository {
  final Client client;

  final BotParams bot;

  MessageRepository({
    required this.client,
    required this.bot,
  });

  Future<ResponseDto> getBotInfo() => client.getBotInfo(token: bot.botToken);

  Future<ResponseDto> sendMessage(
    String text,
  ) =>
      client.sendMessage(
        token: bot.botToken,
        message: MessageDto(
          chatId: bot.chatId,
          threadId: bot.threadId,
          text: text,
        ),
      );
}
