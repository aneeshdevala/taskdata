
class UserModel {
  String userId;
  String email;
  String username;
  String mobile;
  String address;
  String imageBinary;

  UserModel(
      {required this.userId,
      required this.email,
      required this.username,
      required this.mobile,
      required this.address,
      required this.imageBinary});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json["userId"] ?? "",
      email: json["email"] ?? "",
      username: json["username"] ?? "",
      mobile: json["mobile"] ?? "",
      address: json["address"] ?? "",
      imageBinary: json["imageBinary"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "email": email,
      "username": username,
      "mobile": mobile,
      "address": address,
      "imagePath": imageBinary,
    };
  }
}
