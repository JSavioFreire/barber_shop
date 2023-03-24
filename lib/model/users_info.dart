class UserInfoModel {
  bool isAdmin;
  String userPhone;

  UserInfoModel({required this.isAdmin, required this.userPhone});

  UserInfoModel.fromMap(Map<String, dynamic> map)
      : isAdmin = map["isAdmin"],
        userPhone = map["userPhone"];

  Map<String, dynamic> toMap() {
    return {"isAdmin": isAdmin, "userPhone": userPhone};
  }
}
