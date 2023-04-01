import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:the_movie/data/Api/DioApi.dart';

import '../../model/Genre.dart';
import '../../model/ItemMovieTrailler.dart';
import '../../model/Movie.dart';
import '../../model/ReviewItem.dart';
import '../service/ApiTheMovieService.dart';

class DetalhesPageRepository {
  final serviceMovie = Get.find<ApiTheMovieService>();

  recuperarTrailerFilme(int? idMovie) async {
    ItemMovieTrailler? itemMovieTrailler =
        await serviceMovie.getThrillerApi(idMovie);
    if (itemMovieTrailler != null) {
      return itemMovieTrailler;
    } else {
      return null;
    }
  }

  Future<List<Genre>> recuperarGeneros(List<dynamic>? listGenre) async {
    List<Genre> genre = await serviceMovie.getGenre();
    var genreList = <Genre>[];

    if (listGenre != null) {
      genre.forEach((element) {
        if (listGenre.contains(element.id)) {
          genreList.add(element);
        }
      });
      return genreList;
    }
    return [];
  }

  Future<List<Movie>> recuperarMoviesSimilar(int? idMovie) async {
    String path = "/movie/$idMovie/similar";
    var lista = serviceMovie.getListMovieApi(path);
    if (lista != null) {
      return lista;
    }
    return [];
  }

  Future<List<Results>> recuperarReviews(int? movieId) async {
    List<Results> resultsList = await serviceMovie.getReviews(movieId);
    if (resultsList != null) {
      return resultsList;
    }
    return [];
  }
}
