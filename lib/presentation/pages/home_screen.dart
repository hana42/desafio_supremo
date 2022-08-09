import 'package:flutter/material.dart';

import '../widgets/balance_widget.dart';
import '../widgets/cards.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/percent_widget.dart';
import '../widgets/single_row_menu.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              userName: "David Bond",
            ),
            BalanceWidget(),
            CardsList(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SingleRowMenu(
                    iconUrl: 'assets/icons/extract3.svg',
                    text: 'Extrato',
                  ),
                  const SingleRowMenu(
                    iconUrl: 'assets/icons/pix.svg',
                    text: 'Pix',
                  ),
                  const SingleRowMenu(
                    iconUrl: 'assets/icons/transfer2.svg',
                    text: 'Transferir',
                  ),
                  const SingleRowMenu(
                    iconUrl: 'assets/icons/code7.svg',
                    text: 'Pagar',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PercentWidget(
                    value: 75 / 100,
                    textvalue: '${75}%',
                    text: 'Poupança',
                  ),
                  const PercentWidget(
                    value: 50 / 100,
                    textvalue: '${50}%',
                    text: 'Gastos Mensais',
                  ),
                  const PercentWidget(
                    value: 25 / 100,
                    textvalue: '${25}%',
                    text: 'Cartão',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
