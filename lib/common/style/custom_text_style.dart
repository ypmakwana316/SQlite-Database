import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  const CustomTextStyle();

  static TextStyle getTitleStyle({
    Color textColor = Colors.black,
    double fontSize = 17,
    final fontWeight = FontWeight.normal,
  }) =>
      GoogleFonts.poppins(
        color: textColor,
        fontWeight: fontWeight,
        height: 1.5,
        fontSize: fontSize,
      );


}