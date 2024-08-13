part of '../telegram_logger.dart';

extension SendMethods on TelegramLogger {
  /// Sends text
  Future<void> sendText(String text) async {
    final header = data == null ? '' : Formatter.formatHeader(data: data!);
    await _sendMessage('$header$text');
  }

  /// Sends formatted DioException
  Future<void> sendDioException(DioException ex) async {
    final header = data == null ? '' : Formatter.formatHeader(data: data!);
    await _sendMessage('$header${Formatter.formatDioException(ex: ex)}');
  }

  /// Splits text by 4096 symbols and sends it
  Future<void> _sendMessage(String text) async {
    const maxMessageLength = 4096;
    for (var i = 0; i < text.length; i += maxMessageLength) {
      final msgForTelegram = text.substring(i, min(i + maxMessageLength, text.length));
      try {
        final response = await _repository.sendMessage(msgForTelegram);
        _debugLogger.i('Message:\n${response.result}');
      } catch (ex, st) {
        _debugLogger.e('Send message error', er: ex, st: st);
        await sendDioException(ex as DioException);
      }
    }
  }
}
