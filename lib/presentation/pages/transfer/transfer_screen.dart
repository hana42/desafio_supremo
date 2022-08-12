import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/presentation/pages/transfer_destiny.dart';
import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key, required this.amount});

  // final valueTextController = MoneyMaskedTextController(
  //   leftSymbol: r'R$ ',
  // );
  final int amount;

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
            Text(
              'Qual é o valor da transferência?',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 15),
            Text.rich(
              TextSpan(
                text: 'Saldo disponível em conta ',
                style: Theme.of(context).textTheme.bodyText2,
                children: [
                  TextSpan(
                    text: 'R\$$amount',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Flexible(
              child: NuInputField(
                autoFocus: true,
                textInputType: TextInputType.number,
                // controller: valueTextController,
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const TransferDestiny()),
                  );
                },
                child: const Text('Confirmar'),
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
