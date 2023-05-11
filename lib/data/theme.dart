
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TravelTheme{
  TravelTheme._();

  static ThemeData get theme => ThemeData(
    primaryColor: const Color(0xff202053),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500
      ),
      
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xff202053)
    ),
    textTheme: textTheme
  );

  static TextTheme get textTheme {
    return TextTheme(
      // caption: ,
      labelLarge: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.grey
      ),
      // subtitle1: 
      titleSmall: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      // subtitle2: 
      bodyLarge:  GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      // 
    );
  }
}