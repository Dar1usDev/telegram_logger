library telegram_logger;

import 'dart:math';

import 'package:dio/dio.dart';
import 'package:telegram_logger/src/core/models.dart';
import 'package:telegram_logger/src/utils/debug_logger.dart';
import 'package:telegram_logger/src/utils/formatter.dart';
import 'package:telegram_logger/src/web/client.dart';
import 'package:telegram_logger/src/web/repository.dart';

part 'telegram_api/send_methods.dart';
part 'telegram_api/util_methods.dart';

class TelegramLogger {
  /// Telegram params
  late final BotParams _bot;

  /// Repository with available Telegram API methods
  late final MessageRepository _repository;

  /// Console logger
  late final DebugLogger _debugLogger;

  /// If [true] log debug info to console
  /// [False] by default
  final bool printResponses;

  /// If [true] log debug info to console
  /// [True] by default
  final bool printErrors;

  /// Request connect/receive/send timeout
  /// Default's 120000ms = 30s
  final int timeoutTimeMilliseconds;

  TelegramLogger({
    /// Telegram bot token
    required String botToken,

    /// Telegram chat id
    required String chatId,
    this.printResponses = false,
    this.printErrors = true,
    this.timeoutTimeMilliseconds = 120000,
  }) {
    _bot = BotParams(botToken: botToken, chatId: chatId);

    final dio = DioFactory.newInstance(timeoutTimeMilliseconds: timeoutTimeMilliseconds);
    final client = Client(dio);
    _repository = MessageRepository(client: client, bot: _bot);

    _debugLogger = DebugLogger(printResponses, printErrors);
  }
}
