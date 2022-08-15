import 'package:flutter/material.dart';

import '/presentation/bloc/app/app_bloc.dart';
import '/presentation/pages/home/home_screen.dart';
import '/presentation/pages/login/login_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeScreen.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
    default:
      return [LoginPage.page()];
  }
}
