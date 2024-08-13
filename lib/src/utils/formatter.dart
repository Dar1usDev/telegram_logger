import 'package:dio/dio.dart';

class Formatter {
  static String _printKV(String key, Object? value) => '$key: $value\n';

  static String _printIterableKV(Iterable<MapEntry> entry) {
    var msg = '';
    for (var entry in entry) {
      msg += '  ${_printKV(entry.key, entry.value)}';
    }
    return msg;
  }

  static String _printAll(msg) {
    var msg = '';
    msg.toString().split('\n').forEach((entry) {
      msg += entry;
    });
    return msg;
  }

  static String formatHeader({
    required Map<String, String?> data,
  }) {
    String header = '';
    data.forEach((String k, String? v) {
      header = '$header$k${v == null ? '' : ' :$v'}\n';
    });
    header = '$header\n';
    return header;
  }

  static String formatDioException({
    required DioException ex,
  }) {
    final options = ex.requestOptions;
    final response = ex.response!;
    final headers = response.headers.map.entries;

    final msg = '*** Request ***\n'
        '${_printKV('uri', options.uri)}'
        '${_printKV('method', options.method)}'
        '${_printKV('responseType', options.responseType.toString())}'
        '${_printKV('followRedirects', options.followRedirects)}'
        '${_printKV('persistentConnection', options.persistentConnection)}'
        '${_printKV('connectTimeout', options.connectTimeout)}'
        '${_printKV('sendTimeout', options.sendTimeout)}'
        '${_printKV('receiveTimeout', options.receiveTimeout)}'
        '${_printKV('receiveDataWhenStatusError', options.receiveDataWhenStatusError)}'
        '${_printKV('extra', options.extra)}'
        'headers:\n'
        '${_printIterableKV(options.headers.entries)}'
        'data:\n'
        '${_printAll(options.data)}'
        '\n\n*** Exception ***\n'
        '${_printKV('uri', options.uri)}'
        '${_printKV('statusCode', response.statusCode)}'
        '${(response.isRedirect) ? _printKV('redirect', response.realUri) : ''}'
        '${(headers.isNotEmpty) ? 'headers:\n${_printIterableKV(headers)}' : ''}'
        'response:\n'
        '$response'
        '\n\n*** StackTrace ***\n'
        '${ex.stackTrace}';

    return msg;
  }
}
