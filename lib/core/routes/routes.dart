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
      print('home');
      return [HomeScreen.page()];
    case AppStatus.unauthenticated:
      print('login');
      return [LoginPage.page()];
    default:
      print('default');
      return [LoginPage.page()];
  }
}
