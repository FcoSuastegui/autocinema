import 'package:autocinema/app/data/domian/network.dart';
import 'package:autocinema/app/data/models/response_model.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  static Future<ResponseModel> login({@required username, @required password}) async {
    return await Network.i.post(
      route: '/v1/app/login',
      data: {
        'username': username,
        'password': password,
      },
    );
  }

  static Future<ResponseModel> loginSocial(Map<String, dynamic> data) async {
    return await Network.i.post(
      route: '/v1/app/login-social',
      data: data,
    );
  }
}
