import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app2/cubit/cubit_state.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://newsapi.org/",
        receiveDataWhenStatusError: true));
  }
  static Future<Response> getData(
  {required String url, required Map <String, dynamic>queries}
      ) async{
     return await dio!.get(url,queryParameters: queries );
   }
  }



