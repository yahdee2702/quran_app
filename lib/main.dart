import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/screen/main_screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Al-Qur'an Al-Kareem",
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 5,
          toolbarHeight: 60,
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Poppins",
      ),
      home: const MainScreen(),
    );
  }
}
