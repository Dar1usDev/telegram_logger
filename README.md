Implementation of some Telegram API methods for logging to Telegram bots

## Features

- Supports text and DioException formatting
- Supports Telegram chats and threads

## Getting started

Add lines like this to your package's pubspec.yaml (and run an implicit flutter pub get):

```
dependencies:
    telegram_logger:
        git:
            url: https://github.com/Dar1usDev/telegram_logger.git
            ref: <commit>|<branch name>
```

## Usage

Usage example:

```
final botToken = 'botToken';
final chatId = '-1001234567890_1';
final data = {'App version': 'x.y.z', 'User id': 'User1234567890'};

final logger = TelegramLogger(botToken: botToken, chatId: chatId, data: data);

await logger.sendText('Message');
```

Thread id can be passed with _chatId_ after an underscore.

## Additional information
