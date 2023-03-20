import 'package:flutter/material.dart';

class DefaultTheme {
  static ThemeData get dark => ThemeData(
        fontFamily: 'Roboto',
        primaryColorDark: const Color.fromARGB(255, 194, 194, 194),
        scaffoldBackgroundColor: const Color.fromARGB(255, 12, 12, 12),
        iconTheme: IconThemeData(color: Colors.grey[200], size: 16),
        textTheme: TextTheme(
          bodySmall: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w300,
              fontSize: 12),
          bodyMedium: TextStyle(
            color: Colors.grey[400],
            fontWeight: FontWeight.w500,
          ),
          headlineSmall: TextStyle(
              color: Colors.grey[200],
              fontWeight: FontWeight.w800,
              height: 1.3,
              letterSpacing: .4,
              fontSize: 24),
          titleMedium: TextStyle(
              color: Colors.grey[200],
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
      );
}
