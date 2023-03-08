class ProfessionalModel {
  String name;
  String urlImage;

  ProfessionalModel({
    required this.name,
    required this.urlImage,
  });

  ProfessionalModel.fromMap(Map<String, dynamic> map)
      : name = map["name"],
        urlImage = map["urlImage"];

  Map<String, dynamic> toMap() {
    return {"name": name, "urlImage": urlImage};
  }
}
