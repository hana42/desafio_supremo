import 'package:flutter/material.dart';

import '../../../shared/widgets/header.dart';

class CardsHeader extends StatefulWidget {
  const CardsHeader({Key? key}) : super(key: key);

  @override
  State<CardsHeader> createState() => _CardsHeaderState();
}

class _CardsHeaderState extends State<CardsHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Header(
          title: 'Cartões',
          text:
              'Na nobank seu crédito é sempre sem anuidade! Solicite uma análise agora mesmo.',
        ),
      ],
    );
  }
}
