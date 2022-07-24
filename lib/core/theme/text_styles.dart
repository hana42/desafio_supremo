import 'package:flutter/material.dart';
import 'colors.dart';

<<<<<<< Updated upstream
const TextStyle kHeader6 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: kBlack,
);

const TextStyle kHeader5 = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w700,
  color: kPurple,
);

const TextStyle kSubtitle = TextStyle(
  fontSize: 18,
  color: kBlack,
);

const TextStyle kBodyText = TextStyle(
  fontSize: 16,
  color: kBlack,
);
const TextStyle kBodyTextBold = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: kBlack,
);

const TextStyle kBodyTextEmphasis = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: kBlack,
);
=======
const TextStyle kHeader6 =
    TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kBlack);

const TextStyle kHeader5 =
    TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: kPurple);

const TextStyle kSubtitle = TextStyle(fontSize: 18, color: kBlack);

const TextStyle kBodyText = TextStyle(color: kBlack);

const TextStyle kBodyTextBold =
    TextStyle(fontWeight: FontWeight.bold, color: kBlack);

const TextStyle kBodyTextEmphasis =
    TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kBlack);

const TextStyle kTextButton = TextStyle(fontSize: 18, color: kLightGrey);
>>>>>>> Stashed changes

const TextStyle kTextButtom = TextStyle(
  fontSize: 18,
  color: kLightGrey,
);

TextTheme kTextTheme = Typography().white.copyWith(
      headline5: kHeader5,
      headline6: kHeader6,
      subtitle1: kSubtitle,
      bodyText1: kBodyTextEmphasis,
      bodyText2: kBodyText,
      overline: kBodyTextEmphasis,
    );
