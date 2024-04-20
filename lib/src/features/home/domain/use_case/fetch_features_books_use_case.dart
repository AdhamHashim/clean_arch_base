part of '../imports/domain_imports.dart';

class GetBooksUseCase extends UseCase<List<PlayerEntity>, String> {
  final HomeRepository homeRepo;
  GetBooksUseCase({required this.homeRepo});

  @override
  Future<Result<List<PlayerEntity>, Failure>> call([String? param]) async {
    return await homeRepo.fetchPlayers(param);
  }
}
