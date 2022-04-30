import 'package:flutter/material.dart';
import 'package:quran_app/components/expanded_horizontal.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/data/ayah_data.dart';
import 'package:quran_app/data/translate_id_data.dart';
import 'package:quran_app/utils.dart';

class AyahListItem extends StatelessWidget {
  final AyahData ayah;
  final bool showNumber;
  const AyahListItem({
    Key? key,
    required this.ayah,
    required this.showNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ExpandedHorizontal(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text.rich(
                  TextSpan(
                    text: removeBasmallahAtStart(ayah),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                    children: showNumber
                        ? [
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(2.0),
                                      decoration: BoxDecoration(
                                        color: blackFadedColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      height: 40,
                                      width: 40,
                                      child: Center(
                                        child: Text(
                                          convertToArabicNumber(
                                            ayah.numberInSurah.toString(),
                                          ),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]
                        : [],
                  ),
                ),
              ),
            ),
            const Divider(height: 15),
            Row(
              children: [
                Expanded(
                  child: Text(
                    ayah.translate?.translates[TranslateID.indonesia] ??
                        "No Translate!",
                    style: const TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
