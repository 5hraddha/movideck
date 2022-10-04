import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/storage/storage_service.dart';
import '../../services/storage/storage_service_implementation.dart';
import '../../ui/movideck_theme.dart';

class ThemeSwitchProvider extends StateNotifier<MoviDeckTheme> {
  late bool _isDark;
  late StorageService _storageService;
  bool get isDark => _isDark;

  ThemeSwitchProvider() : super(MoviDeckTheme()) {
    _isDark = false;
    _storageService = StorageServiceImplementation();
    getPreferences();
  }

  //Switching the themes
  set isDark(bool value) {
    _isDark = value;
    _storageService.setTheme(value);
  }

  //Get user preferences from the shared preferences
  void getPreferences() async {
    _isDark = await _storageService.getTheme();
  }
}

final themeNotifierProvider =
    StateNotifierProvider<ThemeSwitchProvider, MoviDeckTheme>(
        (_) => ThemeSwitchProvider());
