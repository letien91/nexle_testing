import 'dart:developer';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  StorageManager._();
  static Future<void> saveData(String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is Map) {
      final String str = json.encode(value);
      prefs.setString(key, str);
    } else {
      log('Invalid Type');
    }
  }

  static Future<Object?> readData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static Future<bool> deleteData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
