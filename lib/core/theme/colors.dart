import 'package:flutter/material.dart';

const primaryColor = Colors.blueGrey;

const Color kLightGrey = Color.fromARGB(255, 248, 248, 248);
const Color kDarkGrey = Color.fromARGB(255, 130, 130, 130);
const Color kPurple = Color.fromARGB(255, 163, 90, 212);
const Color kBlack = Color.fromARGB(255, 32, 32, 33);

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
