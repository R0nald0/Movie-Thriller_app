import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:the_movie/data/Api/DioApi.dart';
import 'package:the_movie/data/repository/MovieRepository.dart';
import 'package:the_movie/data/service/ApiTheMovieService.dart';

import '../controller/HomePageController.dart';
import '../data/Api/IApi.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    var d = Get.put<Dio>(Dio());
    var dioApi = Get.put<DioApi>(DioApi(d));
    var apiService = Get.put<ApiTheMovieService>(ApiTheMovieService(dioApi));
    var movieRepository = Get.put<MovieRpository>(MovieRpository(apiService));
    Get.put<HomePageControllerController>(
        HomePageControllerController(movieRepository));
  }
}
