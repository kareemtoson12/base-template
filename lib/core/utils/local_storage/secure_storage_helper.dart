import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  SecureStorageHelper._();

  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static Future<void> setData(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  /// Gets a String value from FlutterSecureStorage with given [key].
  static Future<String?> getData(String key) async {
    return await _secureStorage.read(key: key);
  }

  /// Removes a value from FlutterSecureStorage with given [key].
  static Future<void> removeData(String key) async {
    await _secureStorage.delete(key: key);
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static Future<void> clearAllData() async {
    await _secureStorage.deleteAll();
  }
}
