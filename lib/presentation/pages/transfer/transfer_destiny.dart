import 'package:flutter/material.dart';

import '../../shared/theme/constants.dart';
import '../../shared/widgets/header.dart';

import 'components/transfer_confirmation.dart';

class TransferDestiny extends StatelessWidget {
  const TransferDestiny({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(
              title: 'Para quem você quer transferir?',
              text:
                  'Encontre um contato na sua lista ou inicie uma nova transferência',
            ),
            const SizedBox(height: 32),
            Flexible(
              child: Padding(
                padding: kDefaultPadding,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: 'Nome, CPF/CNPJ ou chave Pix',
                  ),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const TransferConfirmation(),
                    ),
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
