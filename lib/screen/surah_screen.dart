import 'package:flutter/material.dart';
import 'package:quran_app/components/ayah_list_item.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/utils.dart';
import 'package:quran_app/data/ayah_data.dart';
import 'package:quran_app/data/surah_data.dart';

class SurahScreen extends StatefulWidget {
  final SurahData surahData;
  const SurahScreen({Key? key, required this.surahData}) : super(key: key);

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  List<AyahData> surahAyahs = [];
  AyahData? basmallah;
  var gettingState = 1;

  Future<void> fetchAyahs() async {
    try {
      setState(() {
        gettingState = 1;
      });
      surahAyahs = await gettingAyahs(widget.surahData);
      switch (surahAyahs[0].number) {
        case 1:
          break;
        case 1236:
          break;
        default:
          basmallah = await gettingAyah(1);
      }
      setState(() {
        gettingState = 0;
      });
    } catch (e) {
      setState(() {
        gettingState = -1;
      });
    }
  }

  Widget bodyBuilding() {
    switch (gettingState) {
      case 1:
        return const SliverFillRemaining(child: loadingWidget);
      case -1:
        return SliverFillRemaining(child: errorWidget);
      default:
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index == 0) {
                return basmallah != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 10.0,
                        ),
                        child: AyahListItem(
                          ayah: basmallah!,
                          showNumber: false,
                        ),
                      )
                    : const SizedBox(height: 10.0);
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      AyahListItem(
                        ayah: surahAyahs[index - 1],
                        showNumber: true,
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                );
              }
            },
            childCount: surahAyahs.length,
          ),
        );
    }
  }

  @override
  void initState() {
    super.initState();

    fetchAyahs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: fetchAyahs,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: null,
              centerTitle: true,
              floating: true,
              pinned: false,
              snap: false,
              title: Hero(
                tag: widget.surahData.nameEng,
                child: Text(
                  widget.surahData.nameEng,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
            bodyBuilding(),
          ],
        ),
      ),
    );
  }
}
