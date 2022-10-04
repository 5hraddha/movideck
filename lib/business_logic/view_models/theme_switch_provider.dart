import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/storage/storage_service.dart';
import '../../services/storage/storage_service_implementation.dart';

class ThemeSwitchProvider {
  bool _isDark = false;
  late StorageService _storageService;

  ThemeSwitchProvider() {
    _storageService = StorageServiceImplementation();
    getPreferences();
  }

  //Get user preferences from the shared preferences
  void getPreferences() async {
    _isDark = await _storageService.getTheme();
  }

  bool get isDark => _isDark;
  //Switching the themes
  void toggleTheme(bool value) {
    _isDark = value;
    _storageService.setTheme(value);
  }
}

final themeNotifierProvider =
    StateProvider<ThemeSwitchProvider>((ref) => ThemeSwitchProvider());
