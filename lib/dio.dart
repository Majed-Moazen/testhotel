import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class dioclass {
  static Dio? dio;
  static  init()  {

  return  dio= Dio( BaseOptions(
    baseUrl: 'https://www.hotelsgo.co/test/',

    receiveDataWhenStatusError: true,
  ));

  }
  static Future<Response?>  get(path) async  {
   return await dio?.get(path);

  }
  static Future<Response?>  post(path,data) async  {
    return await dio?.post(path ,data: data);

  }
}
