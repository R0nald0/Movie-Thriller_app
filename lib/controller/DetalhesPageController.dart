import 'package:get/get.dart';
import 'package:the_movie/model/ItemMovieTrailler.dart';
import 'package:the_movie/model/ListsModel.dart';
import 'package:the_movie/model/Movie.dart';
import 'package:the_movie/model/ReviewItem.dart';
import '../model/Genre.dart';
import '../data/repository/DetalhesPageRepositry.dart';
import '../data/repository/MovieRepository.dart';

class DetalhesPageController extends GetxController {
  var itemMovieTrailler = ItemMovieTrailler().obs;
  var key = "".obs;
  final _detalhePageRpository = DetalhesPageRepository();
  final _listGenders = <Genre>[].obs;
  var _movieSimilar = <Movie>[].obs;
  final _listReview = <Results>[].obs;

  List<Movie> list = [];

  get moviesListGenders => _listGenders;
  get moviesSimilarsList => _movieSimilar;
  get moviesReviews => _listReview;

  getGenderList(Movie movie) async {
    _listGenders
        .addAll(await _detalhePageRpository.recuperarGeneros(movie.genreIds));
  }

  getVideoTrailler(int? id) async {
    ItemMovieTrailler video =
        await _detalhePageRpository.recuperarTrailerFilme(id);
    if (video != null) {
      key.value = video.key!;
    }
  }

  getMoviesSimilar(int? idMovie) async {
    try {
      _movieSimilar
          .addAll(await _detalhePageRpository.recuperarMoviesSimilar(idMovie));
    } catch (e, s) {
      print("erro ${e} -- ${s}");
    }
  }

  getMoviesReview(int? movieId) async {
    try {
      _listReview.addAll(await _detalhePageRpository.recuperarReviews(movieId));
    } catch (e, s) {
      s.printError;
      e.printError;
    }
  }

  imprimirLista(List<Movie> movies) async {
    movies.forEach((element) {
      print("Dado Lista = ${element.title} -- ${element.id}");
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
