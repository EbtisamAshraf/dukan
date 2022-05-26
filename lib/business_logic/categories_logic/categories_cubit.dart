import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../data/model/categories_model.dart';
import '../../data/repositories/home_repository.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {

  final HomeRepository homeRepository;
  CategoriesCubit({required this.homeRepository}) : super(CategoriesInitial());
  static CategoriesCubit get(context) => BlocProvider.of(context);

  late final  CategoriesModel categoriesModel;

  getCategories(){
    emit(CategoriesLoadingState());
    homeRepository.getCategories().then((value) {
      categoriesModel= CategoriesModel.fromJson(value.data);
      emit(CategoriesLoadedState(categoriesModel));
    }).catchError((error){
      emit(CategoriesErrorState(error.toString()));
      log(error.toString());
    });
  }

}
