abstract class BaseApiServices {
  Future<dynamic> getGetApiService(String url);
  Future<dynamic> getPostApiService(String url, dynamic data);
  Future<dynamic> getPatchApiService(String url, dynamic data,);
  Future<dynamic> getDeleteApiService(String url, dynamic data,);

}
