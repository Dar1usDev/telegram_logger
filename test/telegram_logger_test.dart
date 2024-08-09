import 'package:flutter_test/flutter_test.dart';
import 'package:telegram_logger/src/telegram_logger.dart';

void main() {
  test('test log', () {
    const botKey = '6775786476:AAGMSn9Buklx0o5YQkAnliAZYJT3S2iay6';
    // https://t.me/c/2198841658/2
    const chatId = '2198841658_2';

    final logger = TelegramLogger(botToken: botKey, chatId: chatId);

    logger.sendText('Hello');
  });
}
