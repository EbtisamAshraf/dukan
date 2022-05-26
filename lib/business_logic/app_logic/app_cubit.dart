import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/apis/favorites_api.dart';
import '../../data/local_data/shared_preferences/shared_pref.dart';
import '../../data/model/favorites_model/post_favorites_model.dart';
import 'app_state.dart';


class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

 static AppCubit get(context)=> BlocProvider.of<AppCubit>(context);



   late   PostFavoritesModel postFavoritesModel ;

  IconData iconData =  Icons.favorite_border  ;


  addOrDeleteFavorite({required int id  }){
    emit(AddOrDeleteFavoriteLoadingState());
    FavoritesApi.addOrDeleteFavorite(id: id).then((value) {
      postFavoritesModel =  PostFavoritesModel.fromJson(value.data);
      // emit(AddOrDeleteFavoriteLoadedState());
      if (postFavoritesModel.message == "تم الحذف بنجاح" || postFavoritesModel.message == "Deleted Successfully" ){
        iconData =  Icons.favorite_border  ;
        // emit(ChangeFavoriteIconState(iconData));
        emit(AddOrDeleteFavoriteLoadedState());
        return iconData;
      }else if (postFavoritesModel.message == "تمت الإضافة بنجاح" || postFavoritesModel.message == "Added Successfully" ){
        iconData =  Icons.favorite  ;
        // emit(ChangeFavoriteIconActiveState(iconData));
        emit(AddOrDeleteFavoriteLoadedState());
        return iconData;
      }
    }).catchError((error){
      emit(AddOrDeleteFavoriteErrorState(error.toString()));
      log( 'error'+ error.toString());
    });
  }


  //  int currentIndex = 0;
  //
  // List<Widget> screens = [
  //    HomeScreen(),
  //   Container(),
  //   Container(),
  //   Container(),
  // ];
  //
  //  changeScreenIndex(int index){
  //    currentIndex = index;
  //    emit(ChangeScreenIndexState());
  //    return currentIndex;
  //  }



  bool isDark = true;

  initDarkMode({ bool? isDarkMode }){

    if(isDarkMode != null){
      isDark = isDarkMode;
      emit(ChangeDarkStats());
    }else{
      isDark = !isDark;
      SharedPref.saveData(key: 'isDark', value: isDark);
      emit(ChangeDarkStats());
    }

    return isDark;
  }





}
