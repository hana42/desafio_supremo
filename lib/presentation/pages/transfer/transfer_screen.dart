import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/utils/utils.dart';

import '../../shared/theme/colors.dart';
import '../../shared/theme/constants.dart';
import '../../shared/widgets/header.dart';

import 'transfer_destiny.dart';

class TransferScreen extends StatelessWidget {
  TransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
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
              text: 'Saldo disponível em conta R\$ 1.345,00',
            ),
            const SizedBox(height: 32),
            Flexible(
              child: Padding(
                padding: kDefaultPadding,
                child: TextFormField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      if (newValue.selection.baseOffset == 0) {
                        return newValue;
                      }

                      double value = double.parse(newValue.text);
                      String newText = Utils().formatCurrency(value / 100);
                      return newValue.copyWith(
                        text: newText,
                        selection:
                            TextSelection.collapsed(offset: newText.length),
                      );
                    })
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: kBlack,
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
