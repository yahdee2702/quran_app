import 'package:flutter/material.dart';

const loadingWidget = Center(
  child: CircularProgressIndicator(),
);

final errorWidget = Center(
  child: Text(
    "There's an error while getting the datas!",
    style: TextStyle(
      color: Colors.black.withOpacity(0.5),
      fontSize: 12,
    ),
  ),
);

final containerBoxDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.black, width: 1.0),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.10),
      blurRadius: 2.0,
      offset: const Offset(2, 2),
    ),
  ],
);

final sajdaBoxDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.yellow, width: 2.0),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.10),
      blurRadius: 2.0,
      offset: const Offset(2, 2),
    ),
  ],
);

final importantSajdaBoxDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.yellow, width: 3.5),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.10),
      blurRadius: 2.0,
      offset: const Offset(2, 2),
    ),
  ],
);

const blackFadedColor = Color.fromRGBO(32, 32, 32, 1.0);
