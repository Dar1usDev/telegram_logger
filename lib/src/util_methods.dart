import 'package:telegram_logger/src/telegram_logger.dart';

extension UtilMethods on TelegramLogger {
  /// Gets bot info | check connection
  Future<void> getBotInfo() async {
    try {
      final user = await repository.getBotInfo();
      debugLogger.i('Telegram bot info:\n$user');
    } catch (ex, st) {
      debugLogger.e('tg logging error', error: ex, stackTrace: st);
    }
  }
}
