import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    colorScheme: const ColorScheme.light(
      surface: Colors.white,
      onSurface: Colors.black,
      primary: Color.fromRGBO(206, 147, 216, 1),
      onPrimary: Colors.black,
      secondary: Color.fromRGBO(244, 143, 177, 1),
      onSecondary: Colors.white,
      tertiary: Color.fromRGBO(255, 204, 128, 1),
      error: Colors.redAccent,
      outline: Color(0xff424242),
    ),
  );
}
