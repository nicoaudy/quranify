import 'package:flutter/foundation.dart';
import 'package:hijra/models/asmaul_husna.dart';
import 'package:hijra/services/ApiService.dart';

class AsmaulHusnaProvider with ChangeNotifier {
  List<AsmaulHusna> data = [];

  AsmaulHusnaProvider() {
    _fetchData();
  }

  _fetchData() async {
    List<AsmaulHusna> data = await ApiService().loadAsmaulHusna();
    this.data = data;
    notifyListeners();
  }
}
