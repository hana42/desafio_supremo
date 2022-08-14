import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/constants.dart';
import 'components/transfer_confirmation.dart';
import '../../widgets/header.dart';

class TransferDestiny extends StatelessWidget {
  const TransferDestiny({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before, color: kBlack),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
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
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Nome, CPF/CNPJ ou Chave Pix',
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
