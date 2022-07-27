import 'package:desafio_supremo/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection.dart' as di;

import 'presentation/bloc/balance/balance_bloc.dart';
import 'presentation/bloc/statement/statement_bloc.dart';
import 'presentation/pages/statement_page.dart';

void main() {
  di.init();

   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator.get<BalanceBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator.get<StatementBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: CustomTheme().lightTheme,
        home: const BalancePage(),
      ),
    );
  }
}
