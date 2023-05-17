import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.redAccent,
      brightness: Brightness.light,
    ),
  );

  static ThemeData darktheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.redAccent,
      brightness: Brightness.dark,
    ),
  );
}
