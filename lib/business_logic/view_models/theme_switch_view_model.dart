import 'package:flutter/foundation.dart';

import '../../services/service_locator.dart';
import '../../services/storage/storage_service.dart';

class ThemeSwitchViewModel extends ChangeNotifier {
  // final StorageService _storageService = serviceLocator<StorageService>();
  late bool _isDark;
  late StorageService _storageService;
  bool get isDark => _isDark;

  ThemeSwitchViewModel() {
    _isDark = false;
    _storageService = serviceLocator<StorageService>();
    getPreferences();
  }

  //Switching the themes
  set isDark(bool value) {
    _isDark = value;
    _storageService.setTheme(value);
    notifyListeners();
  }

  //Get user preferences from the shared preferences
  void getPreferences() async {
    _isDark = await _storageService.getTheme();
    notifyListeners();
  }
}
