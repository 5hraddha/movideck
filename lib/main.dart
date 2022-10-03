import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'services/service_locator.dart';
import 'ui/views/views.dart';
import 'ui/widgets/widgets.dart';
import 'ui/movideck_theme.dart';

Future main() async {
  setupServiceLocator();
  // Load .env file
  await dotenv.load(fileName: '.env');
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  final theme = MoviDeckTheme.light();

  // List of views to show in BottomNavigationBar
  static List<Widget> pages = <Widget>[
    const Home(),
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoviDeck',
      theme: theme,
      home: SafeArea(
        child: Scaffold(
          appBar: _buildAppBar(),
          body: pages[_selectedIndex],
          bottomNavigationBar: _buildBottomNavigationBar(),
        ),
      ),
    );
  }

  // Update the selected index when tapped on BottomNavigationBar icons
  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
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
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
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
