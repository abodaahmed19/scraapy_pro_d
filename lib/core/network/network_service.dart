import '../shared/base_model.dart';
import 'utils/network_request.dart';

abstract interface class NetworkService {
  Future<BaseModel<Model>> callApi<Model>(
      NetworkRequest networkRequest, {
        Model Function(dynamic json)? mapper,
      });

  /// Raw JSON body (e.g. DRF paginated `{ count, results }` without `data` wrapper).
  Future<T> requestDecoded<T>(
      NetworkRequest networkRequest,
      T Function(dynamic json) parser,
      );

  void setToken(String token);

  void removeToken();
}
