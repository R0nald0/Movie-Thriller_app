import 'SpokenLanguages.dart';

class MovieLatesy {
      bool? adult;
      dynamic? backdropPath;
      dynamic? belongsToCollection;
      int? budget;
      List<dynamic>? genres;
      String? homepage;
      int? id;
      dynamic? imdbId;
      String? originalLanguage;
      String? originalTitle;
      String? overview;
      double? popularity;
      dynamic? posterPath;
      List<dynamic>? productionCompanies;
      List<dynamic>? productionCountries;
      String? releaseDate;
      int? revenue;
      int? runtime;
      List<SpokenLanguages>? spokenLanguages;
      String? status;
      String? tagline;
      String? title;
      bool? video;
      double? voteAverage;
      int? voteCount;

      MovieLatesy({
        this.adult,
        this.backdropPath,
        this.belongsToCollection,
        this.budget,
        this.genres,
        this.homepage,
        this.id,
        this.imdbId,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompanies,
        this.productionCountries,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.spokenLanguages,
        this.status,
        this.tagline,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
      });

   factory MovieLatesy.fromJson(Map<String,dynamic> json) {
     return MovieLatesy(
         voteCount: json["voteCount"],
         title: json["title"],
         posterPath: json["posterPath"],
         voteAverage: json["voteAverage"],
         video: json["video"],
         releaseDate:json["releaseDate"],
         backdropPath:json["backdropPath"],
         overview:json["overview"],
         id:json["id"],
         originalTitle:json["originalTitle"],
         adult:json["adult"],
         belongsToCollection:json["belongsToCollection"],
         budget:json["budget"],
         homepage:json["homepage"],
         imdbId:json["imdbId"],
         originalLanguage:json["originalLanguage"],
         popularity: json["popularity"],
         revenue: json["revenue"],
         status: json["status"],
       );

      }
      Map<String, dynamic> toJson() {
        final map = <String, dynamic>{};
        map['adult'] = adult;
        map['backdrop_path'] = backdropPath;
        map['belongs_to_collection'] = belongsToCollection;
        map['budget'] = budget;
        /*if (genres != null) {
          map['genres'] = genres.map((v) => v.toJson()).toList();
        }*/
        map['homepage'] = homepage;
        map['id'] = id;
        map['imdb_id'] = imdbId;
        map['original_language'] = originalLanguage;
        map['original_title'] = originalTitle;
        map['overview'] = overview;
        map['popularity'] = popularity;
        map['poster_path'] = posterPath;
        map['release_date'] = releaseDate;
        map['revenue'] = revenue;
        map['runtime'] = runtime;
        final spokenLanguages = this.spokenLanguages;
        if (spokenLanguages != null) {
          map['spoken_languages'] = spokenLanguages.map((v) => v.toJson()).toList();
        }
        map['status'] = status;
        map['tagline'] = tagline;
        map['title'] = title;
        map['video'] = video;
        map['vote_average'] = voteAverage;
        map['vote_count'] = voteCount;
        return map;
      }
}
