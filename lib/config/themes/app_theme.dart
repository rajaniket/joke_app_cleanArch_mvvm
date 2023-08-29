import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get myTheme {
    return ThemeData.dark(useMaterial3: true).copyWith(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Color(0xFF9070B7),
        centerTitle: true,
      ),
      scaffoldBackgroundColor: const Color(0xFF59646D),
      primaryColor: Colors.white,
      splashColor: Colors.transparent,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
    );
  }
}
