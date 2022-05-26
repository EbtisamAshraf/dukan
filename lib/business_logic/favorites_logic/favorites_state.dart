part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}
class FavoritesLoadingState extends FavoritesState {}
class FavoritesLoadedState extends FavoritesState {

  final  GetFavoritesModel getFavoritesModel ;

   FavoritesLoadedState(this.getFavoritesModel);
}
class FavoritesErrorState extends FavoritesState {
  final String error;
  FavoritesErrorState(this.error);
}




