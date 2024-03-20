part of '../imports/presentaion_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        ConstantManager.GET_IT_LOCATOR<FetchFeaturedBooksUseCase>(),
      )..fetchPlayers(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return switch (state.baseState) {
            BaseState.initial ||
            BaseState.loading =>
              CustomLoading.showLoadingView(),
            BaseState.error => Center(child: Text(state.errorMessage)),
            BaseState.success => PlayerList(players: state.players)
          };
        },
      ),
    );
  }
}
