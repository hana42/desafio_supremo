import 'package:flutter/material.dart';

import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/core/theme/text_styles.dart';

class CustomTheme {
  ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: kBlack,
    textTheme: kTextTheme,
    colorScheme: kColorScheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(elevation: 0),
    iconTheme: const IconThemeData(color: kPurple),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(kPurple),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: const UnderlineInputBorder(),
      hintStyle: const TextStyle(color: Colors.black),
      enabledBorder:
          const UnderlineInputBorder(borderSide: BorderSide(color: kDarkGrey)),
      focusedBorder:
          const UnderlineInputBorder(borderSide: BorderSide(color: kDarkGrey)),
      errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
      focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
      fillColor: Colors.black,
      contentPadding: kDefaultPadding / 2,
      labelStyle: kBodyText2,
      prefixStyle: kBodyText2,
    ),
  );
}
