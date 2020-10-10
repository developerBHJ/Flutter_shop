import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_shop/config/service.dart';

/*
网络请求
异步
 */
Future request(url,{pragma}) async {
  try{
    print('开始获取数据' + url + pragma);
    Response response;
    Dio dio = Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded") as String;
    if(pragma == null){
      response = await dio.post(servicePath[url]);
    }else{
      response = await dio.post(servicePath[url],data: pragma);
    }
    if(response.statusCode == 200){ // 请求成功
      return response.data;
    }else{
      throw Exception('服务器异常');
    }
  }catch(error){
    print('网络请求错误：' + error);
    return print(error);
  }
}
