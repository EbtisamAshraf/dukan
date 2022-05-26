part of 'search_products_cubit.dart';

@immutable
abstract class SearchProductsState {}

class SearchProductsInitial extends SearchProductsState {}
class SearchProductsLoadingState extends SearchProductsState {}
class SearchProductsLoadedState extends SearchProductsState {

  final  SearchProductsModel searchProductsModel ;

  SearchProductsLoadedState(this.searchProductsModel);
}
class SearchProductsErrorState extends SearchProductsState {
  final String error;
  SearchProductsErrorState(this.error);
}
