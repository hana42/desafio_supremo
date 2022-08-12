import 'package:flutter/material.dart';

class AccountTypes extends StatelessWidget {
  const AccountTypes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Sem mensalidades.'),
        Text('Possui um componente de poupança.'),
        Text('Múltiplas subcontas para crianças.'),
      ],
    );
  }
}
