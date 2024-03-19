part of'../imports/presentaion_imports.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}
class HomeSuccess extends HomeState {}
class failure extends HomeState {}
class intrent extends HomeState {}
class serverException extends HomeState {}
class emptyData extends HomeState {}


