import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business_logic/view_models/theme_switch_provider.dart';

class ThemeSwitch extends ConsumerWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _themeNotifier = ref.watch(themeNotifierProvider.notifier);
    return Switch(
      value: _themeNotifier.isDark,
      onChanged: (value) =>
          ref.read(themeNotifierProvider.notifier).isDark = value,
      trackColor: MaterialStateProperty.all(const Color(0xFFC84B31)),
      activeColor: Colors.white,
      splashRadius: 10.0,
      inactiveThumbColor: Colors.white,
      activeThumbImage: const AssetImage('assets/images/night.png'),
      inactiveThumbImage: const AssetImage('assets/images/day.png'),
    );
  }
}
