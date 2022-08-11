import 'package:flutter/material.dart';

import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/presentation/widgets/glass_morphism.dart';

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
      height: vertical ?  size.height * 0.4 :  size.height * 0.2,
      color: color,
      child: Padding(
        padding: kDefaultPadding,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'nobank',
                style: TextStyle(
                  color: kBlack.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/images/onboarding_5.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                'assets/images/chip.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreditCardBack extends StatelessWidget {
  const CreditCardBack({
    Key? key,
    required this.color,
    required this.width,
    required this.height,
    required this.vertical,
  }) : super(key: key);

  final Color color;
  final double width;
  final double height;
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      width: vertical ? width * 0.5 : width * 0.75,
      height: vertical ? height * 0.45 : height * 0.25,
      color: color,
      child: Padding(
        padding: kDefaultPadding,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Verso',
                style: TextStyle(
                  color: kBlack.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Align(
            //       alignment: Alignment.centerRight,
            //       child: Image.asset(
            //         'assets/images/onboarding_5.png',
            //         width: 20,
            //         height: 20,
            //         color: kPurple.withOpacity(0.9),
            //       ),
            //     ),
            //   ],
            // ),
            // Align(
            //   alignment: Alignment.bottomLeft,
            //   child: Image.asset(
            //     'assets/images/onboarding_3.png',
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
