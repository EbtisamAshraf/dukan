import 'package:dio/dio.dart';

import '../../constants/data_constants/end_points.dart';
import '../../constants/data_constants/strings_manager.dart';
import 'dio_helper.dart';

class ProductDetailsApi {

  static Future<Response> getProductDetails( int id) async {
    return await DioHelper.getData(endpoint: EndPoints.products+'$id', lang: StringsManager.lang ,token:StringsManager.token );
  }




}