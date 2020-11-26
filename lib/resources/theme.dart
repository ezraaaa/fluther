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
    appBarTheme: AppBarTheme(
      color: Colors.white,
      textTheme: _buildTextTheme(base.textTheme),
      centerTitle: false,
      brightness: Brightness.light,
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.lightBlue.withOpacity(0.25),
      selectionHandleColor: Colors.lightBlue,
    ),
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
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
      fontFamily: GoogleFonts.assistant().fontFamily,
      fontSize: 24.0,
    ),
  );
}

ThemeData getThemeData(BuildContext context) {
  return _theme;
}
