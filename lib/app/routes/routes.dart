import 'package:flutter/cupertino.dart';

import '../bloc/app_bloc.dart';
import '../bloc/home_page.dart';
import '../login/view/login_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
    AppStatus state,
    List<Page<dynamic>> pages,
    ) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}