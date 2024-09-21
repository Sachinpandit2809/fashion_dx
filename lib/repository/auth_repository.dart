import 'package:fashion_dx/data/network/base_api_services.dart';
import 'package:fashion_dx/data/network/network_api_services.dart';
import 'package:fashion_dx/resource/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> loginApi(dynamic data) async {
    dynamic response = await _apiServices.getPostApiService(ApiUrl.login, data);
    return response;
  }

  Future<dynamic> signUpApi(dynamic data) async {
    dynamic response = await _apiServices.getPostApiService(ApiUrl.signup, data);
    return response;
  }
}
