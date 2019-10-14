import 'package:flutter/foundation.dart';
import 'package:hijra/services/ApiService.dart';

class DetailSurahProvider with ChangeNotifier {
  var data;
  int index;

  changeIndex(int payload) {
    this.index = payload;
  }

  fetchData() async {
    var data = await ApiService().loadSurah(this.index);
    this.data = data;
    notifyListeners();
  }
}
