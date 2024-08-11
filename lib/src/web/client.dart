import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:telegram_logger/src/core/models.dart';

part 'client.g.dart';

@RestApi()
abstract class Client {
  factory Client(Dio dio) = _Client;

  @POST('bot{token}/sendMessage')
  Future<dynamic> sendMessage({
    @Path('token') required String token,
    @Body() required MessageDto message,
  });

// await http.post(
//   Uri.parse(
//     'https://api.telegram.org/bot$_botToken/sendMessage',
//   ),
//   body: {
//     'chat_id': '',
//     'text': text,
//   },
// );
}

class DioFactory {
  static Dio newInstance({
    required int timeoutTimeMilliseconds,
  }) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: Duration(milliseconds: timeoutTimeMilliseconds),
        receiveTimeout: Duration(milliseconds: timeoutTimeMilliseconds),
        sendTimeout: Duration(milliseconds: timeoutTimeMilliseconds),
        receiveDataWhenStatusError: true,
      ),
    );

    dio.options.baseUrl = 'https://api.telegram.org/';

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return dio;
  }
}
