import "package:the_movie/model/Movie.dart";
import 'package:the_movie/model/Movie.dart';


class ItemMovie {
  int? _page;
  List<Movie>? _Movie;
  int? _totalMovie;
  int? _totalPages;

  ItemMovie(
      {int? page, List<Movie>? Movie, int? totalMovie, int? totalPages}) {
    if (page != null) {
      this._page = page;
    }
    if (Movie != null) {
      this._Movie = Movie;
    }
    if (totalMovie != null) {
      this._totalMovie = totalMovie;
    }
    if (totalPages != null) {
      this._totalPages = totalPages;
    }
  }

  ItemMovie.fromJson(Map<String, dynamic> json) {
    _page = json['page'];
    if (json['Movie'] != null) {
      _Movie = <Movie>[];
      json['Movie'].forEach((v) {
        _Movie!.add(new Movie.fromJson(v));
      });
    }
    _totalMovie = json['total_Movie'];
    _totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this._page;
    if (this._Movie != null) {
      data['Movie'] = this._Movie!.map((v) => v.toJson()).toList();
    }
    data['total_Movie'] = this._totalMovie;
    data['total_pages'] = this._totalPages;
    return data;
  }

}