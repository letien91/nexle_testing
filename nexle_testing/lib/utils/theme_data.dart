import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexle_testing/constants/strings.dart';

ThemeData themeData() {
  return ThemeData(
    textTheme: textTheme(),
    fontFamily: kFontName,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.black,
    unselectedWidgetColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.white,
        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.dark, // For iOS (dark icons)
      ),
      titleTextStyle: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        fontFamily: kFontName,
        color: Colors.white,
      ),
      toolbarTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  ).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  );
}
