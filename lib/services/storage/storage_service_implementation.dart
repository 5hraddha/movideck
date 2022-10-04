import 'package:shared_preferences/shared_preferences.dart';

import './storage_service.dart';

class StorageServiceImplementation implements StorageService {
  static const THEME_KEY = 'theme_key';

  // Get the theme from the stored user preferences
  @override
  Future<bool> getTheme() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(THEME_KEY) ?? false;
  }

  // Set the whether the theme is dark or not to the user preferences
  @override
  void setTheme(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(THEME_KEY, value);
  }
}
