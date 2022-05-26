part of 'category_details_cubit.dart';

@immutable
abstract class CategoryDetailsState {}

class CategoryDetailsInitial extends CategoryDetailsState {}

class CategoryDetailsLoadingState extends CategoryDetailsState {}
class CategoryDetailsLoadedState extends CategoryDetailsState {

  final  CategoryDetailsModel categoryDetailsModel ;

  CategoryDetailsLoadedState(this.categoryDetailsModel);
}
class CategoryDetailsErrorState extends CategoryDetailsState {
  final String error;
  CategoryDetailsErrorState(this.error);
}

