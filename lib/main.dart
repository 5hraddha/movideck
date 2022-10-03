import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import '../../business_logic/view_models/viewmodels.dart';
import 'services/service_locator.dart';
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

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoviDeck',
      theme: MoviDeckTheme.light(),
      home: ChangeNotifierProvider<BottomNavigationBarViewModel>(
        child: const BottomNavigationBarWidget(),
        create: (BuildContext context) => BottomNavigationBarViewModel(),
      ),
    );
  }
}
