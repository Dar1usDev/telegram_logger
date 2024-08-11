import 'dart:math';

import 'package:dio/dio.dart';
import 'package:telegram_logger/src/telegram_logger.dart';
import 'package:telegram_logger/src/utils/formatter.dart';

extension SendMethods on TelegramLogger {
  /// Sends text
  Future<void> sendText(String text) async {
    await _sendSplittedMessage(text);
  }

  /// Sends formatted DioException
  Future<void> sendDioException({required DioException ex}) async {
    await _sendSplittedMessage(Formatter.formatDioException(ex: ex));
  }

  Future<void> _sendSplittedMessage(String text) async {
    const maxMessageLength = 4096;
    for (var i = 0; i < text.length; i += maxMessageLength) {
      final msgForTelegram = text.substring(i, min(i + maxMessageLength, text.length));
      await _sendMessage(msgForTelegram);
    }
  }

  Future<void> _sendMessage(String text) async {
    try {
      await repository.sendMessage(text);
    } catch (ex, st) {
      debugLogger.e('tg logging error', error: ex, stackTrace: st);
    }
  }
}
