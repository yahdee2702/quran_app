import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:quran_app/constants.dart';
import 'package:quran_app/data/surah_data.dart';
import 'package:quran_app/screen/surah_screen.dart';

class SurahListItem extends StatelessWidget {
  final SurahData surahData;
  const SurahListItem({
    Key? key,
    required this.surahData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.black,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SurahScreen(surahData: surahData),
          ),
        );
      },
      child: Container(
        decoration: containerBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: blackFadedColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  intl.NumberFormat("00").format(surahData.number),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(
                      tag: surahData.nameEng,
                      child: Text(
                        surahData.nameEng,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      "${surahData.revelationType} | ${surahData.ayahsQuantity} Ayahs",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.75),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  surahData.name,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
