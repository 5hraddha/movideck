import 'package:flutter/material.dart';
import './movideck_theme.dart';
import './components/components.dart';
import './screens/screens.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  final theme = MoviDeckTheme.light();

  static List<Widget> pages = <Widget>[
    const Home(),
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.orange),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'MoviDeck',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
              height: 32.0,
            ),
            centerTitle: false,
            actions: [
              const ThemeSwitch(),
            ],
          ),
          body: pages[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
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
          ),
        ),
      ),
    );
  }
}
