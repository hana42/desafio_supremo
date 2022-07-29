import 'package:desafio_supremo/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'injection.dart' as di;
import 'presentation/pages/statement_page.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme().lightTheme,
      home: const BalancePage(),
    );
  }
}
