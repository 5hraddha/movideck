import 'package:flutter/foundation.dart';

class BottomNavigationBarViewModel extends ChangeNotifier {
  int _selectedIndex = 0;

  //Get current selected screen index
  int get currentSelectedIndex => _selectedIndex;

  //Update selected screen index
  void updateSelectedIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }
}
