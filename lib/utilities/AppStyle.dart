import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  // COLOR
  static Color colorBg = Color(0xFFF1F4FC);
  static Color colorMain = Color(0xFF5145FF);
  static Color colorPutih = Colors.white;
  static Color colorHitam = Color(0xFF180A05);
  //TEXT STYLE
  static TextStyle textMain = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: Color(0xFF180A05),
    ),
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textSubMain = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: Color(0xFF180A05),
    ),
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
  );
  static TextStyle textSidoarjoTag = GoogleFonts.poppins(
    textStyle: TextStyle(color: Color(0xFF180A05), letterSpacing: .5),
    fontSize: 45,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textCareTag = GoogleFonts.poppins(
    textStyle: TextStyle(color: Color(0xFF180A05), letterSpacing: .5),
    fontSize: 45,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static TextStyle textPositifSDA = GoogleFonts.poppins(
    textStyle: TextStyle(color: Colors.white),
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
  );

  static TextStyle textPositifAngkaSDA = GoogleFonts.poppins(
    textStyle: TextStyle(color: Colors.white),
    fontSize: 50,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textAngkaSDA = GoogleFonts.poppins(
    textStyle: TextStyle(color: Colors.white),
    fontSize: 30,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textKeteranganSDA = GoogleFonts.poppins(
    textStyle: TextStyle(color: Colors.white),
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
  );

  static TextStyle textAngkaIndo = GoogleFonts.poppins(
    textStyle: TextStyle(color: Color(0xFF837ACF)),
    fontSize: 30,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textKeteranganIndo = GoogleFonts.poppins(
    textStyle: TextStyle(color: Color(0xFF837ACF)),
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
  );
}
