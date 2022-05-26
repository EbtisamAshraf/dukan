
import 'package:dio/dio.dart';
import 'package:dukan/constants/data_constants/end_points.dart';
import 'package:dukan/constants/data_constants/strings_manager.dart';
import '../repositories/home_repository.dart';
import 'dio_helper.dart';

class HomeApi extends HomeRepository{

   @override
  Future<Response> getHomeData() async {
    return await DioHelper.getData(endpoint: EndPoints.home, lang: StringsManager.lang ,token:StringsManager.token );
  }

   @override
  Future<Response> getCategories() async {
    return await DioHelper.getData(endpoint: EndPoints.categories, lang: StringsManager.lang );
  }
}