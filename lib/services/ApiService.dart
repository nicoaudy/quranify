import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hijra/models/detail_surah.dart';
import 'package:hijra/models/surah_info.dart';

class ApiService {
  Future<List<SurahInfo>> loadInfo() async {
    String response = await rootBundle.loadString('static/surah_info.json');
    List collection = jsonDecode(response);
    return collection.map((json) => SurahInfo.fromJson(json)).toList();
  }

  Future<DetailSurah> loadSurah(index) async {
    String response = await rootBundle.loadString('static/$index.json');
    var collection = jsonDecode(response);
    var data = collection['$index'];
    return DetailSurah.fromJson(data);
  }
}
