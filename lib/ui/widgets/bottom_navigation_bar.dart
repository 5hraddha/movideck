import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business_logic/view_models/viewmodels.dart';
import '../../ui/views/views.dart';
import '../../ui/widgets/widgets.dart';

class BottomNavigationBarWidget extends ConsumerWidget {
  const BottomNavigationBarWidget({super.key});

  // List of views to show in BottomNavigationBar
  static List<Widget> pages = <Widget>[
    Home(),
    const FilterMovies(),
    const FavouriteMovies(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _bottomNavigationBarNotifier =
        ref.watch(bottomNavigationBarNotifierProvider.notifier);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: pages[_bottomNavigationBarNotifier.currentSelectedIndex],
        bottomNavigationBar:
            _buildBottomNavigationBar(_bottomNavigationBarNotifier, ref),
      ),
    );
  }

  // Build AppBar
  PreferredSizeWidget? _buildAppBar() {
    return AppBar(
      title: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.cover,
        height: 32.0,
      ),
      centerTitle: false,
      actions: [
        const ThemeSwitch(),
        const UserAppProfile(),
      ],
    );
  }

  // Build BottomNavigationBar
  Widget _buildBottomNavigationBar(
      BottomNavigationBarProvider _bottomNavigationBarNotifier, WidgetRef ref) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _bottomNavigationBarNotifier.currentSelectedIndex,
      onTap: (value) {
        ref
            .read(bottomNavigationBarNotifierProvider.notifier)
            .updateSelectedIndex(value);
      },
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.filter_alt),
          label: 'Filter',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorite',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
