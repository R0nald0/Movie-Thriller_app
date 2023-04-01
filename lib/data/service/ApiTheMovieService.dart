import '../Api/DioApi.dart';
import '../../model/Genre.dart';
import '../../model/ItemMovieTrailler.dart';
import '../../model/Movie.dart';
import '../../model/MovieLatesy.dart';
import '../../model/ReviewItem.dart';

class ApiTheMovieService {
  var _moviesLatests = MovieLatesy();
  var genreList = <Genre>[];

  final DioApi dioApi;
  ApiTheMovieService(this.dioApi);

  Future<List<Movie>> getListMovieApi(String uriFilmes, [var pag = 1]) async {
    var data;

    var result = dioApi.getApi(uriFilmes, pag);
    List<Movie> list = [];

    await result.then((value) {
      if (value.statusCode == 200) {
        data = value.data["results"];
        data.forEach((element) {
          Movie movie = Movie(
              adult: element['adult'],
              backdropPath: element['backdrop_path'],
              genreIds: element['genre_ids'],
              id: element["id"],
              originalLanguage: element['original_language'],
              originalTitle: element["original_title"],
              overview: element['overview'],
              // popularity: element["popularity"],
              posterPath: element["poster_path"],
              releaseDate: element["release_date"],
              title: element["title"],
              video: element["video"],
              voteCount: element["vote_count"]);
          list.add(movie);
        });
      }
    });
    return list;
  }

  Future<List<Genre>> getGenre() async {
    var dados;
    String uriGenre = "genre/movie/list";

    List<Genre> generos = [];
    var result = dioApi.getApi(uriGenre);
    await result.then((value) {
      dados = value.data['genres'];

      dados.forEach((element) {
        generos.add(Genre.fromJson(element));
      });
    });
    return generos;
  }

  Future getMovieLatestFromApi([int pag = 1]) async {
    String uriTopRated = "movie/latest";
    var result = dioApi.getApi(uriTopRated, pag);

    result.then((value) {
      if (value.statusCode == 200) {
        var jsonn = value.data;
        _moviesLatests = MovieLatesy.fromJson(jsonn);
        _moviesLatests.toJson();
      }
    });
  }

  Future<ItemMovieTrailler>? getThrillerApi(int? idMovie) async {
    String uriVideo = "movie/$idMovie/videos";
    var result = dioApi.getApi(uriVideo);
    var dados;
    late ItemMovieTrailler item;
    await result.then((value) {
      if (value.statusCode == 200) {
        dados = value.data["results"][0];
        item = ItemMovieTrailler.fromJson(dados);
        return item;
      } else {
        print("erro ao carregar video api");
      }
    }).catchError((erro) {
      return erro;
    });
    return item;
  }

  Future<List<Results>> getReviews(int? movieId, [int pag = 1]) async {
    List<Results> resultsList = [];
    var result = await dioApi.getApi("movie/$movieId/reviews", pag);
    if (result.statusCode == 200) {
      var jsons = result.data["results"];
      jsons.forEach((element) {
        Results result = Results.fromJson(element);
        resultsList.add(result);
      });
    } else {
      print("erro ${result.statusCode}");
    }
    return resultsList;
  }
}
