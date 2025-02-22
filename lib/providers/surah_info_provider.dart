import 'package:flutter/foundation.dart';
import 'package:hijra/models/surah_info.dart';
import 'package:hijra/services/ApiService.dart';

class SurahInfoProvider with ChangeNotifier {
  List<SurahInfo> data = [];
  List _audioUrl = [
    'http://ia802609.us.archive.org/13/items/quraninindonesia/001AlFaatihah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/002AlBaqarah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/003AliImran.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/004AnNisaa.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/005AlMaaidah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/006AlAnaam.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/007AlAaraaf.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/008AlAnfaal.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/009AtTaubah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/010Yunus.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/011Huud.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/012Yusuf.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/013ArRaad.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/014Ibrahim.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/015AlHijr.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/016AnNahl.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/017AlIsraa.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/018AlKahfi.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/019Maryam.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/020Thaahaa2.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/021AlAnbiyaa.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/022AlHajj.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/023AlMuminuun.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/024AnNuur.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/025AlFurqaan.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/026AsySyuaaraa.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/027AnNaml.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/028AlQashash.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/029AlAnkabuut.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/030ArRuum.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/031Luqman.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/032AsSajdah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/033AlAhzab.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/034Sabaa.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/035Faathir.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/036Yaasiin.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/037AshShaaffaat.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/038Shaad.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/039AzZumar.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/040AlMuumin.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/041Fushshilat.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/042AsySyuura.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/043AzZukhruf.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/044AdDukhaan.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/045AlJaatsiyah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/046AlAhqaaf.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/047Muhammad.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/048AlFath.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/049AlHujuraat.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/050Qaaf.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/051AdzDzaariyaat.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/052AthThuur.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/053AnNajm.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/054AlQamar.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/055ArRahmaan.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/056AlWaqiah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/057AlHadiid.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/058AlMujaadilah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/059AlHasyr.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/060AlMumtahanah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/061AshShaff.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/062AlJumuah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/063AlMunaafiquun.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/064AtTaghaabun.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/065AthThalaaq.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/066AtTahrim.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/067AlMulk.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/068AlQalam.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/069AlHaaqqah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/070AlMaaarij.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/071Nuh.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/072AlJin.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/073AlMuzzammil.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/074AlMuddatstsir.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/075AlQiyaamah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/076AlInsaan.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/077AlMursalaat.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/078AnNaba.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/079AnNaaziaat.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/080Abasa.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/081AtTakwiir.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/082AlInfithaar.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/083AlMuthaffifin.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/084AlInsyiqaaq.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/085AlBuruuj.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/086AthThaariq.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/087AlAalaa.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/088AlGhaasyiyah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/089AlFajr.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/090AlBalad.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/091AsySyams.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/092AlLail.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/093AdhDhuhaa.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/094AlamNasyrah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/095AtTiin.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/096AlAlaq.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/097AlQadr.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/098AlBayyinah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/099AlZalzalah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/100AlAadiyaat.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/101AlQaariah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/102AtTakaatsur.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/103AlAshr.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/104AlHumazah.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/105AlFiil.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/106Quraisy.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/107AlMaauun.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/108AlKautsar.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/109AlKaafiruun.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/110AnNashr.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/111AlLahab.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/112AlIkhlash.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/113AlFalaq.mp3',
    'http://ia802609.us.archive.org/13/items/quraninindonesia/114AnNaas.mp3',
  ];
  bool _isPlay = false;

  // constructor like component didmount but in the service
  SurahInfoProvider() {
    _fetchData();
  }

  _fetchData() async {
    List<SurahInfo> data = await ApiService().loadInfo();

    this.data = data;
    notifyListeners();
  }

  bool get isPlay => _isPlay;
  setPlay() {
    _isPlay = !_isPlay;
    notifyListeners();
  }

  String findAudioUrl(id) {
    return _audioUrl[id - 1];
  }
}
