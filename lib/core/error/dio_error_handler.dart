import 'package:dio/dio.dart';
import 'api_exception.dart';

class DioErrorHandler {
  const DioErrorHandler._();

  static ApiException handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ApiException(
          message: 'Connection timed out. Please try again.',
        );

      case DioExceptionType.connectionError:
        return const ApiException(
          message: 'No internet connection.',
        );

      case DioExceptionType.badResponse:
        return _handleResponse(error.response);

      case DioExceptionType.cancel:
        return const ApiException(
          message: 'Request was cancelled.',
        );

      case DioExceptionType.badCertificate:
        return const ApiException(
          message: 'Secure connection failed.',
        );

      case DioExceptionType.unknown:
        return const ApiException(
          message: 'Something went wrong. Please try again.',
        );
      case DioExceptionType.transformTimeout:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  static ApiException _handleResponse(Response? response) {
    final statusCode = response?.statusCode;

    switch (statusCode) {
      case 400:
        return const ApiException(
          message: 'Invalid request.',
          statusCode: 400,
        );

      case 401:
        return const ApiException(
          message: 'Your session has expired.',
          statusCode: 401,
        );

      case 403:
        return const ApiException(
          message: 'You do not have permission to perform this action.',
          statusCode: 403,
        );

      case 404:
        return const ApiException(
          message: 'The requested resource was not found.',
          statusCode: 404,
        );

      case 422:
        return const ApiException(
          message: 'The provided data is invalid.',
          statusCode: 422,
        );

      case 500:
      case 502:
      case 503:
        return const ApiException(
          message: 'Server error. Please try again later.',
        );

      default:
        return ApiException(
          message: 'Unexpected server error.',
          statusCode: statusCode,
        );
    }
  }
}