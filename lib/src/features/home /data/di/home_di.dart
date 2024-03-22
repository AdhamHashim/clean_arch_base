part of '../imports/data_imports.dart';

void homeSetUpServiceLocator() {
  ConstantManager.serviceLocator
      .registerLazySingleton<FetchFeaturedBooksUseCase>(
    () => FetchFeaturedBooksUseCase(
        homeRepo: ConstantManager.serviceLocator<HomeRepository>()),
  );

  ConstantManager.serviceLocator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remoteDataSource: ConstantManager.serviceLocator<HomeRemoteDataSource>(),
    ),
  );

  ConstantManager.serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
}
