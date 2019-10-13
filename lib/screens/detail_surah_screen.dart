import 'package:flutter/material.dart';

class DetailSurahScreen extends StatelessWidget {
  final int index;

  DetailSurahScreen({@required this.index});

  @override
  Widget build(BuildContext context) {
    print(index);
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      )),
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
