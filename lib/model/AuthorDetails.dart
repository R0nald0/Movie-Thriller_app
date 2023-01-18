class AuthorDetails {
  String? name;
  String? username;
  String? avatarPath;
  double? rating;

  AuthorDetails({
      required this.name,
      required this.username,
      required this.avatarPath,
      required this.rating,});

  AuthorDetails.fromJson(dynamic json) {
    name = json['name'];
    username = json['username'];
    avatarPath = json['avatar_path'];
    rating = json['rating'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['username'] = username;
    map['avatar_path'] = avatarPath;
    map['rating'] = rating;
    return map;
  }

}