part of '../imports/presentaion_imports.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return switch (state.baseState) {
          BaseState.initial ||
          BaseState.loading =>
            CustomLoading.showLoadingView(),
          BaseState.error => Center(child: Text(state.errorMessage)),
          BaseState.success => _BuildPlayerList(players: state.players)
        };
      },
    );
  }
}
