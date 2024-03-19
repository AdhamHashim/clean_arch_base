part of '../imports/data_imports.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource localDataSource;
  final HomeRemoteDataSource remoteDataSource;

  HomeRepoImpl(this.localDataSource, this.remoteDataSource);
  @override
  Future<Result<List<BookEntity>, Failure>> fetchFeaturedBooks() async {
    try {
      var books = localDataSource.fetchFeaturedbooks();
      if (books.isNotEmpty) {
        return Success(books);
      }
      var remoteBooks = await remoteDataSource.fetchFeaturedBooks();
      return Success(remoteBooks);
    } catch (e) {
      return Error(Failure(400, "error ecure"));
    }
  }
}
