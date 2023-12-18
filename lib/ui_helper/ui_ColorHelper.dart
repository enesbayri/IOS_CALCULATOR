// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class ColorHelper {
  static Color buttonColor(String text) {
    return (text.codeUnitAt(0) >= 48 && text.codeUnitAt(0) <= 57 || text == ".")
        ? const Color.fromRGBO(51, 51, 51, 1)
        : ((text == "AC" || text == "+/-" || text == "%")
            ? const Color.fromRGBO(165, 165, 165, 1)
            : const Color.fromRGBO(255, 159, 10, 1));
  }

  static Color ACbuttonColor=Colors.black;
  static Color buttonColors=Colors.white;
  static Color TapColor=Colors.grey;
  static Color SeedColor=const Color.fromRGBO(255, 159, 10, 1);
}
