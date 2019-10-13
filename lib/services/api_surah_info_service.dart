import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hijra/models/surah_info.dart';

class ApiSurahInfoService {
  Future<List<SurahInfo>> loadData() async {
    String response = await rootBundle.loadString('static/surah_info.json');
    List collection = jsonDecode(response);
    return collection.map((json) => SurahInfo.fromJson(json)).toList();
  }
}
