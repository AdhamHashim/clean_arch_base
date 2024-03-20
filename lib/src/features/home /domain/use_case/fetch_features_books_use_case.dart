part of '../imports/domain_imports.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<PlayerEntity>,String> {
  final HomeRepository homeRepo;
  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Result<List<PlayerEntity>, Failure>> call(
      [String? param]) {
    return homeRepo.fetchPlayers(param);
  }
}