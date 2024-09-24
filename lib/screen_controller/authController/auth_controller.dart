import 'package:fashion_dx/repository/auth_repository.dart';
import 'package:fashion_dx/screens/home/fashion_home_screen.dart';
import 'package:fashion_dx/utIls/utils.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;
  void setLoginLoading(bool load) {
    _loginLoading = load;
    notifyListeners();
  }

  Future<void> login(dynamic data, BuildContext context) async {
    setLoginLoading(true);

    _myRepo.loginApi(data).then((value) {
      setLoginLoading(false);
      debugPrint(value.toString());
      Utils.toastSuccessMessage(value['message'].toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) => FashionHomeScreen()));
    }).onError((error, stackTrace) {
      setLoginLoading(false);
      debugPrint(error.toString());
      if (error.toString() == '{"message":"User not found"}invalid request') {
        Utils.toastErrorMessage("please enter correct email");
      } else if (error.toString() ==
          '{"message":"Invalid credentials"}invalid request') {
        Utils.toastErrorMessage('wrong password');
      }
    });
  }

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;
  void setSignUpLoading(bool load) {
    _signUpLoading = load;
    notifyListeners();
  }

  Future<void> signup(dynamic data) async {
    setSignUpLoading(true);
    _myRepo.signUpApi(data).then((value) {
      setSignUpLoading(false);

      Utils.toastSuccessMessage(value['message']);
    }).onError(
      (error, stackTrace) {
        setSignUpLoading(false);

        Utils.toastSuccessMessage(error.toString());
      },
    );
  }
}
