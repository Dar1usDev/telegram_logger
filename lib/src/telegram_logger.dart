import 'dart:math';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:telegram_logger/src/core/models.dart';
import 'package:telegram_logger/src/utils/formatter.dart';
import 'package:telegram_logger/src/web/client.dart';
import 'package:telegram_logger/src/web/repository.dart';

class TelegramLogger {
  /// Telegram params
  late final BotParams _bot;

  late final MessageRepository repository;

  /// Request connect/receive/send timeout
  /// Default's 120000ms = 30s
  final int timeoutTimeMilliseconds;

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

  Future<void> sendText(String text) async {
    await _sendSplittedMessage(text);
  }

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
