import 'dart:ui';
import 'package:flutter/material.dart';
// base theme

class ThemeColor {
  static const Color white = Color(0xffffffff);
  static const Color primary = Color(0xFF24476F);
  static const Color black = Color(0x000000);
  static const Color secondaryRed = Color(0xffE2173A);
  static const Color primaryYellow = Color(0xFFF4C744);
  static const Color primaryGreen = Color(0xff5EBE4E);
  static const Color secondaryDarkGrey = Color(0xff606260);
  static const Color primaryGrey = Color(0xFF8D8D8D);

  ThemeData get themeData {
    ColorScheme colorSchemeSchool = ColorScheme(
      // primary green
      primary: Color(0xFF24476F),
      // primary blue
      // primaryVariant: Color(0xffFFE9DDC1),
      // gradient 1
      surface: Color(0xFFFFFFFF), //193258
      // gradient 2
      background: Color(0xffF1F3F4),
      // secondary grey
      //secondary: Color(0xffF1F3F4),
      secondary: Color(0xFF193258),
      // secondary dark grey
      // secondaryVariant: Color(0xff606260),
      // secondary red
      error: Color(0xffE2173A),
      // primary green
      onPrimary: Color(0xFFFFFFFF),
      // primary blue
      onSecondary: Color(0xff239DD1),
      // secondary grey
      onSurface: Color(0xFF193258),
      // secondary dark grey
      onBackground: Color(0xff606260),
      // secondary red
      onError: Color(0xffE2173A),
      // white
      brightness: Brightness.light,
    );

    return ThemeData.from(colorScheme: colorSchemeSchool);
  }
}
