import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:todo_list/app_http_client/interceptors/auth_interceptor.dart';
import 'package:todo_list/app_http_client/interceptors/logging_interceptor.dart';

class AppHttpClient with DioMixin implements Dio {
  AppHttpClient() {
    options = _baseOptions;

    interceptors.add(AuthInterceptor('Valimar'));
    interceptors.add(LoggingInterceptor());

    httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
        return client;
      },
    );
  }

  static const _baseUrl = 'https://beta.mrdekk.ru/todo';
  static const _connectTimeout = Duration(seconds: 20);
  static const _receiveTimeout = Duration(seconds: 20);

  BaseOptions get _baseOptions {
    return BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }
}
