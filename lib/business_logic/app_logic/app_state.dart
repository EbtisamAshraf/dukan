
import 'package:flutter/cupertino.dart';

abstract class AppState {}

class AppInitial extends AppState {}
class ChangeDarkStats extends AppState {}
class GetDarkModeStats extends AppState {}
class ChangeScreenIndexState extends AppState {}

class AddOrDeleteFavoriteLoadingState extends AppState {}
class AddOrDeleteFavoriteLoadedState extends AppState {

  // final  PostFavoritesModel postFavoritesModel ;
  //
  // AddOrDeleteFavoriteLoadedState(this.postFavoritesModel);
}
class AddOrDeleteFavoriteErrorState extends AppState {
  final String error;
  AddOrDeleteFavoriteErrorState(this.error);
}

class ChangeFavoriteIconActiveState extends AppState {
  final IconData iconData;
  ChangeFavoriteIconActiveState(this.iconData);
}
class ChangeFavoriteIconState extends AppState {
  final IconData iconData;
  ChangeFavoriteIconState(this.iconData);
}