import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData _theme = _buildTheme();

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Colors.lightBlue[400],
    accentColor: Colors.amberAccent,
    primaryColorBrightness: Brightness.light,
    accentColorBrightness: Brightness.light,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      disabledElevation: 0.0,
    ),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
    primaryIconTheme: base.primaryIconTheme.copyWith(color: Colors.black),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline6: base.headline6.copyWith(
      fontFamily: GoogleFonts.robotoCondensed().fontFamily,
      fontSize: 24.0,
    ),
  );
}

ThemeData getThemeData(BuildContext context) {
  return _theme;
}
