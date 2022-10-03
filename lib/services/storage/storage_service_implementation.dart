import 'package:shared_preferences/shared_preferences.dart';
import './storage_service.dart';

class StorageServiceImplementation implements StorageService {
  static const THEME_KEY = 'theme_key';

  @override
  Future<bool> getTheme() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(THEME_KEY) ?? false;
  }

  @override
  void setTheme(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(THEME_KEY, value);
  }
}
