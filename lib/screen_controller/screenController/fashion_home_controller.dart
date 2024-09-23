import 'package:fashion_dx/data/response/api_status_response.dart';
import 'package:fashion_dx/modals/fashion_home.dart';
import 'package:fashion_dx/repository/fashion_home_repository.dart';
import 'package:flutter/material.dart';

class FashionHomeController with ChangeNotifier {
  final FashionHomeRepository _fashionHomeRepository = FashionHomeRepository();
  ApiStatusResponse<FashionHomeModel> fashionDataList = ApiStatusResponse.loading();
  setfashionDataList(ApiStatusResponse<FashionHomeModel> fashionDataResponse) {
    fashionDataList = fashionDataResponse;
    notifyListeners();
  }

  void fetchFashionHomeData() async{
    setfashionDataList(ApiStatusResponse.loading());
    _fashionHomeRepository.getFashionDataApi().then((value) {
      debugPrint("before completed im here!");

      debugPrint("????????????????\n"+value.toString()); 

      
      setfashionDataList(ApiStatusResponse.completed(value));
    }).catchError((error) {
      setfashionDataList(ApiStatusResponse.error(error));
    });


  }
}
