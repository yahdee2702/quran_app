import 'package:quran_app/data/sajda_data.dart';
import 'package:quran_app/data/translate_data.dart';

class AyahData {
  final int number;
  final String text;
  final int numberInSurah;
  final int juz;
  final SajdaData sajda;
  QuranTranslate? translate;

  AyahData({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.sajda,
  });

  factory AyahData.fromJSON(Map<String, dynamic> theJson) {
    return AyahData(
      number: theJson['number'],
      text: theJson['text'],
      numberInSurah: theJson['numberInSurah'],
      juz: theJson['juz'],
      sajda: SajdaData.fromJSON(theJson['sajda']),
    );
  }
}
