import 'package:flutter/material.dart';
import 'package:hijra/components/card_info.dart';
import 'package:hijra/screens/detail_surah_screen.dart';
import 'package:provider/provider.dart';
import 'package:hijra/providers/surah_info_provider.dart';

class QuranScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final surahInfo = Provider.of<SurahInfoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AL-QURAN",
          style: TextStyle(letterSpacing: 2.0, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
        itemCount: surahInfo.data.length,
        itemBuilder: (BuildContext context, int index) {
          final surah = surahInfo.data[index];
          return Hero(
            tag: surah.latin,
            child: CardInfo(
              index: surah.index,
              title: surah.latin,
              trans: surah.translation,
              arab: surah.arabic,
              onTap: () {
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
            ),
          );
        },
      ),
    );
  }
}
