import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:userdata/homescreen/model/model.dart';
import 'package:userdata/homescreen/service/postservice.dart';
import 'package:userdata/homescreen/service/service.dart';

class HomeController extends ChangeNotifier {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobNoController = TextEditingController();
  final addressController = TextEditingController();
  String userId = '';
  String? imageBinary;

  bool readOnly = true;

  void toggleReadOnly() {
    readOnly = !readOnly;
    notifyListeners();
  }

  final ProfileService _profileService = ProfileService();
  Future<UserModel?> getUserProfile() async {
    final response = await _profileService.getUserProfile();
    if (response != null) {
      userId = response.userId;
      userNameController.text = response.username;
      mobNoController.text = response.mobile;
      addressController.text = response.address;
      emailController.text = response.email;
      imageBinary = response.imageBinary;
      return response;
    }
    return null;
  }

  final PostService _postService = PostService();
  Future<void> updateProfile({
    required BuildContext context,
  }) async {
    final UserModel data = UserModel(
        userId: '1',
        username: userNameController.text,
        email: emailController.text,
        mobile: mobNoController.text,
        address: addressController.text,
        imageBinary: imageBinary.toString());
    notifyListeners();
    final String response = await _postService.updateProfile(data, context);
    if (response.isNotEmpty) {}
    return;
  }
}
