import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final GetStorage _box = GetStorage();
  final _key = 'isDarkMode';

  _SaveThemeFromBox(bool isDarkMode) {
    _box.write(_key, isDarkMode);
  }

  bool _LoadThemeFromBox() => _box.read<bool>(_key) ?? false;

  ThemeMode get theme => _LoadThemeFromBox() ? ThemeMode.light : ThemeMode.dark;

  void SwitchTheme() {
    Get.changeThemeMode(_LoadThemeFromBox()?ThemeMode.light: ThemeMode.dark);
    _SaveThemeFromBox(!_LoadThemeFromBox());
  }
}
