import 'package:flutter/material.dart';

import 'package:desafio_supremo/presentation/pages/pix/components/pix_header.dart';
import 'package:desafio_supremo/presentation/pages/pix/components/pix_options_menu.dart';
import 'package:desafio_supremo/presentation/widgets/nav_menu_item.dart';

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
          NavMenuItem('Minhas chaves', Icons.key),
          NavMenuItem('Meu limite Pix', Icons.settings),
          NavMenuItem('Me ajuda', Icons.help),
        ],
      ),
    );
  }
}
