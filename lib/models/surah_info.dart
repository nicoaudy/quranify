class SurahInfo {
  final String translation;
  final String arabic;
  final String latin;
  final int count;
  final int index;
  final String opening;
  final String closing;

  SurahInfo(this.translation, this.arabic, this.latin, this.count, this.index, this.opening, this.closing);

  SurahInfo.fromJson(Map<String, dynamic> json) :
        translation = json['translation'],
        arabic = json['arabic'],
        latin = json[' latin'],
        count = json['count'],
        index = json['index'],
        opening = json['opening'],
        closing = json['closing'];

}