import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:userdata/homescreen/model/model.dart';
import 'package:userdata/homescreen/model/service.dart';

class HomeController extends ChangeNotifier {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobNoController = TextEditingController();
  final addressController = TextEditingController();
  String userId = '';
  String imageBinary = '';

  final ProfileService _profileService = ProfileService();
  Future<UserModel?> getUserProfile() async {
    final response = await _profileService.getUserProfile();
    if (response != null) {
      print('hello${response.username}');
      userId = response.userId;
      userNameController.text = response.username;
      mobNoController.text = response.mobile;
      addressController.text = response.address;
      emailController.text = response.email;
      imageBinary = response.imageBinary;

      // notifyListeners();
      return response;
    }
    return null;
  }

  void updateUserProfile(context) async {
    final user = UserModel(
      userId: userId,
      address: addressController.text,
      email: emailController.text,
      username: userNameController.text,
      mobile: mobNoController.text,
      imageBinary: imageBinary,
    );
  }
}
