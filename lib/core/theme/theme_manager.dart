import 'package:flutter/material.dart';

const inter = 'Inter';

class ThemeManager {
  static ThemeData light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: const Color(0xFF333333),
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
      primary: Color(0xff32908F),
      onPrimary: Color(0xffCCCCCC),
      secondary: Color(0xFF1A237E),
      onSecondary: Color(0xffCCCCCC),
      tertiary: Color(0xff45F0DF),
      background: Color(0xFF333333),
      onBackground: Colors.white,
    ),
    textTheme: const TextTheme(
      labelLarge: TextStyle(),
      displayLarge: TextStyle(
        fontSize: 32,
        color: Color(0xffCCCCCC),
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        color: Color(0xffCCCCCC),
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        color: Color(0xffCCCCCC),
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 13,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
