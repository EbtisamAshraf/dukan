part of 'product_details_cubit.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}
class ProductDetailsLoadingState extends ProductDetailsState {}
class ProductDetailsLoadedState extends ProductDetailsState {

  final  ProductDetailsModel productDetailsModel ;

  ProductDetailsLoadedState(this.productDetailsModel);
}
class ProductDetailsErrorState extends ProductDetailsState {
  final String error;
  ProductDetailsErrorState(this.error);
}
