part of '../imports/presentaion_imports.dart';

final class HomeState extends Equatable {
  final BaseState baseState;
  final List<PlayerEntity> players;
  final String errorMessage;

  const HomeState({
    required this.baseState,
    required this.players,
    this.errorMessage = ConstantManager.EMPTY_TEXT,
  });

  factory HomeState.initial() {
    return const HomeState(
      baseState: BaseState.initial,
      players: [],
    );
  }

  HomeState copyWith({
    BaseState? baseState,
    List<PlayerEntity>? players,
    String? errorMessage,
  }) {
    return HomeState(
      baseState: baseState ?? this.baseState,
      players: players ?? this.players,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [];
}
