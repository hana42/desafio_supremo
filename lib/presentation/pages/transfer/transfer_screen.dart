import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/constants.dart';
import '../../../injection.dart';
import '../../bloc/balance/balance_cubit.dart';
import 'transfer_destiny.dart';
import '../../widgets/header.dart';

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
