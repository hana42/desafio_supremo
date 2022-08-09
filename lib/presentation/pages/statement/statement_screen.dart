import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/injection.dart';
import 'package:desafio_supremo/presentation/widgets/balance_widget.dart';


class StatementScreen extends StatelessWidget {
  const StatementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Extrato'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BalanceWidget(),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Suas movimentações',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(child: StatementBody()),
          ],
        ));
  }
}