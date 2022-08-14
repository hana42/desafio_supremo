import '../../../widgets/advertisement_card.dart';
import '../../../widgets/header.dart';
import 'package:flutter/material.dart';

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
        AdvertisementCard(
          'Crédito sem anuidade',
          'Seu crédito é sempre sem anuidade! Solicite uma análise agora mesmo.',
          buttonText: 'Solicitar',
        ),
        Header(
          title: 'Cartões',
          text:
              'Na nobank seu crédito é sempre sem anuidade! Solicite uma análise agora mesmo.',
        ),
      ],
    );
  }
}
