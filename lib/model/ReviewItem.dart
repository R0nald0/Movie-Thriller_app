import 'AuthorDetails.dart';

class Results {

  String? author;
  AuthorDetails? authorDetails;
  String? content;
  String? createdAt;
  String? id;
  String? updatedAt;
  String? url;

  Results({
      required this.author,
      required this.authorDetails,
      required this.content,
      required this.createdAt,
      required this.id,
      required this.updatedAt,
      required this.url,});

  Results.fromJson(dynamic json) {
    author = json['author'];
    authorDetails = json['author_details'] != null ? AuthorDetails.fromJson(json['author_details']) : null;
    content = json['content'];
    createdAt = json['created_at'];
    id = json['id'];
    updatedAt = json['updated_at'];
    url = json['url'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = author;
    final authorDetails = this.authorDetails;
    if (authorDetails != null) {
      map['author_details'] = authorDetails.toJson();
    }
    map['content'] = content;
    map['created_at'] = createdAt;
    map['id'] = id;
    map['updated_at'] = updatedAt;
    map['url'] = url;
    return map;
  }

}