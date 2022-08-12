import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/constants.dart';
import 'transfer_confirmation.dart';

class TransferDestiny extends StatelessWidget {
  const TransferDestiny({
    super.key,
  });

  // final valueTextController = MoneyMaskedTextController(
  //   leftSymbol: r'R$ ',
  // );

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
            Text(
              'Para quem você quer transferir?',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 15),
            Text.rich(
              TextSpan(
                text:
                    'Encontre um contato na sua lista ou inicie uma nova transferência',
                style: Theme.of(context).textTheme.bodyText2,
                children: [
                  TextSpan(
                    text: '',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Flexible(
              child: NuInputField(
                autoFocus: true,
                textInputType: TextInputType.text,
                hint: 'Nome, CPF/CNPJ ou chave Pix',
                // controller: valueTextController,
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => const TransferConfirmation()),
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

class NuInputField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType textInputType;
  final bool autoFocus;
  final String? hint;

  const NuInputField({
    this.controller,
    this.textInputType = TextInputType.text,
    this.autoFocus = false,
    this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          TextFormField(
            cursorColor: kPurple,
            autofocus: autoFocus,
            keyboardType: textInputType,
            textAlign: TextAlign.left,
            controller: controller,
            style: Theme.of(context).textTheme.bodyText1,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.subtitle1,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
            ),
          ),
          const Divider(
            height: 1,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
