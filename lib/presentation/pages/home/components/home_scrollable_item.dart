import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class HomeScrollableItem extends StatefulWidget {
  const HomeScrollableItem({Key? key, required this.confettiController}) : super(key: key);
  final ConfettiController confettiController;

  @override
  State<HomeScrollableItem> createState() => _HomeScrollableItemState();
}

class _HomeScrollableItemState extends State<HomeScrollableItem> {
  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: widget.confettiController,
      blastDirectionality: BlastDirectionality.explosive,
      particleDrag: 0.05,
      emissionFrequency: 0.05,
      numberOfParticles: 50,
      gravity: 0.05,
      shouldLoop: true,
      colors: const [
        Colors.green,
        Colors.blue,
        Colors.pink,
        Colors.orange,
        Colors.purple
      ],
      child: Visibility(
        visible: false,
        child: Container(
          width: 400,
          height: 400,
          color: kLightGrey,
          child: const Center(
            child: Text(
              'Parabéns',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
