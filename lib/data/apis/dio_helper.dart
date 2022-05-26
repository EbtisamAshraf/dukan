import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String endpoint,
    Map<String, dynamic>? query,
    String? lang,
    String? token,
  }) async {
    dio.options.headers = {'lang': lang, 'Authorization': token};

    return await dio.get(
      endpoint,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String endpoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? lang ,
    String? token,
  }) async {
    dio.options.headers = {'lang': lang, 'Authorization': token};

    return await dio.post(endpoint, data: data, queryParameters: query);
  }
}
