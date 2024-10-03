import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  //create a singleton wtih named instance

  SharedPreferences? _sharedPreferences;

  static final SharedPrefs _instance = SharedPrefs._internal();
  factory SharedPrefs() => _instance;
  SharedPrefs._internal();


  initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async {
    return await _sharedPreferences!.setString(key, value);
  }

  String? getString(String key) {
    return _sharedPreferences!.getString(key);
  }

  clearSingleObject(String key)async{ 
    await _sharedPreferences!.remove(key);
  } 

  clearAll() async{ 
    await _sharedPreferences!.clear();
  }
}
