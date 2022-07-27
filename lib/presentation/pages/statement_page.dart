import 'package:flutter/material.dart';

import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/presentation/widgets/balance_widget.dart';
import 'package:desafio_supremo/presentation/widgets/statement_list.dart';

class BalancePage extends StatelessWidget {
  const BalancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Extrato'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 7,
                width: MediaQuery.of(context).size.width,
                color: kLightGrey,
                padding: kHorizontalPadding,
                child: const BalanceWidget()),
            const StatementList()
          ],
        ));
  }
}
