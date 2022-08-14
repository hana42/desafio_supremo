import 'package:flutter/material.dart';

import 'pix_label_button.dart';

class PixOptionsMenu extends StatefulWidget {
  const PixOptionsMenu({Key? key}) : super(key: key);

  @override
  State<PixOptionsMenu> createState() => _PixOptionsMenuState();
}

class _PixOptionsMenuState extends State<PixOptionsMenu> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LabelButton('Pagar', Icons.payment, onPressed: () {}),
          LabelButton('Transferir', Icons.send, onPressed: () {}),
          LabelButton('Cobrar', Icons.payments, onPressed: () {}),
        ],
      ),
    );
  }
}
