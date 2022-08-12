import 'package:flutter/material.dart';

import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/presentation/pages/cards/cards_screen.dart';
import 'package:desafio_supremo/presentation/pages/payment/payment_menu.dart';
import 'package:desafio_supremo/presentation/pages/pix/pix_screen.dart';
import 'package:desafio_supremo/presentation/pages/savings/savings_screen.dart';
import 'package:desafio_supremo/presentation/pages/statement/statement_screen.dart';
import 'package:desafio_supremo/presentation/pages/transfer/transfer_screen.dart';

class HomeNavigationMenu extends StatelessWidget {
  const HomeNavigationMenu({Key? key}) : super(key: key);

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
                children: const [
                  HomeNavigationMenuItem(
                    Icons.receipt,
                    'Extrato',
                    StatementScreen(),
                  ),
                  HomeNavigationMenuItem(
                    Icons.currency_exchange,
                    'Transferências',
                    TransferScreen(amount: 1345),
                  ),
                  HomeNavigationMenuItem(
                    Icons.pix,
                    'Pix',
                    PixScreen(),
                  ),
                  HomeNavigationMenuItem(
                    Icons.document_scanner,
                    'Pagamentos',
                    PaymentScreen(),
                  ),
                  HomeNavigationMenuItem(
                    Icons.credit_card,
                    'Cartão',
                    CardsScreen(),
                  ),
                  HomeNavigationMenuItem(
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

class HomeNavigationMenuItem extends StatelessWidget {
  const HomeNavigationMenuItem(this.icon, this.name, this.page, {Key? key})
      : super(key: key);

  final IconData icon;
  final String name;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (context, _, __) {
                      return page;
                    },
                    transitionsBuilder:
                        (___, Animation<double> animation, ____, Widget child) {
                      return SizeTransition(
                        sizeFactor: Tween<double>(begin: 0.5, end: 1.0)
                            .animate(animation),
                        child: child,
                      );
                    }));
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (_) => page),
            // );
          },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.only(top: 15),
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
            textStyle:
                Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
            primary: kDarkGrey,
            onSurface: kPurple,
            shadowColor: kLightGrey,
            elevation: 8,
            fixedSize: const Size(110, 110),
            side: const BorderSide(width: 1, color: kLightGrey),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: kLightGrey,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Icon(icon, color: kPurple, size: 28),
              ),
              Text(name),
            ],
          ),
        ),
      ],
    );
  }
}
