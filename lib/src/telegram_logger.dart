library telegram_logger;

import 'dart:math';

import 'package:dio/dio.dart';
import 'package:telegram_logger/src/models/params.dart';
import 'package:telegram_logger/src/utils/debug_logger.dart';
import 'package:telegram_logger/src/utils/filters.dart';
import 'package:telegram_logger/src/utils/formatter.dart';
import 'package:telegram_logger/src/web/client.dart';
import 'package:telegram_logger/src/web/repository.dart';

part 'extensions/send_methods.dart';
part 'extensions/util_methods.dart';

class TelegramLogger {
  /// Telegram params
  late final BotParams _bot;

  /// Additional logger params
  late final LoggerParams _loggerParams;

  /// Repository with available Telegram API methods
  late final MessageRepository _repository;

  /// Console logger
  late final DebugLogger _debugLogger;

  /// Telegram bot token
  final String botToken;

  /// Telegram chat id (ex. -1001234567890)
  /// Can include thread id {ex. chatId_1234}
  final String chatId;

  /// Additional info that's printed as a header for each message
  /// ex.:
  /// App version: x.y.z
  /// User id: 1234
  ///
  /// <message text>
  final Map<String, String?>? data;

  /// If [True], log responses to console
  /// [False] by default
  final bool printResponses;

  /// If [True], log errors to console
  /// [True] by default
  final bool printErrors;

  /// Request connect/receive/send timeout
  /// Default's 120000ms = 30s
  final int timeoutTimeMilliseconds;

  /// List of filters for DioExceptions
  final Set<DioExceptionFilter> dioFilters;

  TelegramLogger({
    required this.botToken,
    required this.chatId,
    this.data,
    this.printResponses = false,
    this.printErrors = true,
    this.timeoutTimeMilliseconds = 120000,
    this.dioFilters = const {},
  }) {
    _bot = BotParams(botToken: botToken, chatId: chatId);

    _loggerParams = LoggerParams(data: data, dioFilters: dioFilters);

    final dio = DioFactory.newInstance(timeoutTimeMilliseconds: timeoutTimeMilliseconds);
    final client = Client(dio);
    _repository = MessageRepository(client: client, bot: _bot);

    _debugLogger = DebugLogger(printResponses, printErrors);
  }
}
