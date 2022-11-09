// To parse this JSON data, do
//
//     final postmodel = postmodelFromJson(jsonString);

import 'dart:convert';

Postmodel postmodelFromJson(String str) => Postmodel.fromJson(json.decode(str));

String postmodelToJson(Postmodel data) => json.encode(data.toJson());

class Postmodel {
    Postmodel({
        this.username,
        this.address,
        this.mobile,
        this.imagePath,
        this.email,
        this.userId,
    });

    String? username;
    String? address;
    String? mobile;
    String? imagePath;
    String? email;
    String? userId;

    factory Postmodel.fromJson(Map<String, dynamic> json) => Postmodel(
        username: json["username"],
        address: json["address"],
        mobile: json["mobile"],
        imagePath: json["imagePath"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "userId" : userId,
        "username": username,
        "address": address,
        "mobile": mobile,
        "imagePath": imagePath,
        "email": email,
    };
}
