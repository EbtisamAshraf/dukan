import 'package:dio/dio.dart';

abstract class HomeRepository {

  Future<Response> getHomeData();

  Future<Response> getCategories();

}