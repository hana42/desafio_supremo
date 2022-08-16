import 'package:flutter/material.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/di/injection.dart' as di;
import 'firebase_options.dart';
import 'presentation/app.dart';

void main() {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  initFirebase();
}

initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;
  runApp(App(authenticationRepository: AuthenticationRepository()));
}
