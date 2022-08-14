import 'package:flutter/material.dart';

import '../../../../core/theme/constants.dart';

class PixHeader extends StatelessWidget {
  const PixHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Minha área Pix',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            'Tudo o que você precisa para pagar, transferir ou cobrar.',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
