part of '../telegram_logger.dart';

extension UtilMethods on TelegramLogger {
  /// Gets bot info | check connection
  Future<void> getBotInfo() async {
    try {
      final user = await _repository.getBotInfo();
      _debugLogger.i('Telegram bot info:\n${user.result}');
    } catch (ex, st) {
      _debugLogger.e('getBotInfo', er: ex, st: st);
    }
  }
}
