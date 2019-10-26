import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hijra/models/asmaul_husna.dart';
import 'package:hijra/models/detail_surah.dart';
import 'package:hijra/models/doa_harian.dart';
import 'package:hijra/models/surah_info.dart';

class ApiService {
  Future<List<SurahInfo>> loadInfo() async {
    String response = await rootBundle.loadString('static/surah_info.json');
    List collection = jsonDecode(response);
    return collection.map((json) => SurahInfo.fromJson(json)).toList();
  }

  Future<List<AsmaulHusna>> loadAsmaulHusna() async {
    String response = await rootBundle.loadString('static/asmaul-husna.json');
    var res = json.decode(response);
    Iterable data = res['data'];
    return data.map((model) => AsmaulHusna.fromJson(model)).toList();
  }

  Future<List<DoaHarian>> loadDoaHarian() async {
    String response = await rootBundle.loadString('static/doa-harian.json');
    var res = json.decode(response);
    Iterable data = res['data'];
    return data.map((model) => DoaHarian.fromJson(model)).toList();
  }

  Future<DetailSurah> loadSurah(index) async {
    String response = await rootBundle.loadString('static/$index.json');
    var collection = jsonDecode(response);
    var data = collection['$index'];
    return DetailSurah.fromJson(data);
  }
}
