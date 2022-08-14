import 'package:flutter/material.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:desafio_supremo/core/theme/theme.dart';
import 'package:desafio_supremo/firebase_options.dart';

import '/presentation/pages/home/home_screen.dart';
import 'core/theme/theme.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();

  // await
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authenticationRepository = AuthenticationRepository();
  // await
  authenticationRepository.user.first;

  // runApp(App(authenticationRepository: authenticationRepository));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nobank',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme().lightTheme,
      home: const HomeScreen(),
    );
  }
}
