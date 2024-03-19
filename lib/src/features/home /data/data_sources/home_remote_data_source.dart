part of '../imports/data_imports.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    // return await GenericHttp<dynamic>(Go.navigatorKey.currentState!.context)
    //     .callApi(
    //   name: ApiNames.apiName,
    //   jsonBody: {},
    //   returnType: ReturnType.Type,
    //   methodType: MethodType.Post,
    //   showLoader: false,
    //   returnDataFun: (data) {},
    // );
    return [];
  }
}
