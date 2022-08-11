import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    Key? key,
    required this.title,
    required this.caption,
    required this.image,
  }) : super(key: key);

  final String title;
  final String caption;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: const [
      Padding(padding: kDefaultPadding),
      Text(
        'EASY ACCESS',
        textAlign: TextAlign.left,
      ),
      Text(
        'Reach your files anytime from any devices anywhere',
        textAlign: TextAlign.left,
      ),
    ]);
  }
}
