import 'package:flutter/material.dart';

import 'package:desafio_supremo/presentation/pages/cards/components/cards_header.dart';
import 'package:desafio_supremo/presentation/pages/cards/components/cards_list.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CardsHeader(),
            CardsList(),
          ],
        ),
      ),
    );
  }
}
