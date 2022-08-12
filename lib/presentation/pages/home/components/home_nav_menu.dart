import 'package:flutter/material.dart';

import 'package:desafio_supremo/presentation/pages/cards/cards_screen.dart';
import 'package:desafio_supremo/presentation/pages/deposit/deposit_screen.dart';
import 'package:desafio_supremo/presentation/pages/home/components/home_nav_menu_item.dart';
import 'package:desafio_supremo/presentation/pages/pix/pix_screen.dart';
import 'package:desafio_supremo/presentation/pages/savings/savings_screen.dart';
import 'package:desafio_supremo/presentation/pages/statement/statement_screen.dart';
import 'package:desafio_supremo/presentation/pages/transfer/transfer_screen.dart';

class HomeNavMenu extends StatelessWidget {
  const HomeNavMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: size.height),
            child: Transform(
              transform: Matrix4.translationValues(0, -20, 0),
              child: Wrap(
                runSpacing: 15.0,
                spacing: 15.0,
                children:  [
                  const HomeNavMenuItem(
                    Icons.receipt,
                    'Extrato',
                    StatementScreen(),
                  ),
                  HomeNavMenuItem(
                    Icons.currency_exchange,
                    'Transferências',
                    TransferScreen(),
                  ),
                  const HomeNavMenuItem(
                    Icons.pix,
                    'Pix',
                    PixScreen(),
                  ),
                  const HomeNavMenuItem(
                    Icons.document_scanner,
                    'Depositar',
                    DepositScreen(),
                  ),
                  const HomeNavMenuItem(
                    Icons.credit_card,
                    'Cartão',
                    CardsScreen(),
                  ),
                  const HomeNavMenuItem(
                    Icons.inventory_sharp,
                    'Poupança',
                    SavingsScreen(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
