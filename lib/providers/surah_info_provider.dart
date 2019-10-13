import 'package:flutter/foundation.dart';
import 'package:hijra/models/surah_info.dart';
import 'package:hijra/services/ApiService.dart';

class SurahInfoProvider with ChangeNotifier {
  List<SurahInfo> data = [];

  // constructor like component didmount but in the service
  SurahInfoProvider() {
    _fetchData();
  }

  _fetchData() async {
    List<SurahInfo> data = await ApiService().loadInfo();

    this.data = data;
    notifyListeners();
  }
}
