import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business_logic/view_models/viewmodels.dart';
import '../../ui/views/views.dart';
import '../../ui/widgets/widgets.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  // List of views to show in BottomNavigationBar
  static List<Widget> pages = <Widget>[
    Home(),
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationBarViewModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: pages[provider.currentSelectedIndex],
        bottomNavigationBar: _buildBottomNavigationBar(provider),
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
  Widget _buildBottomNavigationBar(BottomNavigationBarViewModel provider) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: provider.currentSelectedIndex,
      onTap: provider.updateSelectedIndex,
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
