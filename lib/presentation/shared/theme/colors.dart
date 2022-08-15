import 'package:flutter/material.dart';

const Color kLightGrey = Color(0xfff8f8f8);
const Color kDarkGrey = Color(0xff828282);
const Color kPurple = Color.fromARGB(255, 235, 96, 80);
const Color kBlack = Color(0xff202021);
const Color kTextBlack = Color(0xff23232e);

const kColorScheme = ColorScheme(
  brightness: Brightness.light,
  background: Colors.white,
  onBackground: kBlack,
  primary: Colors.white,
  onPrimary: kBlack,
  secondary: kPurple,
  onSecondary: Colors.white,
  surface: Colors.white,
  onSurface: kBlack,
  error: Colors.redAccent,
  onError: Colors.white,
);
