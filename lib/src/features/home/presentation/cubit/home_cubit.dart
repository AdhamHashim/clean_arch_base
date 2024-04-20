part of '../imports/presentaion_imports.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.fetchPlayersUseCase) : super(HomeState.initial());
  final GetBooksUseCase fetchPlayersUseCase;

  void fetchPlayers([String? searchQuery]) async {
    final result = await fetchPlayersUseCase.call(searchQuery);
    result.when(
      (players) => emit(
        state.copyWith(
          baseStatus: BaseStatus.success,
          players: players,
        ),
      ),
      (error) => emit(
        state.copyWith(
          baseStatus: BaseStatus.error,
          errorMessage: error.message,
        ),
      ),
    );
  }
}
