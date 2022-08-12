import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:desafio_supremo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:desafio_supremo/injection.dart' as di;
import 'app/view/app.dart';
import 'package:desafio_supremo/app/bloc_observer.dart';
import 'package:authentication_repository/authentication_repository.dart';
import '../../../core/theme/colors.dart';

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




