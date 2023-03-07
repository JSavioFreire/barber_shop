class Service {
  String id;
  String name;
  String urlImage;

  Service({required this.id, required this.name, required this.urlImage});

  Service.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        urlImage = map["urlImage"];

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "urlImage": urlImage};
  }
}
