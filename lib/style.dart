import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
Color nextBtnColor = Color(0xFFFFA697);
Color white = Colors.white;

// TextStyles
TextStyle fontRoboto(size, color) {
  return GoogleFonts.roboto(fontSize: size, color: color);
}

TextStyle strokeTextStyle(Color color, double fontSize) {
  return GoogleFonts.roboto(
      color: color,
      fontSize: fontSize,
      textStyle: TextStyle(
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.0
            ..color = color));
}

Stack strokeText(String text, Color color, double fontSize) {
  return Stack(
    children: [
      Text(text, style: strokeTextStyle(color, fontSize)),
      Text(text, style: fontRoboto(fontSize, color)),
    ],
  );
}
