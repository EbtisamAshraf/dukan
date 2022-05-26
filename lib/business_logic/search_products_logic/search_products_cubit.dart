import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/apis/search_products_api.dart';
import '../../data/model/search_products_model.dart';

part 'search_products_state.dart';

class SearchProductsCubit extends Cubit<SearchProductsState> {
  SearchProductsCubit() : super(SearchProductsInitial());

  static SearchProductsCubit get(context) => BlocProvider.of(context);

  late   SearchProductsModel searchProductsModel ;

  searchProducts(String text){
    emit(SearchProductsLoadingState());
    SearchProductsApi.searchProducts(text: text).then((value) {
      searchProductsModel= SearchProductsModel.fromJson(value.data);
      emit(SearchProductsLoadedState(searchProductsModel));
    }).catchError((error){
      emit(SearchProductsErrorState(error.toString()));
      log( 'error'+ error.toString());
    });
  }
}
