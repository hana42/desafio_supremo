import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  final String? text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.roboto(
        color: color,
        fontSize: fontSize ?? 18,
        fontWeight: fontWeight,
      ),
    );
  }
}
