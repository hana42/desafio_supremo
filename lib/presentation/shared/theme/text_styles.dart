import 'package:flutter/material.dart';

import 'colors.dart';

const TextStyle kHeadline5 = TextStyle(
  fontSize: 24,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  color: kPurple,
  letterSpacing: 0,
);

const TextStyle kHeadline6 = TextStyle(
  fontSize: 18,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  color: kBlack,
  letterSpacing: 0,
);

TextStyle kSubtitle1 = const TextStyle(
  fontSize: 16,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  color: kTextBlack,
  letterSpacing: 0,
);

TextStyle kSubtitle2 = const TextStyle(
  fontSize: 16,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  color: kDarkGrey,
  letterSpacing: 0,
  height: 2,
);

const TextStyle kBodyText1 = TextStyle(
  fontSize: 18,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  color: kBlack,
  letterSpacing: 0,
  wordSpacing: -0.2,
);

const TextStyle kBodyText2 = TextStyle(
  fontSize: 16,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  color: kTextBlack,
  letterSpacing: 0,
  height: 2,
);

TextStyle kCaption = const TextStyle(
  fontSize: 16,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  color: kDarkGrey,
  letterSpacing: 0,
  height: 2,
);

const TextStyle kTextButton = TextStyle(
  fontSize: 16,
  fontFamily: 'Roboto',
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  color: Colors.white,
  letterSpacing: 0,
);

const TextStyle kOverline = TextStyle(
  fontSize: 16,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  color: kPurple,
  letterSpacing: 0,
);

TextTheme kTextTheme = Typography().black.copyWith(
      headline5: kHeadline5,
      headline6: kHeadline6,
      subtitle1: kSubtitle1,
      subtitle2: kSubtitle2,
      bodyText1: kBodyText1,
      bodyText2: kBodyText2,
      caption: kCaption,
      button: kTextButton,
      overline: kOverline,
    );
