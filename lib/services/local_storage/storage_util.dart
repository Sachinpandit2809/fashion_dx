import 'package:fashion_dx/services/local_storage/local_storage_const.dart';
import 'package:fashion_dx/services/local_storage/secure_storage.dart';
import 'package:fashion_dx/services/local_storage/shared_prefs.dart';

class StorageUtil {
  // create instance
  static final StorageUtil _instance = StorageUtil._internal();

  factory StorageUtil() {
    return _instance;
  }

  StorageUtil._internal();

  SharedPrefs sharedPrefs = SharedPrefs(); // called instance of SharedPrefs
  SecureStorage secureStorage =
      SecureStorage(); // called instance of SecureStorage

  initLocalServices() async {
    sharedPrefs.initSharedPref();
  }

  // save non - sensitive data
  saveUserData(String value) async {
    await sharedPrefs.setString(LocalStorageConst.userData, value);
  }


  //save sensitive data
  saveUserToken(String value) async {
    await secureStorage.writeSecureData(LocalStorageConst.token, value);
  }

  clearUserDate() async {
    await sharedPrefs.clearSingleObject(LocalStorageConst.userData);
    await secureStorage.deleteSecureData(LocalStorageConst.token);
  }


  clearSharedPrefs() async {
    await sharedPrefs.clearAll();
  }

  clearSecureStorage() async {
    await secureStorage.deleteAllSecureData();
  }

  clearBoth() async {
    await clearSharedPrefs();
    await clearSecureStorage();
  }
}
