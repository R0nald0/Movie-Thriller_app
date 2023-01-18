class Genre {

  late int id;
  late String name;

  Genre({required this.id, required this.name,});

  Genre.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}