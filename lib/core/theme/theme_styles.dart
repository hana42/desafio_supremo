import 'package:flutter/material.dart';

import 'package:desafio_supremo/core/theme/theme_colors.dart';

class ThemeStyles {
  static TextStyle primaryTitle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: ThemeColors.black,
  );
  static TextStyle seeAll = TextStyle(
    fontSize: 17.0,
    color: ThemeColors.black,
  );
  static TextStyle cardDetails = const TextStyle(
    fontSize: 17.0,
    color: Color(0xff66646d),
    fontWeight: FontWeight.w600,
  );
  static TextStyle cardMoney = const TextStyle(
    color: Color(0xff66646d),
    fontWeight: FontWeight.w600,
    fontSize: 22.0,
  );
  static TextStyle tagText = TextStyle(
    fontStyle: FontStyle.italic,
    color: ThemeColors.black,
    fontWeight: FontWeight.w500,
  );
  static TextStyle otherDetailsPrimary = TextStyle(
    fontSize: 16.0,
    color: ThemeColors.black,
  );
  static TextStyle otherDetailsSecondary = const TextStyle(
    fontSize: 12.0,
    color: Colors.grey,
  );
}
