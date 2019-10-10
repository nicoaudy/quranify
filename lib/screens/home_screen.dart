import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hijra/components/info_card.dart';
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
    List collection = jsonDecode(response);
    List<SurahInfo> _surahInfo =
        collection.map((json) => SurahInfo.fromJson(json)).toList();
    setState(() => surahInfo = _surahInfo);
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
          return InfoCard(
            title: info.latin,
            trans: info.translation,
            arab: info.arabic,
          );
        },
      ),
    );
  }
}
