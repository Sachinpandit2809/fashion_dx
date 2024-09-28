import 'package:fashion_dx/data/network/base_api_services.dart';
import 'package:fashion_dx/data/network/network_api_services.dart';
import 'package:fashion_dx/resource/app_url.dart';

class ProductRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> addProductApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiService(ApiUrl.fashon_home, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

// update product
  Future<dynamic> updateProductApi(dynamic data, dynamic id) async {
    try {
      dynamic response =
          await _apiServices.getPatchApiService(ApiUrl.fashon_home, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // deleteProduct
  Future<dynamic> deleteProductApi(dynamic id) async {
    try {
      dynamic response =
          await _apiServices.getDeleteApiService(ApiUrl.fashon_home, id);
      return response;
    } catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
