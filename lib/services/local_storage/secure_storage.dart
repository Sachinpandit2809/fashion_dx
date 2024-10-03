import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage { 

  final FlutterSecureStorage _storage = FlutterSecureStorage();

  static final SecureStorage _instance = SecureStorage._internal();

  factory SecureStorage() =>_instance;
  

  SecureStorage._internal();


  Future<void> writeSecureData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> readSecureData(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> deleteSecureData(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAllSecureData() async {
    await _storage.deleteAll();
  }


}