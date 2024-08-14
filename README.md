Implementation of some Telegram API methods for logging to Telegram bots

## Features

- Supports text and DioException formatting
- Supports Telegram chats and threads

## Getting started

Add lines like these to your package's pubspec.yaml (and run an implicit flutter pub get):

```
dependencies:
    telegram_logger:
        git:
            url: https://<...>/telegram_logger.git
            ref: <commit>|<branch name>
```

## Usage

Usage example:

```
final botToken = 'botToken';
final chatId = '-1001234567890_1';
final data = {'App version': 'x.y.z', 'User id': 'User1234567890'};

final logger = TelegramLogger(
      botToken: botToken,
      chatId: chatId,
      data: data,
      dioFilters: {
        DioExceptionFilter.codes400,
        DioExceptionFilter.responseIsNull,
      },
    );

await logger.sendText('Message');
await logger.sendDioException(DioException(<...>));
```

Thread id can be passed with _chatId_ after an underscore.

## Additional information
![image](https://github.com/user-attachments/assets/e69eeca1-9e6e-40a3-959f-79dabc755ede)

