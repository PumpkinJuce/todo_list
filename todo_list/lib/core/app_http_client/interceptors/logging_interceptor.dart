import 'package:dio/dio.dart';
import 'package:todo_list/core/app_loger/log.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Log.error(err.message, trace: err.stackTrace);

    super.onError(err, handler);
  }
}
