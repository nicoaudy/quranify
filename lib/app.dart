import 'package:flutter/material.dart';
import 'package:hijra/providers/theme_provider.dart';
import 'package:hijra/screens/home_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      title: 'Quranify',
      theme: theme.getTheme(),
      home: HomeScreen(),
    );
  }
}
