import 'package:flutter/material.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:firebase_core/firebase_core.dart';

import 'package:desafio_supremo/app/bloc_observer.dart';
import 'package:desafio_supremo/core/theme/theme.dart';
import 'package:desafio_supremo/firebase_options.dart';
import 'package:desafio_supremo/injection.dart' as di;
import 'package:desafio_supremo/injection.dart' as di;
import 'package:desafio_supremo/presentation/pages/home_screen.dart';

import '../../../core/theme/colors.dart';

import 'app/view/app.dart';

void main() {
  di.init();
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



Future <void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,


  );

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(App(authenticationRepository: authenticationRepository));

  di.init();

}
