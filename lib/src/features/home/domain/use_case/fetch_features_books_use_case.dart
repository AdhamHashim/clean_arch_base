part of '../imports/domain_imports.dart';

class FetchPlayersUseCase extends UseCase<List<PlayerEntity>, String> {
  final HomeRepository homeRepo;
  FetchPlayersUseCase({required this.homeRepo});

  @override
  Future<Result<List<PlayerEntity>, Failure>> call([String? param]) {
    return homeRepo.fetchPlayers(param);
  }
}
