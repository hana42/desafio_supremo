import 'package:flutter/material.dart';

import '../../cards/cards_screen.dart';
import '../../deposit/deposit_screen.dart';
import '../../pix/pix_screen.dart';
import '../../savings/savings_screen.dart';
import '../../statement/statement_screen.dart';
import '../../transfer/transfer_screen.dart';

import 'home_nav_menu_item.dart';

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
                  HomeNavMenuItem(
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
