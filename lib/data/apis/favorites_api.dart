
import 'package:dio/dio.dart';

import '../../constants/data_constants/end_points.dart';
import '../../constants/data_constants/strings_manager.dart';
import 'dio_helper.dart';

class FavoritesApi {

  static Future<Response> getFavorites() async {
    return await DioHelper.getData(endpoint: EndPoints.favorites, lang: StringsManager.lang ,token:StringsManager.token );
  }


  static Future<Response> addOrDeleteFavorite({required int id  }) async {
    return await DioHelper.postData(
        endpoint: EndPoints.register,
        token: StringsManager.token,
        lang: StringsManager.lang,
        data: {
          'product_id':id,
        });
  }


}