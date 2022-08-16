import 'package:flutter/material.dart';

import '../../shared/theme/constants.dart';
import '../../shared/widgets/balance/balance_widget.dart';

import 'components/statement_list_builder.dart';


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
            Expanded(child: StatementListBuilder()),
          ],
        ));
  }
}