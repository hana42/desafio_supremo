import 'package:flutter/material.dart';

import 'colors.dart';
import 'constants.dart';
import 'text_styles.dart';

class CustomTheme {
  ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: kBlack,
      textTheme: kTextTheme,
      colorScheme: kColorScheme,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),
      iconTheme: const IconThemeData(color: kPurple),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kPurple),
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(kButtonPadding),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          textStyle: MaterialStateProperty.all<TextStyle>(kTextButton),
          minimumSize: MaterialStateProperty.all<Size>(const Size(200, 40)),
          maximumSize: MaterialStateProperty.all<Size>(const Size(280, 60)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: const UnderlineInputBorder(),
        hintStyle: const TextStyle(color: Colors.black),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1)),
        focusedBorder:
            const UnderlineInputBorder(borderSide: BorderSide(color: kBlack)),
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1)),
        focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1)),
        fillColor: kBlack,
        contentPadding: kDefaultPadding / 2,
        labelStyle: kBodyText2,
        prefixStyle: kBodyText2,
        isDense: true,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ));
}
