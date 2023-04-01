import 'package:get/get.dart' hide Response;
import 'package:the_movie/model/MovieLatesy.dart';

import '../Api/DioApi.dart';
import '../../model/ListsModel.dart';
import '../../model/Movie.dart';
import '../service/ApiTheMovieService.dart';

class MovieRpository extends GetxController {
  final ApiTheMovieService serviceMovie;
  int _pagFilmesPopulares = 1;
  int _pagFilmesTopRatep = 1;
  List<ListModel> _listListModel = [];

  MovieRpository(this.serviceMovie);

  Future<List<Movie>> recuperarFilmePopulares([int pag = 1]) async {
    String uriFilmesPopulares = "movie/popular";
    _pagFilmesPopulares = pag;

    List<Movie> lisFilmes = await serviceMovie.getListMovieApi(
        uriFilmesPopulares, _pagFilmesPopulares);
    return lisFilmes;
  }

  Future<List<Movie>> recuperarFilmesMaisVistos([int pag = 1]) async {
    String uriTopRated = "movie/top_rated";
    _pagFilmesTopRatep = pag;
    List<Movie> lisFilmes =
        await serviceMovie.getListMovieApi(uriTopRated, _pagFilmesTopRatep);
    return lisFilmes;
  }

  Future<List<ListModel>> recuperarLista() async {
    ListModel listPop =
        ListModel(1, await recuperarFilmePopulares(), "Filmes Populares");
    ListModel listTop =
        ListModel(1, await recuperarFilmesMaisVistos(), "Mais vistos");
    _listListModel.addAll([listPop, listTop]);
    return _listListModel;
  }

  Future<List<Movie>> recuperarListModel(ListModel listModel) async {
    switch (listModel.titleList) {
      case "Filmes Populares":
        {
          return await recuperarFilmePopulares(listModel.pageList += 1);
        }
        break;
      case "Mais vistos":
        {
          return await recuperarFilmesMaisVistos(listModel.pageList += 1);
        }
        break;
      default:
        {
          return [];
        }
    }
  }

  recuperarFilmesLatests() async {
    await serviceMovie.getMovieLatestFromApi();
  }
}
