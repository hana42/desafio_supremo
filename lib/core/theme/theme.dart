import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTheme {
  ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: kBlack,
    textTheme: null,
    colorScheme: kColorScheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(elevation: 0),
    iconTheme: const IconThemeData(color: kPurple),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(kPurple),
      ),
    ),
  );
}
