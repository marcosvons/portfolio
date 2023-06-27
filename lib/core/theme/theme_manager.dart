import 'package:flutter/material.dart';

const inter = 'Inter';

class ThemeManager {
  static ThemeData light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.black,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0xFFE3E6EA),
      cursorColor: Color(0xff383838),
    ),
    appBarTheme: const AppBarTheme(
      shadowColor: Color(0xffC77DFF),
      backgroundColor: Color(0xffC77DFF),
      titleTextStyle: TextStyle(
        fontSize: 16,
        color: Color(0xff383838),
        fontWeight: FontWeight.w600,
        fontFamily: inter,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xff000000),
      // ignore: avoid_redundant_argument_values
      onPrimary: Color(0xff5A189A),
      secondary: Colors.white,
      onSecondary: Color(0xffC77DFF),
      surface: Color(0xff661BB0),
      tertiary: Color(0xFFE0AAFF),
      error: Colors.red,
    ),
    textTheme: const TextTheme(
      labelLarge: TextStyle(),
      displayLarge: TextStyle(
        fontSize: 32,
        color: Color(0xFFE0AAFF),
        fontWeight: FontWeight.w600,
        fontFamily: inter,
        letterSpacing: 1.5,
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        color: Color(0xFFE0AAFF),
        fontWeight: FontWeight.w600,
        fontFamily: inter,
        letterSpacing: 1.5,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        color: Color(0xFFE0AAFF),
        fontWeight: FontWeight.w600,
        fontFamily: inter,
      ),
      titleLarge: TextStyle(
        fontSize: 14,
        color: Color(0xff383838),
        fontWeight: FontWeight.w500,
        fontFamily: inter,
      ),
      titleMedium: TextStyle(
        fontSize: 12,
        color: Color(0xff383838),
        fontWeight: FontWeight.w500,
        fontFamily: inter,
      ),
      titleSmall: TextStyle(
        fontSize: 13,
        color: Color(0xff383838),
        fontWeight: FontWeight.w500,
        fontFamily: inter,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Color(0xff05051B),
        fontWeight: FontWeight.w400,
        fontFamily: inter,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        color: Color(0xff05051B),
        fontWeight: FontWeight.w400,
        fontFamily: inter,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: Color(0xff05051B),
        fontWeight: FontWeight.w400,
        fontFamily: inter,
      ),
    ),
  );
}
