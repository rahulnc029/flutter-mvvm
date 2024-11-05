

import 'package:flutter_mvvm/data/network/baseApiService.dart';
import 'package:flutter_mvvm/data/network/networkApiService.dart';
import 'package:flutter_mvvm/res/app_url.dart';

class AuthRepository{

  final BaseApiService _apiService = NetworkApiResponse();

  Future<dynamic> loginApi(dynamic data) async{
    try{
      dynamic response = await _apiService.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async{
    try{
      dynamic response = await _apiService.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}