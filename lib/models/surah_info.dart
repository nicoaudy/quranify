import 'package:json_annotation/json_annotation.dart';

part 'surah_info.g.dart';

@JsonSerializable()
class SurahInfo {
  final String translation;
  final String arabic;
  final String latin;
  final int count;
  final int index;
  final String opening;
  final String closing;

  SurahInfo(this.translation, this.arabic, this.latin, this.count, this.index,
      this.opening, this.closing);

  factory SurahInfo.fromJson(Map<String, dynamic> json) =>
      _$SurahInfoFromJson(json);
}
