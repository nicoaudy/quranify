import 'package:flutter/material.dart';
import 'package:hijra/containers/menu_container.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      body: new MenuContainer(),
    );
  }
}
