import 'package:logger/logger.dart';
import 'package:telegram_logger/src/core/models.dart';
import 'package:telegram_logger/src/web/client.dart';

class MessageRepository {
  final Client client;

  final BotParams bot;

  MessageRepository({
    required this.client,
    required this.bot,
  });

  Future<dynamic> sendMessage(
    String text,
  ) async {
    Logger().i('repo try');

    final result = await client.sendMessage(
      token: bot.botToken,
      message: MessageDto(
        chatId: bot.chatId,
        text: text,
      ),
    );
    Logger().i('repo success');

    return result;
  }
}
