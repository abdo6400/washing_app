
import 'package:secure_shared_preferences/secure_shared_preferences.dart';

import 'cache_consumer.dart';

class SecureCacheHelper extends CacheConsumer {
  final SecureSharedPref sharedPref;

  SecureCacheHelper({required this.sharedPref});
  @override
  Future<void> clearData() async {
    await sharedPref.clearAll();
  }

  @override
  Future<int?> getIntData({required String key}) async {
    return await sharedPref.getInt(key, isEncrypted: true);
  }

  @override
  Future<double?> getDoubleData({required String key}) async {
    return await sharedPref.getDouble(key, isEncrypted: true);
  }

  @override
  Future<String?> getStringData({required String key}) async {
    return await sharedPref.getString(key, isEncrypted: true);
  }

  @override
  Future<bool?> getBoolData({required String key}) async {
    return await sharedPref.getBool(key, isEncrypted: true);
  }

  @override
  Future<void> saveData({required String key, required value}) async {
    if (value is bool) {
      return await sharedPref.putBool(key, value);
    }
    if (value is String) {
      return await sharedPref.putString(key, value);
    }

    if (value is int) {
      return await sharedPref.putInt(key, value);
    } else {
      return await sharedPref.putDouble(key, value);
    }
  }
}
