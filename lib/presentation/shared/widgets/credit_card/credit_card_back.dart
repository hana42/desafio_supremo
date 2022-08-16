import 'package:flutter/material.dart';

import '../../theme/constants.dart';
import 'glass_morphism.dart';

class CreditCardBack extends StatelessWidget {
  const CreditCardBack({
    Key? key,
    required this.color,
    required this.vertical,
  }) : super(key: key);

  final Color color;
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GlassMorphism(
      width: vertical ? size.width * 0.5 : size.width * 0.7,
      height: vertical ? size.height * 0.4 : size.height * 0.2,
      color: color,
      child: Padding(
        padding: kDefaultPadding,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(
            'assets/images/mastercard.png',
            width: 40,
            height: 40,
          ),
        ),
      ),
    );
  }
}
