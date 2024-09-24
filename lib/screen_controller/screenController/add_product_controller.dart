import 'package:fashion_dx/repository/add_product_repository.dart';
import 'package:fashion_dx/screens/home/fashion_home_screen.dart';
import 'package:fashion_dx/utIls/utils.dart';
import 'package:flutter/material.dart';

class AddProductController with ChangeNotifier {
  bool _addProductLoading = false;
  bool get addProductLoading => _addProductLoading;
  void setaddProductLoading(bool load) {
    _addProductLoading = load;
    notifyListeners();
  }

  final _myRepo = AddProductRepository();
  void addProduct(dynamic data, BuildContext context) async {
    setaddProductLoading(true);
    _myRepo.addProductApi(data).then((value) {
      Utils.toastSuccessMessage("uploaded succesfully");
      setaddProductLoading(false);

      Navigator.push(context,
              MaterialPageRoute(builder: (context) => FashionHomeScreen()))
          .onError((error, stack) {
        setaddProductLoading(false);
      });
    });
  }
}
