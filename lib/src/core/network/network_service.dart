import 'network_request.dart';

abstract interface class NetworkService {
  Future<Model> callApi<Model>(
    NetworkRequest networkRequest, {
    Model Function(dynamic json)? mapper,
  });

  void addTokenToRequest(String token);

  void removeTokenFromRequest();
}
