import 'package:flutter/material.dart';

class ThemeConfig {
  static const Color scaffoldBackgroundLight = Color(0xFFF8FAFC);
  static const Color scaffoldBackgroundDark = Color(0xFF222222);
  static const Color splashColor = Color(0xFF059DC0);
  static const Color seedColor = Color(0xFF059DC0);

  static const Color cardColorLight = Colors.white;
  static const Color cardColorDark = Colors.black;


  static const Color textColorLight = Colors.black;
  static const Color textColorDark = Colors.white;
  static const Color labelColorLight = Color(0x99000000);
  static const Color labelColorDark = Color(0x99ADADAD);

  static final lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: scaffoldBackgroundLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: scaffoldBackgroundLight,
      elevation: 0,
    ),
    splashColor: splashColor,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
    cardTheme: const CardTheme(
      color: cardColorLight,
      clipBehavior: Clip.hardEdge,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
        color: textColorLight,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
        color: textColorLight,
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
        color: textColorLight,
      ),

      displayLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: textColorLight,
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: textColorLight,
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: textColorLight,
      ),

      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: textColorLight,
      ),

      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: labelColorLight,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: labelColorLight,
      ),

    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: scaffoldBackgroundLight,
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
      hintStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: labelColorLight,
      ),
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: textColorLight,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: scaffoldBackgroundDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: scaffoldBackgroundDark,
      elevation: 0,
    ),
    splashColor: splashColor,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
    cardTheme: const CardTheme(
      color: cardColorDark,
      clipBehavior: Clip.hardEdge,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
        color: textColorDark,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
        color: textColorDark,
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
        color: textColorDark,
      ),

      displayLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: textColorDark,
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: textColorDark,
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: textColorDark,
      ),

      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: textColorDark,
      ),

      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: labelColorDark,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: labelColorDark,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: scaffoldBackgroundDark,
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
      hintStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: labelColorDark,
      ),
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: textColorDark,
      ),
    ),
  );

  static const backgroundGradient = LinearGradient(
      colors: [Color(0xFF059DC0), Color(0xFF6AF2F0)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);
}
