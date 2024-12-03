import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color.fromARGB(255, 118, 199, 175),
    primary: Color.fromARGB(255, 14, 83, 72),
    secondary: Color.fromARGB(255, 156, 255, 214),
    tertiary: Color.fromARGB(255, 38, 90, 88),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color.fromARGB(255, 14, 83, 72),
    primary: Color.fromARGB(255, 118, 199, 175),
    secondary: Color.fromARGB(255, 31, 97, 95),
    tertiary: Color.fromARGB(255, 3, 36, 30),
  ),
);
