import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:userdata/homescreen/model/model.dart';

class ProfileService {
  Dio dio = Dio();
  Future<UserModel?> getUserProfile() async {
    try {
      print('started');

      final response = await dio.get(
          'http://maccode.in/adhoccars/mypanel/api_adhocCars/user_profile_update_list.php?user_id=2');
      print(response.data.toString());
      log(response.data.toString());
      log(' sf');
      return UserModel.fromJson(response.data['data'][0]);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
