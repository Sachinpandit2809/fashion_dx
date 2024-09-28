import 'package:fashion_dx/repository/add_product_repository.dart';
import 'package:fashion_dx/screens/home/fashion_home_screen.dart';
import 'package:fashion_dx/utIls/utils.dart';
import 'package:flutter/material.dart';

class ProductController with ChangeNotifier {
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
          MaterialPageRoute(builder: (context) => FashionHomeScreen()));
    }).onError((error, stack) {
      setaddProductLoading(false);
    });
  }

  bool _updateProductLoading = false;
  bool get updateProductLoading => _updateProductLoading;
  void setupdateProductLoading(bool load) {
    _updateProductLoading = load;
    notifyListeners();
  }

  void updateProduct(dynamic data, dynamic id, BuildContext context) async {
    setupdateProductLoading(true);
    _myRepo.updateProductApi(data, id).then((value) {
      Utils.toastSuccessMessage("updated succesfully");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => FashionHomeScreen()));
    }).onError((error, stack) {
      Utils.toastErrorMessage(error.toString());

      setupdateProductLoading(false);
    });
  }

  bool _deleteProductLoading = false;
  bool get deleteProductLoading => _deleteProductLoading;
  void setdeleteProductLoading(bool load) {
    _deleteProductLoading = load;
    notifyListeners();
  }

  void deleteProduct(dynamic id, BuildContext context) {
    setdeleteProductLoading(true);
    _myRepo.deleteProductApi(id).then((value) {
      Utils.toastSuccessMessage("deleted product");
      setdeleteProductLoading(false);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> FashionHomeScreen()));
    }).onError(
      (error, stackTrace) {
        Utils.toastErrorMessage(error.toString());
        setdeleteProductLoading(false);
      },
    );
  }
}
