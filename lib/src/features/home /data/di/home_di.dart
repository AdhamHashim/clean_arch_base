part of '../imports/data_imports.dart';

void homeSetUpServiceLocator() {
  ConstantManager.GET_IT_LOCATOR.registerSingleton<FetchFeaturedBooksUseCase>(
    FetchFeaturedBooksUseCase(
      HomeRepoImpl(
        HomeLocalDataSourceImpl(),
        HomeRemoteDataSourceImpl(),
      ),
    ),
  );
}
