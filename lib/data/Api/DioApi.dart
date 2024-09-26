import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../config/Config.dart';
import 'IApi.dart';

class DioApi implements IApi {
  final Dio client;
  DioApi(this.client);

  @override
  Future<Response<dynamic>> getApi(String uriFilmes, [var pag = 1]) async {
  final apiKey = dotenv.env['api_key'];

    var result = await client.get(
        "${Config.ENDPOINT}$uriFilmes?api_key=$apiKey&page=$pag");
    return result;
  }
}
