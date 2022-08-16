import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

TextStyle kHeadline3 = GoogleFonts.roboto(
  fontSize: 26,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  color: kBlack,
);

TextStyle kHeadline4 = GoogleFonts.roboto(
  fontSize: 24,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  color: kBlack,
);

TextStyle kHeadline5 = GoogleFonts.roboto(
  fontSize: 24,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  color: kPurple,
);

TextStyle kHeadline6 = GoogleFonts.roboto(
  fontSize: 18,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  color: kBlack,
);

TextStyle kSubtitle1 = GoogleFonts.roboto(
  fontSize: 16,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  color: kBlack,
);

TextStyle kSubtitle2 = GoogleFonts.roboto(
  fontSize: 16,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  color: kDarkGrey,
  height: 2,
);

TextStyle kBodyText1 = GoogleFonts.roboto(
  fontSize: 18,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  color: kBlack,
);

TextStyle kBodyText2 = GoogleFonts.roboto(
  fontSize: 16,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  color: kBlack,
  height: 2,
);

TextStyle kCaption = GoogleFonts.roboto(
  fontSize: 16,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  color: kDarkGrey,
  height: 2,
);

TextStyle kTextButton = GoogleFonts.roboto(
  fontSize: 16,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  color: Colors.white,
  letterSpacing: 0,
);

TextStyle kOverline = GoogleFonts.roboto(
  fontSize: 16,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  color: kPurple,
  letterSpacing: 0,
);

TextTheme kTextTheme = Typography().black.copyWith(
      headline3: kHeadline3,
      headline4: kHeadline4,
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
