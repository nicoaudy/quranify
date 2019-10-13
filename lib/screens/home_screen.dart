import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hijra/components/info_card.dart';
import 'package:hijra/models/surah_info.dart';
import 'package:hijra/providers/surah_info_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final surahInfo = Provider.of<SurahInfoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Quranify"),
      ),
      body: ListView.builder(
        itemCount: surahInfo.data.length,
        itemBuilder: (BuildContext context, int index) {
          return InfoCard(
            title: surahInfo.data[index].latin,
            trans: surahInfo.data[index].translation,
            arab: surahInfo.data[index].arabic,
          );
        },
      ),
    );
  }
}
