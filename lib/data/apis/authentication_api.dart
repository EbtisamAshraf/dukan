import 'package:dio/dio.dart';
import 'package:dukan/data/apis/dio_helper.dart';
import '../../constants/data_constants/end_points.dart';

class AuthenticationApi {


static Future<Response> userLogin({required String email, required String password}) async {
  return await DioHelper.postData(
        endpoint: EndPoints.login,
        data: {
          'email':email,
          'password':password,
        });
  }


  static Future<Response> userRegister({required String email, required String password ,required String name ,required String phone }) async {
  return await DioHelper.postData(
        endpoint: EndPoints.register,
        data: {
          'email':email,
          'password':password,
          'name':name,
          'phone':phone,
        });
  }





}
