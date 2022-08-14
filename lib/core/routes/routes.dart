import 'package:flutter/material.dart';

import '../../presentation/bloc/app/app_bloc.dart';
import '../../presentation/bloc/app/home_page.dart';
import '../../presentation/pages/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
    default:
      return [LoginPage.page()];
  }
}
