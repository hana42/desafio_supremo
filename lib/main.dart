import 'package:flutter/material.dart';

import 'package:desafio_supremo/core/theme/theme.dart';
import 'package:desafio_supremo/injection.dart' as di;
import 'package:desafio_supremo/presentation/pages/home_screen.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nobank',
      theme: CustomTheme().lightTheme,
      home: HomeScreen(),
    );
  }
}
