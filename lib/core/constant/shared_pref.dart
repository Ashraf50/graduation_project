import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

class SharedPreferenceUtils {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({required String key, required dynamic value}) {
    if (value is String) {
      return sharedPreferences.setString(key, value);
    } else if (value is int) {
      return sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return sharedPreferences.setDouble(key, value);
    } else {
      return sharedPreferences.setBool(key, value);
    }
  }

  static Object? getData({required String key}) {
    if (sharedPreferences.containsKey(key)) {
      return sharedPreferences.get(key);
    } else {
      return null;
    }
  }

  static Future<bool> removeDate({required String key}) {
    return sharedPreferences.remove(key);
  }
}
