// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahInfo _$SurahInfoFromJson(Map<String, dynamic> json) {
  return SurahInfo(
    json['translation'] as String,
    json['arabic'] as String,
    json['latin'] as String,
    json['count'] as int,
    json['index'] as int,
    json['opening'] as String,
    json['closing'] as String,
  );
}

Map<String, dynamic> _$SurahInfoToJson(SurahInfo instance) => <String, dynamic>{
      'translation': instance.translation,
      'arabic': instance.arabic,
      'latin': instance.latin,
      'count': instance.count,
      'index': instance.index,
      'opening': instance.opening,
      'closing': instance.closing,
    };
