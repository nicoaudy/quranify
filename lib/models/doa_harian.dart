import 'dart:convert';

DoaHarian doaHarianFromJson(String str) => DoaHarian.fromJson(json.decode(str));

String doaHarianToJson(DoaHarian data) => json.encode(data.toJson());

class DoaHarian {
  String title;
  String arabic;
  String latin;
  String translation;

  DoaHarian({
    this.title,
    this.arabic,
    this.latin,
    this.translation,
  });

  factory DoaHarian.fromJson(Map<String, dynamic> json) => DoaHarian(
        title: json["title"] == null ? null : json["title"],
        arabic: json["arabic"] == null ? null : json["arabic"],
        latin: json["latin"] == null ? null : json["latin"],
        translation: json["translation"] == null ? null : json["translation"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "arabic": arabic == null ? null : arabic,
        "latin": latin == null ? null : latin,
        "translation": translation == null ? null : translation,
      };
}
