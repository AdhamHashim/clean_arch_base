part of '../imports/data_imports.dart';

abstract class HomeRemoteDataSource {
  Future<List<PlayerModel>> fetchPlayers([String? searchQuery]);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<PlayerModel>> fetchPlayers([String? searchQuery]) async {
    final NetworkRequest networkRequest = NetworkRequest(
      path: ApiEndpoints.players,
      method: RequestMethod.get,
      queryParameters: {'search': searchQuery},
    );
    return ConstantManager.serviceLocator<NetworkService>()
        .callApi(networkRequest, mapper: ((json) => (json as List)
            .map((e) => PlayerModel.fromJson(e as Map<String, dynamic>))
            .toList()));
  }
}
