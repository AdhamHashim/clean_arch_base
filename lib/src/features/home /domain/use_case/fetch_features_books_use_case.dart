part of '../imports/domain_imports.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Result<List<BookEntity>, Failure>> call([void param]) {
    return homeRepo.fetchFeaturedBooks();
  }
}
