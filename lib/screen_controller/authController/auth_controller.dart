import 'package:fashion_dx/modals/user_model.dart';
import 'package:fashion_dx/modals/user_model.dart';
import 'package:fashion_dx/repository/auth_repository.dart';
import 'package:fashion_dx/screens/home/fashion_home_screen.dart';
import 'package:fashion_dx/service_locater/service_locator.dart';
import 'package:fashion_dx/services/local_storage/storage_util.dart';
import 'package:fashion_dx/utIls/utils.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  final StorageUtil _storageUtil = StorageUtil();
  final _myRepo = AuthRepository();
  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;
  void setLoginLoading(bool load) {
    _loginLoading = load;
    notifyListeners();
  }

  Future<void> login(dynamic data, BuildContext context) async {
    setLoginLoading(true);

    try {
      final value = await _myRepo.loginApi(data);
      setLoginLoading(false);
      debugPrint(value.toString());
      final  userModel = UserModel.fromJson(value);
      getIt.registerSingleton<UserModel>(userModel);
      final userData = userModel.encodedJson;
      await _storageUtil.saveUserData(userData);
      Utils.toastSuccessMessage(value['message'].toString());
      if (context.mounted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FashionHomeScreen()));
      }
    } catch (error, stk) {
      setLoginLoading(false);
      debugPrint(error.toString());
      if (error.toString() == '{"message":"User not found"}invalid request') {
        Utils.toastErrorMessage("please enter correct email");
      } else if (error.toString() ==
          '{"message":"Invalid credentials"}invalid request') {
        Utils.toastErrorMessage('wrong password');
      }
    }
  }

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;
  void setSignUpLoading(bool load) {
    _signUpLoading = load;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    //somcontroller.dispose();  
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
