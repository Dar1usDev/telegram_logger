class BotParams {
  /// Telegram bot token
  final String botToken;

  /// Telegram chat id
  final String chatId;

  /// Telegram thread id
  String? threadId;

  /// Additional info that's printed as a header for each message
  /// ex.:
  /// App version: x.y.z
  /// User id: 1234
  ///
  /// <message text>
  final Map<String, String?>? data;

  BotParams({
    required this.botToken,
    required this.chatId,
    this.data,
  }) {
    final id = chatId.split('_');
    if (id.length > 1) {
      threadId = id[1];
    }
  }
}
