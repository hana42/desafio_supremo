import 'package:flutter/material.dart';
import '../../widgets/header.dart';
import '../../widgets/nav_menu_item.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(
            title: 'Como você quer depositar na sua conta Nobank?',
            text: '',
          ),
          Expanded(
            child: Column(
              children: const [
                NavMenuItem(
                  'Pix',
                  Icons.pix,
                  subtitle:
                      'Sem custo e cai na hora, mesmo de madrugada e fim de semana.',
                ),
                NavMenuItem(
                  'Boleto',
                  Icons.payment,
                  subtitle:
                      'Sem custo e pode levar 3 dias úteis para o dinheiro cair.',
                ),
                NavMenuItem(
                  'TED/DOC',
                  Icons.receipt,
                  subtitle:
                      'Pode ter custo e cai somente em horário comercial de dias úteis.',
                ),
                NavMenuItem(
                  'Trazer seu salário',
                  Icons.attach_money,
                  subtitle:
                      'Receba todo mês direto aqui na sua conta, sem custo.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
