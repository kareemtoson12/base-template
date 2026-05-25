import 'package:dio/dio.dart';

/// Extension on [DioException] to convert Dio errors into user-friendly string messages
extension DioErrorExtension on DioException {
  String get errorMessage {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout with API server';
      case DioExceptionType.sendTimeout:
        return 'Send timeout with API server';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout with API server';
      case DioExceptionType.badCertificate:
        return 'Bad certificate';
      case DioExceptionType.badResponse:
        return _handleResponseError(response);
      case DioExceptionType.cancel:
        return 'Request to API server was cancelled';
      case DioExceptionType.connectionError:
        return 'No internet connection';
      case DioExceptionType.unknown:
        return 'Unexpected error occurred';
    }
  }

  String _handleResponseError(Response? response) {
    if (response == null) {
      return 'Unknown error from server';
    }

    final data = response.data;

    // Adjust this based on your API's standard error response format.
    // Example: { "message": "Invalid email or password", "status": false }
    if (data is Map<String, dynamic> && data.containsKey('message')) {
      return data['message'] as String;
    }

    switch (response.statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized access';
      case 403:
        return 'Forbidden request';
      case 404:
        return 'Resource not found';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      case 503:
        return 'Service unavailable';
      default:
        return 'Oops, something went wrong (${response.statusCode})';
    }
  }
}
