import 'package:desafio_supremo/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:desafio_supremo/core/theme/text_styles.dart';

import 'colors.dart';

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
  );
}
