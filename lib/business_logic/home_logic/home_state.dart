part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoadingState extends HomeState {}
class HomeLoadedState extends HomeState {

  final HomeModel homeModel;

  HomeLoadedState(this.homeModel);
}
class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
}

class ChangePageViewState extends HomeState {}


