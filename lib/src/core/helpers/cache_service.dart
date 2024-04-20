import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheStorage {
  static late final SharedPreferences _sharedPrefrences;

  static Future<void> init() async {
    _sharedPrefrences = await SharedPreferences.getInstance();
  }

  static void write(String key, dynamic value) {
    if (value is String) {
      _sharedPrefrences.setString(key, value);
    } else if (value is int) {
      _sharedPrefrences.setInt(key, value);
    } else if (value is double) {
      _sharedPrefrences.setDouble(key, value);
    } else if (value is bool) {
      _sharedPrefrences.setBool(key, value);
    } else if (value is List<String>) {
      _sharedPrefrences.setStringList(key, value);
    }
  }

  static dynamic read(String key) {
    return _sharedPrefrences.get(key);
  }

  static void delete(String key) {
    _sharedPrefrences.remove(key);
  }

  static void deleteAll() {
    _sharedPrefrences.clear();
  }
}

class SecureStorage {
  SecureStorage._();
  static const _storage = FlutterSecureStorage();

  static Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  static Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
