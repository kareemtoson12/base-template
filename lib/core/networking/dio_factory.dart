import 'package:dio/dio.dart';

class DioFactory {
  // Private constructor
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (_dio == null) {
      _dio = Dio();
      _dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      // Add a logger to see requests and responses in console
      _dio!.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      );

      return _dio!;
    } else {
      return _dio!;
    }
  }
}
