import 'package:desafio_supremo/presentation/pages/pix/components/pix_header.dart';
import 'package:desafio_supremo/presentation/pages/pix/components/pix_menu.dart';
import 'package:desafio_supremo/presentation/pages/pix/components/pix_menu_item.dart';
import 'package:flutter/material.dart';

class PixScreen extends StatelessWidget {
  const PixScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          PixHeader(),
          PixOptionsMenu(),
          PixMenuItem('Minhas chaves', Icons.key),
          PixMenuItem('Meu limite Pix', Icons.settings),
          PixMenuItem('Me ajuda', Icons.help),
        ],
      ),
    );
  }
}
