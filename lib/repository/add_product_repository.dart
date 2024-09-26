import 'package:fashion_dx/data/network/base_api_services.dart';
import 'package:fashion_dx/data/network/network_api_services.dart';
import 'package:fashion_dx/modals/fashion_home.dart';
import 'package:fashion_dx/resource/app_url.dart';
import 'package:http/http.dart' as http;

class AddProductRepository {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> addProductApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiService(ApiUrl.fashon_home, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> updateProductApi(dynamic data, dynamic id) async {
    try {
      dynamic response =
          await _apiServices.getPatchApiService(ApiUrl.fashon_home, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
