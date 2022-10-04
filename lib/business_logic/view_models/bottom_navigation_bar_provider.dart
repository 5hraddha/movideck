import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigationBarProvider extends StateNotifier<int> {
  int _selectedIndex = 0;

  BottomNavigationBarProvider(super.state);

  //Get current selected screen index
  int get currentSelectedIndex => _selectedIndex;

  //Update selected screen index
  void updateSelectedIndex(int newIndex) {
    _selectedIndex = newIndex;
  }
}

final bottomNavigationBarNotifierProvider =
    StateNotifierProvider<BottomNavigationBarProvider, int>(
        (_) => BottomNavigationBarProvider(0));
