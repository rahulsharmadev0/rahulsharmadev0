import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MyTheme {
  static const textColor = Color(0xff8892B2);
  static final ThemeData theme = ThemeData(
    canvasColor: const Color(0xff0A1930),
    scaffoldBackgroundColor: const Color(0xff0A1930),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      side: const BorderSide(color: Color(0xff64FFDA)),
    )),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.raleway(
          fontSize: 17,
          color: textColor,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.1,
          wordSpacing: 1.3,
          height: 1.3),
      bodySmall: GoogleFonts.raleway(fontSize: 10, color: textColor),
      labelLarge: GoogleFonts.robotoMono(fontSize: 14, color: textColor, fontWeight: FontWeight.w500),
      labelSmall: GoogleFonts.robotoMono(fontSize: 10, color: textColor, fontWeight: FontWeight.w500),
      displaySmall: GoogleFonts.raleway(fontSize: 36, color: textColor, fontWeight: FontWeight.bold),
      displayLarge: GoogleFonts.raleway(fontSize: 72, color: textColor, fontWeight: FontWeight.bold),
      titleSmall: GoogleFonts.robotoMono(fontSize: 16, color: textColor, fontWeight: FontWeight.bold),
      titleLarge: GoogleFonts.robotoMono(fontSize: 28, color: textColor, fontWeight: FontWeight.bold),
    ).apply(),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: MaterialColor(0xff64FFDA, _colorSwatch(100, 255, 218)))
        .copyWith(secondary: const Color(0xffCCD6F6))
        .copyWith(surface: const Color(0xff0A1930)),
  );

  static Map<int, Color> _colorSwatch(
    int r,
    int g,
    int b,
  ) =>
      {
        50: Color.fromRGBO(r, g, b, 0.1),
        100: Color.fromRGBO(r, g, b, 0.2),
        200: Color.fromRGBO(r, g, b, 0.3),
        300: Color.fromRGBO(r, g, b, 0.4),
        400: Color.fromRGBO(r, g, b, 0.5),
        500: Color.fromRGBO(r, g, b, 0.6),
        600: Color.fromRGBO(r, g, b, 0.7),
        700: Color.fromRGBO(r, g, b, 0.8),
        800: Color.fromRGBO(r, g, b, 0.9),
        900: Color.fromRGBO(r, g, b, 1),
      };
}
