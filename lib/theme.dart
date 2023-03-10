import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData _baseTheme = ThemeData(brightness: Brightness.light);

ThemeData appTheme = ThemeData.light().copyWith(
  backgroundColor: const Color(0xfff7f7f7),
  iconTheme: const IconThemeData(color: Color(0xff3e433d)),
  textTheme: GoogleFonts.nunitoTextTheme(_baseTheme.textTheme).copyWith(
    headline1: GoogleFonts.nunito(
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Color(0xff3e433d),
      ),
    ),
    headline2: GoogleFonts.nunito(
      textStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Color(0xff3e433d),
      ),
    ),
    headline3: GoogleFonts.nunito(
      textStyle: const TextStyle(
        fontSize: 16,
        color: Color(0xff3e433d),
      ),
    ),
    headline5: GoogleFonts.nunito(
      fontSize: 20,
      fontWeight: FontWeight.w900,
    ),
    headline6: GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: const Color(0xff673c36),
    ),
    bodyText2: GoogleFonts.nunito(
      fontSize: 16,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(0xff91c789),
    secondary: const Color(0xff91c789),
  ),
);
