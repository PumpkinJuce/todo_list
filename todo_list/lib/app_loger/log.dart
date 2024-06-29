import 'package:logger/logger.dart';

class Log {
  static final _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 1,
      colors: true,
      printEmojis: true,
    ),
  );

  static void error(dynamic message, {StackTrace? trace}) {
    _logger.e(message, stackTrace: trace ?? StackTrace.current);
  }

  static void warnng(dynamic message, {StackTrace? trace}) {
    _logger.w(message, stackTrace: trace);
  }

  static void info(dynamic message) {
    _logger.i(message);
  }
}
