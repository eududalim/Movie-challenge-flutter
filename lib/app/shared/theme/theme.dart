import 'package:flutter/material.dart';
import 'colors_theme_const.dart';

class DefaultTheme {
  static ThemeData get dark => ThemeData(
        primaryColor: themeYellow,
        fontFamily: 'Roboto',
        primaryColorDark: Color.fromARGB(255, 194, 194, 194),
        cardColor: const Color.fromARGB(255, 24, 24, 24),
        scaffoldBackgroundColor: const Color.fromARGB(255, 12, 12, 12),
        iconTheme: IconThemeData(color: Colors.grey[500]),
        textTheme: TextTheme(
          bodySmall: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w300,
              fontSize: 13),
          bodyMedium: TextStyle(
            color: Colors.grey[400],
            fontWeight: FontWeight.w500,
          ),
          headlineSmall: TextStyle(
              color: Colors.grey[100],
              fontWeight: FontWeight.w800,
              fontSize: 26),
          titleMedium: TextStyle(
              color: Colors.grey[100],
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
        focusColor: themeYellow.withOpacity(0.3),
        splashColor: themeYellow.withOpacity(0.4),
        hoverColor: themeYellow.withOpacity(0.3),
      );
}
