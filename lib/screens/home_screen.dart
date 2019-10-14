import 'package:flutter/material.dart';
import 'package:hijra/screens/detail_surah_screen.dart';
import 'package:provider/provider.dart';
import 'package:hijra/components/info_card.dart';
import 'package:hijra/providers/surah_info_provider.dart';

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
            onTap: () {
              final surah = surahInfo.data[index];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailSurahScreen(
                    index: surah.index,
                    latin: surah.latin,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
