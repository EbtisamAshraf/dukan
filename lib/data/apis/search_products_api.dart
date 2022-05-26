import 'package:dio/dio.dart';
import '../../constants/data_constants/end_points.dart';
import '../../constants/data_constants/strings_manager.dart';
import 'dio_helper.dart';

class SearchProductsApi {

  static Future<Response> searchProducts({required String text}) async {
    return await DioHelper.postData(
        endpoint: EndPoints.searchProducts,
        lang: StringsManager.lang ,
        token:StringsManager.token,
        data: {
          "text":text
        } );
  }

}