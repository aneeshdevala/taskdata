import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:userdata/homescreen/model/model.dart';
import 'package:userdata/homescreen/model/postmodel.dart';

class PostService {
  Dio dio = Dio();
  Future<String> updateProfile(UserModel data, context) async {
    try {
      log('started');
      
      final response = await dio.post(
          'http://maccode.in/adhoccars/mypanel/api_adhocCars/user_profile_update.php',
          data: data.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile Updated'),
            backgroundColor: Colors.green,
          ),
        );
        return response.data;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Something went wrong'),
            backgroundColor: Colors.red,
          ),
        );
        return '';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong'),
          backgroundColor: Colors.red,
        ),
      );
      return '';
    }
  }
}
