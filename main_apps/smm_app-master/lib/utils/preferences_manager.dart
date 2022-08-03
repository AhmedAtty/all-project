import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static late final SharedPreferences prefs;
  static const String lang = 'lang';
  static const String fcmToken = 'fcm_token';
  static const String token = 'token';

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> save(Object o) async {
    await prefs.setString(o.runtimeType.toString(), jsonEncode(o));
    log('**** SAVED **** Object: ${o.runtimeType.toString()} with value: ${jsonEncode(o)}');
  }

  static bool hasKey(String key) {
    return prefs.containsKey(key);
  }

  static String? getString(String key) {
    return prefs.getString(key);
  }

  static int? getInt(String key) {
    return prefs.getInt(key);
  }

  static double? getDouble(String key) {
    return prefs.getDouble(key);
  }

  static Future<void> saveString(String key, String value) async {
    await prefs.setString(key, value);
    log('**** SAVED **** String: $key with value: $value');
  }

  static Future<void> saveBool(String key, bool value) async {
    await prefs.setBool(key, value);
    log('****SAVED**** Boolean: $key with value: $value');
  }

  static Future<void> saveInt(String key, int value) async {
    await prefs.setInt(key, value);
    log('**** SAVED **** Integer: $key with value: $value');
  }

  static Future<void> saveDouble(String key, double value) async {
    await prefs.setDouble(key, value);
    log('**** SAVED **** Double: $key with value: $value');
  }

  static bool getBool(String key) {
    return prefs.getBool(key) ?? false;
  }

  static Future<void> clear(Type type) async {
    await prefs.remove(type.toString());
  }

  static Future<void> delete(String key) async {
    await prefs.remove(key);
  }

  static Object? load(Type type) {
    return jsonDecode(prefs.getString(type.toString())!);
  }

  static Future<void> clearAppData() async {
    await prefs.clear();
  }
}
