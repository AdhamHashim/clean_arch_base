part of '../imports/data_imports.dart';

void homeSetUpServiceLocator() {
  ConstantManager.GET_IT_LOCATOR
      .registerLazySingleton<FetchFeaturedBooksUseCase>(
    () => FetchFeaturedBooksUseCase(homeRepo: ConstantManager.GET_IT_LOCATOR<HomeRepository>()),
  );

  ConstantManager.GET_IT_LOCATOR.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remoteDataSource: ConstantManager.GET_IT_LOCATOR<HomeRemoteDataSource>(),
    ),
  );
  
  ConstantManager.GET_IT_LOCATOR.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
}
