


import 'dart:convert';

import 'package:get/get.dart' hide Response;
import 'package:the_movie/model/MovieLatesy.dart';

import '../Api/DioApi.dart';
import '../model/Genre.dart';
import '../model/ItemMovieTrailler.dart';
import '../model/ListsModel.dart';
import '../model/Movie.dart';
import '../model/ReviewItem.dart';

class MovieRpository extends GetxController {


    var _moviesLatests = MovieLatesy();
    int _pagFilmesPopulares = 1;
    int _pagFilmesTopRatep =1;
    List<ListModel> _listListModel =[];

  Future<List<Movie>> getListMovieApi(String uriFilmes, [var pag = 1]) async {
    var data;
    var result = DioApi.getApi(uriFilmes, pag);
    List<Movie> list = [];

    await result.then((value) {
      if (value.statusCode == 200) {
        data =value.data["results"];
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
  Future getMovieLatestFromApi(String uriFilme, [int pag = 1]) async {
      var result = DioApi.getApi(uriFilme, pag);
      result.then((value) {
        if (value.statusCode == 200) {
          var jsonn = value.data;
          _moviesLatests = MovieLatesy.fromJson(jsonn);
          _moviesLatests.toJson();
        }
      });
    }

  Future<List<Movie>> getMoviesSimilar(int? idMovie) async{
    String path = "/movie/${idMovie}/similar";
    return    getListMovieApi(path);
  }

  Future<List<Movie>> recuperarFilmePopulares([int pag = 1]) async {

    String uriFilmesPopulares = "movie/popular";
    _pagFilmesPopulares = pag;
    print("PaginacaoRepo ${pag}");
    List<Movie> lisFilmes  = await getListMovieApi(uriFilmesPopulares, _pagFilmesPopulares);
    return lisFilmes;

  }
  Future<List<Movie>> recuperarFilmesMaisVistos([int pag = 1]) async {
    String uriTopRated = "movie/top_rated";
    _pagFilmesTopRatep =pag;
    List<Movie> lisFilmes  =  await getListMovieApi(uriTopRated,_pagFilmesTopRatep);
    return lisFilmes;
  }




  Future<List<ListModel>> recuperarLista()  async{
        ListModel listPop = ListModel(1, await recuperarFilmePopulares(), "Filmes Populares");
        ListModel listTop = ListModel(1, await recuperarFilmesMaisVistos(), "Mais vistos");
        _listListModel.addAll([listPop,listTop]);
        return _listListModel;
  }
  Future<List<Movie>> recuperarListModel(ListModel listModel) async{
       switch(listModel.titleList){
         case "Filmes Populares":{
              return await recuperarFilmePopulares(listModel.pageList +=1);
         }break;
         case  "Mais vistos" :{
            return await recuperarFilmesMaisVistos(listModel.pageList +=1);
         } break;
         default:{return [];}
       }
  }

  recuperarFilmesLatests() async {
    String uriTopRated = "movie/latest";
    await getMovieLatestFromApi(uriTopRated);
  }





}


