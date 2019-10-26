import 'package:flutter/foundation.dart';
import 'package:hijra/models/doa_harian.dart';
import 'package:hijra/services/ApiService.dart';

class DoaHarianProvider with ChangeNotifier {
  List<DoaHarian> data = [];

  DoaHarianProvider() {
    _fetchData();
  }

  _fetchData() async {
    List<DoaHarian> data = await ApiService().loadDoaHarian();
    this.data = data;
    notifyListeners();
  }
}
