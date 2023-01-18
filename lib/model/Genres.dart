

import 'Genre.dart';


class Genres {
  List<Genre>? genre;
  Genres({required this.genre,});

  Genres.fromJson(dynamic json) {
    if (json['Genre'] != null) {
      genre = [];
      json['Genre'].forEach((v) {
        genre?.add(Genre?.fromJson(v));

      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    final Genre = this.genre;
    if (Genre != null) {
      map['Genre'] = Genre.map((v) => v.toJson()).toList();
    }
    return map;
  }

}