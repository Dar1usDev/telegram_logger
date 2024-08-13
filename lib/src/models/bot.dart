class BotParams {
  /// Telegram bot token
  final String botToken;

  /// Telegram chat id
  final String chatId;

  /// Telegram thread id
  String? threadId;

  BotParams({
    required this.botToken,
    required this.chatId,
  }) {
    final id = chatId.split('_');
    if (id.length > 1) {
      threadId = id[1];
    }
  }
}
