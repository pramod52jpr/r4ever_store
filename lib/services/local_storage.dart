import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{
  static Future<bool> setItem(String key, String value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, value);
  }

  static Future<String?> getItem(String key)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<bool> removeItem(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }

  static Future<bool> clear() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }

}