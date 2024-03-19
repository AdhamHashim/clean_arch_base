part of '../imports/presentaion_imports.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeFeaturedBooksUseCase) : super(HomeInitial());
  final FetchFeaturedBooksUseCase homeFeaturedBooksUseCase;

  void fetchFeaturedBooks() async {
    var result = await homeFeaturedBooksUseCase.call();
    switch (result) {
      case Success():
      case Error():
    }
  }
}
