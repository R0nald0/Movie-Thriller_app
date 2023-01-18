import 'Genre.dart';

class Movie {
  String? _posterPath;
  bool? _adult;
  String? _overview;
  String? _releaseDate;
  List<dynamic>? _genreIds;
  int? _id;
  String? _originalTitle;
  String? _originalLanguage;
  String? _title;
  String? _backdropPath;
  double? _popularity;
  int? _voteCount;
  bool? _video;
  double? _voteAverage;

  Movie(
      {String? posterPath,
      bool? adult,
      String? overview,
      String? releaseDate,
      List<dynamic>? genreIds,
      int? id,
      String? originalTitle,
      String? originalLanguage,
      String? title,
      String? backdropPath,
      double? popularity,
      int? voteCount,
      bool? video,
      double? voteAverage,
      }) {
    if (posterPath != null) {
      this._posterPath = posterPath;
    }
    if (adult != null) {
      this._adult = adult;
    }
    if (overview != null) {
      this._overview = overview;
    }
    if (releaseDate != null) {
      this._releaseDate = releaseDate;
    }
    if (genreIds != null) {
      this._genreIds = genreIds;
    }
    if (id != null) {
      this._id = id;
    }
    if (originalTitle != null) {
      this._originalTitle = originalTitle;
    }
    if (originalLanguage != null) {
      this._originalLanguage = originalLanguage;
    }
    if (title != null) {
      this._title = title;
    }
    if (backdropPath != null) {
      this._backdropPath = backdropPath;
    }
    if (popularity != null) {
      this._popularity = popularity;
    }
    if (voteCount != null) {
      this._voteCount = voteCount;
    }
    if (video != null) {
      this._video = video;
    }
    if (voteAverage != null) {
      this._voteAverage = voteAverage;
    }
  }

  String? get posterPath => _posterPath;

  set posterPath(String? posterPath) => _posterPath = posterPath;

  bool? get adult => _adult;

  set adult(bool? adult) => _adult = adult;

  String? get overview => _overview;

  set overview(String? overview) => _overview = overview;

  String? get releaseDate => _releaseDate;

  set releaseDate(String? releaseDate) => _releaseDate = releaseDate;

  List<dynamic>? get genreIds => _genreIds;

  set genreIds(List<dynamic>? genreIds) => _genreIds = genreIds;

  int? get id => _id;

  set id(int? id) => _id = id;

  String? get originalTitle => _originalTitle;

  set originalTitle(String? originalTitle) => _originalTitle = originalTitle;

  String? get originalLanguage => _originalLanguage;

  set originalLanguage(String? originalLanguage) =>
      _originalLanguage = originalLanguage;

  String? get title => _title;

  set title(String? title) => _title = title;

  String? get backdropPath => _backdropPath;

  set backdropPath(String? backdropPath) => _backdropPath = backdropPath;

  double? get popularity => _popularity;

  set popularity(double? popularity) => _popularity = popularity;

  int? get voteCount => _voteCount;

  set voteCount(int? voteCount) => _voteCount = voteCount;

  bool? get video => _video;

  set video(bool? video) => _video = video;

  double? get voteAverage => _voteAverage;

  set voteAverage(double? voteAverage) => _voteAverage = voteAverage;

  Movie.fromJson(Map<String, dynamic> json) {
    _posterPath = json['poster_path'];
    _adult = json['adult'];
    _overview = json['overview'];
    _releaseDate = json['release_date'];
    _genreIds = json['genre_ids'].cast<int>();
    _id = json['id'];
    _originalTitle = json['original_title'];
    _originalLanguage = json['original_language'];
    _title = json['title'];
    _backdropPath = json['backdrop_path'];
    _popularity = json['popularity'];
    _voteCount = json['vote_count'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poster_path'] = this._posterPath;
    data['adult'] = this._adult;
    data['overview'] = this._overview;
    data['release_date'] = this._releaseDate;
    data['genre_ids'] = this._genreIds;
    data['id'] = this._id;
    data['original_title'] = this._originalTitle;
    data['original_language'] = this._originalLanguage;
    data['title'] = this._title;
    data['backdrop_path'] = this._backdropPath;
    data['popularity'] = this._popularity;
    data['vote_count'] = this._voteCount;
    data['video'] = this._video;
    data['vote_average'] = this._voteAverage;
    return data;
  }
}
