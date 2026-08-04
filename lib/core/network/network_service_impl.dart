import 'package:dio/dio.dart';
import 'package:scraapy_pro/core/network/network_service.dart';
import 'package:scraapy_pro/core/network/utils/network_request.dart';
import 'package:scraapy_pro/core/shared/base_model.dart';

class NetworkServiceImpl implements NetworkService {
  final Dio _dio;

  NetworkServiceImpl(this._dio);

  @override
  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  @override
  void removeToken() {
    _dio.options.headers.remove('Authorization');
  }

  @override
  Future<BaseModel<Model>> callApi<Model>(
    NetworkRequest networkRequest, {
    Model Function(dynamic json)? mapper,
  }) async {
    final response = await _request(networkRequest);
    return BaseModel.fromJson(
      response.data is Map<String, dynamic> ? response.data : {'data': response.data},
      jsonToModel: mapper,
    );
  }

  @override
  Future<T> requestDecoded<T>(
    NetworkRequest networkRequest,
    T Function(dynamic json) parser,
  ) async {
    final response = await _request(networkRequest);
    return parser(response.data);
  }

  Future<Response> _request(NetworkRequest request) async {
    switch (request.method) {
      case RequestMethod.get:
        return _dio.get(
          request.path,
          queryParameters: request.queryParameters,
          options: Options(headers: request.headers),
          onReceiveProgress: request.onReceiveProgress,
        );
      case RequestMethod.post:
        return _dio.post(
          request.path,
          data: request.isFormData
              ? FormData.fromMap(request.body ?? {})
              : request.body,
          queryParameters: request.queryParameters,
          options: Options(headers: request.headers),
          onSendProgress: request.onSendProgress,
          onReceiveProgress: request.onReceiveProgress,
        );
      case RequestMethod.put:
        return _dio.put(
          request.path,
          data: request.body,
          queryParameters: request.queryParameters,
          options: Options(headers: request.headers),
          onSendProgress: request.onSendProgress,
          onReceiveProgress: request.onReceiveProgress,
        );
      case RequestMethod.delete:
        return _dio.delete(
          request.path,
          data: request.body,
          queryParameters: request.queryParameters,
          options: Options(headers: request.headers),
        );
      case RequestMethod.patch:
        return _dio.patch(
          request.path,
          data: request.body,
          queryParameters: request.queryParameters,
          options: Options(headers: request.headers),
          onSendProgress: request.onSendProgress,
          onReceiveProgress: request.onReceiveProgress,
        );
    }
  }
}
