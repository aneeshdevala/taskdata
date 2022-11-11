import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:userdata/homescreen/controller/homecontroller.dart';

class UserImagePovHome extends ChangeNotifier {
  String imageToString = '';

  pickImage(context) async {
    final provider = Provider.of<HomeController>(context, listen: false);
    final imageFromGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    final bytes = File(imageFromGallery!.path).readAsBytesSync();
    provider.imageBinary = base64Encode(bytes);
    notifyListeners();
  }

}
