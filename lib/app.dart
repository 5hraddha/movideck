import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'business_logic/view_models/viewmodels.dart';
import 'business_logic/utils/constants.dart';
import 'ui/widgets/widgets.dart';
import 'ui/movideck_theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _themeNotifier = ref.watch(themeNotifierProvider);
    final _bottomNavigationBarNotifier =
        ref.watch(bottomNavigationBarNotifierProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoviDeck',
      theme:
          _themeNotifier.isDark ? MoviDeckTheme.dark() : MoviDeckTheme.light(),
      home: SafeArea(
        child: Scaffold(
          appBar: _buildAppBar(),
          body: appPages[_bottomNavigationBarNotifier.selectedIndex],
          bottomNavigationBar: const BottomNavigationBarWidget(),
        ),
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
}
