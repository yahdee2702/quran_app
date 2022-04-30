import 'package:flutter/material.dart';
import 'package:quran_app/components/surah_list.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/utils.dart';
import 'package:quran_app/data/surah_data.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<SurahData> quranSurahs;

  var _gettingState = 1;
  var _searchField = "";
  var _searchedSurahs = <SurahData>[];
  var _activeSearch = false;
  final _searchNode = FocusNode();
  final _searchTextController = TextEditingController();

  Future<void> fetchQuranSurahs() async {
    try {
      setState(() {
        _gettingState = 1;
      });
      quranSurahs = await getQuranOnline();
      setState(() {
        _gettingState = 0;
      });
    } catch (e) {
      setState(() {
        _gettingState = -1;
      });
    }
  }

  void onSearch(String value) {
    _searchField = value;
    var foundedSurahs = quranSurahs.where((element) {
      try {
        var regex = RegExp(
          "(?:$_searchField)",
          caseSensitive: false,
        );
        return regex.hasMatch(element.nameEng);
      } catch (e) {
        return false;
      }
    }).toList();
    setState(() {
      _searchedSurahs = foundedSurahs;
    });
  }

  @override
  void initState() {
    super.initState();

    fetchQuranSurahs();
  }

  Widget bodyBuilding() {
    switch (_gettingState) {
      case 1:
        return loadingWidget;
      case -1:
        return errorWidget;
      default:
        return Column(
          children: [
            Visibility(
              visible: _activeSearch,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 16.0,
                ),
                child: TextField(
                  focusNode: _searchNode,
                  controller: _searchTextController,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black.withOpacity(0.75),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _searchField = '';
                          _activeSearch = false;
                          _searchTextController.clear();
                          _searchNode.unfocus();
                        });
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    hintText: "Search for Surahs",
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.25,
                      ),
                    ),
                  ),
                  onChanged: onSearch,
                ),
              ),
            ),
            Expanded(
              child: SurahList(
                surahs: _searchField.isEmpty ? quranSurahs : _searchedSurahs,
              ),
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _activeSearch = !_activeSearch;
                _activeSearch
                    ? _searchNode.requestFocus()
                    : _searchNode.unfocus();
              });
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              semanticLabel: "Search",
            ),
          ),
        ],
        title: const Text(
          "Al-Qur'an App",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 26,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => fetchQuranSurahs(),
        child: bodyBuilding(),
      ),
    );
  }
}
