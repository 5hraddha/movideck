import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigationBarProvider {
  BottomNavigationBarProvider({required this.selectedIndex});
  int selectedIndex;
}

final bottomNavigationBarNotifierProvider =
    StateProvider<BottomNavigationBarProvider>(
        (ref) => BottomNavigationBarProvider(selectedIndex: 0));
