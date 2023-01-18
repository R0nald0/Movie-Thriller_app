 import 'Movie.dart';

class ListModel{
    int _page;
    String  _title ;
    List<Movie> _listMovies = [];

   ListModelEmpty(){}
   ListModel(this._page,this._listMovies,this._title){}

   set titleList (title) =>this._title = title;
   get titleList => this._title;

    set pageList (page) => this._page = page ;
    get pageList => this._page;

    set setlistMovie(list) => this._listMovies = list;
    get  getlistMovie => this._listMovies ;
}