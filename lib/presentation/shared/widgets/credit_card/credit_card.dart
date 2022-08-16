import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../theme/constants.dart';
import 'glass_morphism.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
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
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                (FirebaseAuth.instance.currentUser?.displayName ?? 'David Bond')
                    .toUpperCase(),
                style: Theme.of(context).textTheme.button,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/images/chip.png',
                width: 35,
                height: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
