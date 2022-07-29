import 'package:flutter/material.dart';

import 'injection.dart' as di;

import 'package:desafio_supremo/core/theme/theme.dart';
import 'presentation/pages/statement_screen.dart';

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
      theme: CustomTheme().lightTheme,
      home: const StatementScreen(),
    );
  }
}
