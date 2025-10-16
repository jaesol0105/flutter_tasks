import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.white,
    brightness: Brightness.light,
    surface: Colors.grey.shade300,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade300,
    centerTitle: true,
  ),
  scaffoldBackgroundColor: Colors.grey.shade400,
  dividerColor: Colors.black,
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.pinkAccent,
    brightness: Brightness.dark,
    surface: Color(0xFF121212),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF121212),
    centerTitle: true,
  ),
  scaffoldBackgroundColor: Color(0xFF1A1A1A),
  dividerColor: Colors.white,
);
