import 'package:flutter/material.dart';
import 'package:hijra/containers/menu_container.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "QURANIFY",
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2.0),
        ),
      ),
      backgroundColor: Color(0xFFF0F0F0),
      body: MenuContainer(),
    );
  }
}
