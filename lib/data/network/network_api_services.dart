import 'dart:convert';
import 'dart:io';

import 'package:fashion_dx/data/app_exception.dart';
import 'package:fashion_dx/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  static const int _seconds = 30;
  static const headers = {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*",
    'Access-Control-Allow-Headers': 'Content-Type',
    "content-type": "application/json",
  };

  @override
  Future getGetApiService(String url, {bool hasToken = true}) async {
    dynamic responseJson;
    try {
      

      dynamic response = await http
          .get(
            Uri.parse(url),
            headers: headers,
          )
          .timeout(
            const Duration(seconds: _seconds),
          );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiService(String url, data) async {
    dynamic responseJson;
    try {
      dynamic response = await http.post(Uri.parse(url), body: data);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPatchApiService(String url, data) async {
    dynamic responseJson;
    try {
      dynamic response = await http.patch(Uri.parse(url), body: data);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getDeleteApiService(String url, data) async {
    dynamic responseJson;
    try {
      dynamic response = await http.delete(Uri.parse(url), body: data);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200 || 201:
        dynamic responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        throw FetchDataException(response.body.toString());
      case 401:
        throw BadRequestException(response.body.toString());

      default:
    }
  }
}
