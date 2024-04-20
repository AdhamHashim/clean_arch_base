part of '../imports/presentaion_imports.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeFeaturedBooksUseCase) : super(HomeState.initial());
  final FetchFeaturedBooksUseCase homeFeaturedBooksUseCase;

  void fetchPlayers([String? searchQuery]) async {
    final result = await homeFeaturedBooksUseCase.call(searchQuery);
    result.when(
      (players) => emit(
        state.copyWith(
          baseState: BaseStatus.success,
          players: players,
        ),
      ),
      (error) => emit(
        state.copyWith(
          baseState: BaseStatus.error,
          errorMessage: error.message,
        ),
      ),
    );
  }
}
