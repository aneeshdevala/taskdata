
import 'package:dio/dio.dart';
import 'package:userdata/homescreen/model/model.dart';

class ProfileService {
  Dio dio = Dio();
  Future<UserModel?> getUserProfile() async {
    try {
      final response = await dio.get(
          'http://maccode.in/adhoccars/mypanel/api_adhocCars/user_profile_update_list.php?user_id=1');
      // log(response.toString());
      return UserModel.fromJson(response.data['data'][0]);
    } catch (e) {
      return null;
    }
  }
}
