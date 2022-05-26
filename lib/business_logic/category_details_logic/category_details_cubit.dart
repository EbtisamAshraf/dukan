import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../data/apis/category_details_api.dart';
import '../../data/model/category_details_model.dart';
part 'category_details_state.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  CategoryDetailsCubit() : super(CategoryDetailsInitial());

  static CategoryDetailsCubit get(context) => BlocProvider.of(context);

  late final  CategoryDetailsModel categoryDetailsModel ;

  getCategoryDetails(int id){
    emit(CategoryDetailsLoadingState());
    CategoryDetailsApi.getCategoryDetails(id).then((value) {
      categoryDetailsModel= CategoryDetailsModel.fromJson(value.data);
      emit(CategoryDetailsLoadedState(categoryDetailsModel));
    }).catchError((error){
      emit(CategoryDetailsErrorState(error.toString()));
      log( 'error'+ error.toString());
    });
  }

}
