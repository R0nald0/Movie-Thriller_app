import 'package:get/get.dart';
import 'package:the_movie/model/Genre.dart';
import 'package:the_movie/data/repository/MovieRepository.dart';

import '../model/ListsModel.dart';
import '../model/Movie.dart';

class HomePageControllerController extends GetxController {
  final MovieRpository _movieRpository;
  var _listMoviePopulares = <Movie>[].obs;
  var _listMovieTopRated = <Movie>[].obs;
  var _listListMovies = <ListModel>[].obs;
  HomePageControllerController(this._movieRpository);

  @override
  void onInit() {
    recuperarListaFilmes();
  }

  get moviesListPopular => _listMoviePopulares;
  get moviesListsMovies => _listListMovies;
  get moviesListTopRated => _listMovieTopRated;

  recuperarListaFilmes() async {
    _listListMovies.addAll(await _movieRpository.recuperarLista());
    _listListMovies.forEach((element) {
      print("total de lista = ${element.titleList}");
    });
  }
}
