import '../Api/DioApi.dart';
import '../model/Genre.dart';
import '../model/ItemMovieTrailler.dart';
import '../model/ReviewItem.dart';

class DetalhesPageRepository{
  var genreList = <Genre>[];

  Future<ItemMovieTrailler>? getVideoApi(String uriFilme) async {
    var result = DioApi.getApi(uriFilme);
    var dados;
    late ItemMovieTrailler  item ;
    await result.then((value)  {
      if (value.statusCode == 200) {
        dados = value.data["results"][0];
        item =ItemMovieTrailler.fromJson(dados);
        return item;
      } else {
        print("erro ao carregar video api");
      }
    }).catchError((erro){
      return erro;
    });
    return item;
  }
  recuperarTrailerFilme(int? idMovie) async {
    String uriVideo = "movie/$idMovie/videos";
    return  await getVideoApi(uriVideo);
  }


  Future<List<Genre>> getGenre(String uriGenre) async {
    var dados;
    List<Genre> generos = [];
    var result = DioApi.getApi(uriGenre);
    await result.then((value) {
      dados = value.data['genres'];

      dados.forEach((element) {
        generos.add(Genre.fromJson(element));
      });
    });
    return generos;
  }
  Future<List<Genre>> recuperarGeneros(List<dynamic>? listGenre) async {
    String uriGend = "genre/movie/list";
    List<Genre> gen = await getGenre(uriGend);
    if (listGenre != null) {
      gen.forEach((element) {
        if (listGenre.contains(element.id)) {
          genreList.add(element);
        }
      });
      return genreList;
    }else{
      return genreList;
    }
  }

  Future<List<Results>> getReviews(int? movieId,[int pag = 1]) async{
    List<Results> resultsList =[];
    var result = await DioApi.getApi("movie/${movieId}/reviews",pag);
    if(result.statusCode ==200){
      var  jsons = result.data["results"];
      jsons.forEach((element){
        Results result = Results.fromJson(element);
        resultsList.add(result);
      });
    }else{
      print("erro ${result.statusCode}");
    }
    return resultsList;
  }
}