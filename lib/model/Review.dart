import 'ReviewItem.dart';

class Review {
  int? id;
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  Review({
      required this.id,
      required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults,});

  Review.fromJson(dynamic json) {
    id = json['id'];
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page'] = page;
    final results = this.results;
    if (results != null) {
      map['results'] = results.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}