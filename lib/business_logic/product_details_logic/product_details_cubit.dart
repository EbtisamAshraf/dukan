import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../data/apis/product_details_api.dart';
import '../../data/model/product_details_model.dart';
part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  late final  ProductDetailsModel productDetailsModel ;

  getProductDetails(int id){
    emit(ProductDetailsLoadingState());
    ProductDetailsApi.getProductDetails(id).then((value) {
      productDetailsModel= ProductDetailsModel.fromJson(value.data);
      emit(ProductDetailsLoadedState(productDetailsModel));
    }).catchError((error){
      emit(ProductDetailsErrorState(error.toString()));
      log( 'error'+ error.toString());
    });
  }
}
