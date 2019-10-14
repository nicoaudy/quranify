import 'package:flutter/foundation.dart';
import 'package:hijra/services/ApiService.dart';

class DetailSurahProvider with ChangeNotifier {
  var data;

  fetchData(index) async {
    var data = await ApiService().loadSurah(index);
    this.data = data;
    notifyListeners();
  }
}
