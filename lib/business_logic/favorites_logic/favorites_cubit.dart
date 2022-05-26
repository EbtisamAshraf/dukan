import 'dart:developer';

import 'package:dukan/data/model/favorites_model/post_favorites_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../data/apis/favorites_api.dart';
import '../../data/model/favorites_model/get_favorites_model.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  static FavoritesCubit get(context) => BlocProvider.of(context);

  late final  GetFavoritesModel getFavoritesModel ;

  getFavorites(){
    emit(FavoritesLoadingState());
    FavoritesApi.getFavorites().then((value) {
      getFavoritesModel= GetFavoritesModel.fromJson(value.data);
      emit(FavoritesLoadedState(getFavoritesModel));
    }).catchError((error){
      emit(FavoritesErrorState(error.toString()));
      log( 'error'+ error.toString());
    });
  }





}
