import 'package:autocinema/data/models/response_model.dart';
import 'package:autocinema/helpers/get_storages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Network {
  Network._internal();
  static Network _instance = Network._internal();
  static Network get i => _instance;

  Dio _dio = Dio(
    BaseOptions(
      baseUrl: GetStorages.i.api,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: _setHeaders,
    ),
  );

  Future<ResponseModel> post({@required route, data = const {}}) async {
    final ResponseModel resquest = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await _dio.post(route, data: data);
      if (response.statusCode == 200) {
        final ResponseModel body = ResponseModel.fromJson(response.data);
        if (body.status) {
          resquest.status = body.status;
          resquest.data = body.data;
        } else {
          resquest.message = body.message;
        }
      }
    } on DioError catch (e) {
      resquest.message = e.error.toString();
    }
    return resquest;
  }

  Future<ResponseModel> get({@required route}) async {
    final ResponseModel resquest = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await _dio.get(route);
      if (response.statusCode == 200) {
        final ResponseModel body = ResponseModel.fromJson(response.data);
        if (body.status) {
          resquest.status = body.status;
          resquest.data = body.data;
        } else {
          resquest.message = body.message;
        }
      }
    } on DioError catch (e) {
      resquest.message = e.error.toString();
    }
    return resquest;
  }

  static Map<String, String> _setHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
}
