import 'package:logger/logger.dart';

class DebugLogger {
  late final Logger _logger;

  /// If [true] log debug info to console
  final bool printResponses;

  /// If [true] log debug info to console
  final bool printErrors;

  DebugLogger(
    this.printResponses,
    this.printErrors,
  ) {
    _logger = Logger();
  }

  /// Logs info
  void i(String text) {
    if (!printResponses) {
      return;
    }
    _logger.i(text);
  }

  /// Logs error
  void e(String text, {Object? er, StackTrace? st}) {
    if (!printErrors) {
      return;
    }
    _logger.e(text, error: er, stackTrace: st);
  }
}
