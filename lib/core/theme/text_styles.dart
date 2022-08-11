import 'package:flutter/material.dart';
import 'colors.dart';

const TextStyle kHeadline5 = TextStyle(
  fontSize: 24,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  color: kPurple,
  letterSpacing: 0,
);

/* DEFAULTS
** AppBar title
** AlertDialog title
** FlexibleSpaceBar title
** PaginatedDataTable header
** SearchPage TextField */

const TextStyle kHeadline6 = TextStyle(
  fontSize: 18,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  color: kBlack,
  letterSpacing: 0,
);

/* DEFAULTS
** ShowTimePicker am/pm & label
** AlertDialog content
** PaginatedDataTable header
** CircleAvatar
** DropdownButton content & items
** ExpansionTile
** GridTitleBar title & subtitle
** InputDecorator label
** ListTile title
** PopupMenu
** SnackBar content
** TextField editableText & label */
TextStyle kSubtitle1 = const TextStyle(
  fontSize: 16,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  color: kTextBlack,
  letterSpacing: 0,
);

/* DEFAULTS
** DatePickerModeToggleButton toggle
** AlertDialog title
** FlexibleSpaceBar title
** PaginatedDataTable header
** SearchPage TextField */
TextStyle kSubtitle2 = const TextStyle(
  fontSize: 16,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  color: kDarkGrey,
  letterSpacing: 0,
  height: 2,
);

/* DEFAULTS
** showDatePicker year item
** Chip label
** DrawerHeader child
** NavigationRail label
** RangeSlider valueIndicator
** Slider valueIndicator
** Stepper title
** UserAccountsDrawerHeader accountName
** Material child */
const TextStyle kBodyText1 = TextStyle(
  fontSize: 18,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  color: kBlack,
  letterSpacing: 0,
  wordSpacing: -0.2,
);

// Common text
const TextStyle kBodyText2 = TextStyle(
  fontSize: 16,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  color: kTextBlack,
  letterSpacing: 0,
  height: 2,
);

// StatementScreen ListTile subtitle
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
