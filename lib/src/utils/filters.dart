import 'package:dio/dio.dart';

enum DioExceptionFilter {
  responseIsNull,
  codes400;
}

class Filter {
  /// Returns [True] if [exception] matches any of filters
  static bool checkDioException({
    required DioException exception,
    required Set<DioExceptionFilter> filters,
  }) {
    for (var filter in filters) {
      switch (filter) {
        case DioExceptionFilter.responseIsNull:
          if (exception.response == null) {
            return true;
          }
        case DioExceptionFilter.codes400:
          if ('${exception.response?.statusCode}'.startsWith('4')) {
            return true;
          }
      }
    }
    return false;
  }
}
