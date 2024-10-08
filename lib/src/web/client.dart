import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:telegram_logger/src/models/message.dart';
import 'package:telegram_logger/src/models/response.dart';

part 'client.g.dart';

@RestApi()
abstract class Client {
  factory Client(Dio dio) = _Client;

  @GET('bot{token}/getMe')
  Future<ResponseDto> getBotInfo({
    @Path('token') required String token,
  });

  @POST('bot{token}/sendMessage')
  Future<ResponseDto> sendMessage({
    @Path('token') required String token,
    @Body() required MessageDto message,
  });
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
