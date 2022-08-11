import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:flutter/material.dart';

import 'package:desafio_supremo/core/theme/colors.dart';

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
          Padding(
            padding: kDefaultPadding,
            child: Text(
              'Como você quer depositar na sua conta do Nobank',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          const DepositMenu(
              'Pix',
              'Sem custo e cai na hora, mesmo de madrugada e fim de semana.',
              Icons.pix
              // NuIcons.rewards_ic_empty_state_other,
              ),
          const DepositMenu(
              'Boleto',
              'Sem custo e pode levar 3 dias úteis para o dinheiro cair.',
              Icons.payment
              // NuIcons.ic_savings_global_action_pay,
              ),
          const DepositMenu(
              'TED/DOC',
              'Pode ter custo e cai somente em horário comercial de dias úteis.',
              Icons.receipt
              // NuIcons.nuds_ic_receipt,
              ),
          const DepositMenu(
            'Trazer seu salário',
            'Receba todo mês direto aqui na sua conta, sem custo.',
            Icons.attach_money,
            // NuIcons.ic_savings_global_action_transfer_in,
          ),
        ],
      ),
    );
  }
}

class DepositMenu extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Function()? onTap;

  const DepositMenu(
    this.title,
    this.subTitle,
    this.icon, {
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: kLightGrey,
      leading: Icon(icon, color: kPurple),
      title: Text(title, style: Theme.of(context).textTheme.bodyText2!),
      isThreeLine: true,
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.caption,
      ),
      trailing: const Icon(
        Icons.arrow_forward,
        // NuIcons.abc_ic_go_search_api_material,
      ),
    );
  }
}
