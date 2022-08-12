import 'package:flutter/material.dart';

import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/injection.dart';
import 'package:desafio_supremo/presentation/bloc/balance/balance_cubit.dart';
import 'package:desafio_supremo/presentation/pages/transfer/transfer_destiny.dart';
import 'package:desafio_supremo/presentation/widgets/header.dart';

class TransferScreen extends StatelessWidget {
  TransferScreen({Key? key}) : super(key: key);

  final amount = locator.get<BalanceCubit>().state.props;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: kBlack),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code, color: kPurple),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              title: 'Qual o valor da transferência?',
              text: 'Saldo disponível em conta R\$ $amount',
            ),
            const SizedBox(height: 32),
            Flexible(
              child: Padding(
                padding: kDefaultPadding,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'R\$ ',
                  ),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const TransferDestiny()),
                  );
                },
                child: const Text('Transferir'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
