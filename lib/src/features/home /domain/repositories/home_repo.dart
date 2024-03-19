part of '../imports/domain_imports.dart';

abstract class HomeRepo {
  Future<Result<List<BookEntity>,Failure>> fetchFeaturedBooks();
}
