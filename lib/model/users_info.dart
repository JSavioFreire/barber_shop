class UserInfoModel {
  bool isAdmin;

  UserInfoModel({required this.isAdmin});

  UserInfoModel.fromMap(Map<String, dynamic> map) : isAdmin = map["isAdmin"];

  Map<String, dynamic> toMap() {
    return {
      "isAdmin": isAdmin,
    };
  }
}
