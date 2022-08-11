import 'package:desafio_supremo/presentation/pages/backup/balance_widget.dart';
import 'package:desafio_supremo/presentation/widgets/cards.dart';
import 'package:desafio_supremo/presentation/widgets/custom_app_bar.dart';
import 'package:desafio_supremo/presentation/widgets/percent_widget.dart';
import 'package:desafio_supremo/presentation/widgets/single_row_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(userName: 'David Bond'),
              const BalanceWidget(),
              const CardsList(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SingleRowMenu(
                      iconUrl: 'assets/icons/extract3.svg',
                      text: 'Extrato',
                    ),
                    SingleRowMenu(
                      iconUrl: 'assets/icons/pix.svg',
                      text: 'Pix',
                    ),
                    SingleRowMenu(
                      iconUrl: 'assets/icons/transfer2.svg',
                      text: 'Transferir',
                    ),
                    SingleRowMenu(
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
                  children: const [
                    PercentWidget(
                      value: 75 / 100,
                    ),
                    PercentWidget(
                      value: 50 / 100,
                    ),
                    PercentWidget(
                      value: 25 / 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
