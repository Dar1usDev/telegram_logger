import 'package:logger/logger.dart';
import 'package:telegram_logger/src/core/models.dart';
import 'package:telegram_logger/src/web/client.dart';
import 'package:telegram_logger/src/web/repository.dart';

class TelegramLogger {
  /// Telegram params
  late final BotParams _bot;

  /// Repository with available Telegram API methods
  late final MessageRepository repository;

  /// Request connect/receive/send timeout
  /// Default's 120000ms = 30s
  final int timeoutTimeMilliseconds;

  /// Console logger
  late final Logger debugLogger;

  TelegramLogger({
    /// Telegram bot token
    required String botToken,

    /// Telegram chat id
    required String chatId,
    this.timeoutTimeMilliseconds = 120000,
  }) {
    _bot = BotParams(botToken: botToken, chatId: chatId);

    final dio = DioFactory.newInstance(timeoutTimeMilliseconds: timeoutTimeMilliseconds);
    final client = Client(dio);
    repository = MessageRepository(client: client, bot: _bot);

    debugLogger = Logger();
  }
}
