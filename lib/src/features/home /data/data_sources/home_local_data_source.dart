part of '../imports/data_imports.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedbooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedbooks() {
    return [];
  }
}
