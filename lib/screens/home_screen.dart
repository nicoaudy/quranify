import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hijra/models/surah_info.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var surahInfo = [];

  @override
  void initState() {
    super.initState();
    loadSurahInfo();
  }

  Future loadSurahInfo() async {
    String response = await rootBundle.loadString('static/surah-info.json');
    List<SurahInfo> collection = jsonDecode(response);
    setState(() => {
      surahInfo = collection
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hijr 🔥"),
      ),
      body: ListView.builder(
        itemCount: surahInfo.length,
        itemBuilder: (BuildContext context, int index) {
          SurahInfo info = surahInfo[index];
          return ListTile(
            title: Text(info.translation),
            subtitle: Text(info.latin + ' - ' + info.arabic),
          );
        },
      ),
    );
  }
}
