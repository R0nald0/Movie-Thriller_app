import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/response/response.dart' hide Response;
import 'package:get/get_rx/get_rx.dart';

import '../../config/Config.dart';
import '../../config/Key_config.dart';
import 'IApi.dart';

class DioApi implements IApi {
  final Dio client;
  DioApi(this.client);

  Future<Response<dynamic>> getApi(String uriFilmes, [var pag = 1]) async {
    var result = await client.get(
        "${Config.ENDPOINT}$uriFilmes?api_key=${Key_config.API_KEY}&page=${pag}");
    return result;
  }
}
