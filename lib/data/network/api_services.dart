import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:r4everstore/data/network/base_api_services.dart';
import 'package:r4everstore/data/network/exception.dart';
import 'package:r4everstore/services/session.dart';

class ApiServices implements BaseApiServices{
  Dio dio = Dio();
  // final String baseUrl = "https://r4everstore-backend.mooo.com/api/";
  final String baseUrl = "http://15.207.240.235:8080/api/";
  // final String baseUrl = "http://192.168.201.245:8080/api/";

  @override
  Future getRequest(String url, {Map<String, dynamic> data = const {}, bool token = true}) async{
    try{
      debugPrint(baseUrl+url);
      debugPrint("params $data");
      Response response = await dio.get(baseUrl+url, data: data, options: Options(
        headers: token ? {
          'x-auth-token': Session.token,
        } : {}
      )).timeout(const Duration(minutes: 1));
      return returnResponse(response);
    }on SocketException{
      throw const NoInternetException();
    }on TimeoutException{
      throw const RequestTimeoutException();
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  @override
  Future postRequest(String url, {Map<String, dynamic> data = const {}, bool withFile = false, bool token = true}) async{
    try{
      debugPrint(baseUrl+url);
      debugPrint("params $data");
      Response response = await dio.post(
          baseUrl+url,
        data: withFile ? FormData.fromMap(data) : data,
        options: Options(
          contentType: withFile ? Headers.formUrlEncodedContentType : Headers.jsonContentType,
          headers: token ? {
            'x-auth-token': Session.token,
          } : {}
        ),
      ).timeout(const Duration(minutes: 1));
      return returnResponse(response);
    }on SocketException{
      throw const NoInternetException();
    }on TimeoutException{
      throw const RequestTimeoutException();
    }
  }

  dynamic returnResponse(Response response){
    debugPrint("status code: ${response.statusCode}");
    debugPrint("result: ${response.data}");
    switch(response.statusCode){
      case 200 : return response.data;
      case 201 : return response.data;
      case 400 : return response.data;
      case 401 : return const UnauthorisedException();
      case 500 : return const FetchDataException();
      default : return const RequestTimeoutException();
    }
  }

}