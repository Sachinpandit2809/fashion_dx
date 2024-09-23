import 'package:fashion_dx/data/network/base_api_services.dart';
import 'package:fashion_dx/data/network/network_api_services.dart';
import 'package:fashion_dx/modals/fashion_home.dart';
import 'package:fashion_dx/resource/app_url.dart';
import 'package:flutter/material.dart';

class FashionHomeRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<FashionHomeModel> getFashionDataApi() async {
    try {
      dynamic response =
          await _apiServices.getGetApiService(ApiUrl.fashon_home);
      dynamic res = FashionHomeModel.fromJson(response);
      debugPrint("????????????????\n"+res.toString()); 
      return res;
    } catch (e) {
      throw e;
    }
  }
}
