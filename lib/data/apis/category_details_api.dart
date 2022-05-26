
import 'package:dio/dio.dart';
import '../../constants/data_constants/end_points.dart';
import '../../constants/data_constants/strings_manager.dart';
import 'dio_helper.dart';

class CategoryDetailsApi {

  static Future<Response> getCategoryDetails(int id) async {
    return await DioHelper.getData(endpoint: EndPoints.categoryDetails+'$id', lang: StringsManager.lang ,token:StringsManager.token );
  }
}