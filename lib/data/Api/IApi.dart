import 'package:dio/dio.dart';

abstract class IApi {
  Future<Response<dynamic>> getApi(String uriFilmes) ;
}