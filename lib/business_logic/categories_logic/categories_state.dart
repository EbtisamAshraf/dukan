part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}
class CategoriesLoadingState extends CategoriesState {}
class CategoriesLoadedState extends CategoriesState {

  final CategoriesModel categoriesModel;

  CategoriesLoadedState(this.categoriesModel);
}
class CategoriesErrorState extends CategoriesState {
  final String error;
  CategoriesErrorState(this.error);
}