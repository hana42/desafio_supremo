import 'dart:math';

import 'package:flutter/material.dart';

import '../../../shared/widgets/credit_card.dart';

class MyTransform extends StatefulWidget {
  const MyTransform({Key? key, required this.cardColor}) : super(key: key);
  
  final Color cardColor;

  @override
  State<MyTransform> createState() => _MyTransformState();
}

class _MyTransformState extends State<MyTransform>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  double dragPosition = 0;
  bool isFront = true;
  bool isFrontStart = true;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    controller.addListener(() {
      setState(() {
        dragPosition = animation.value;
        setImageSide();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final angle = dragPosition / 180 * pi;

    return GestureDetector(
      onHorizontalDragStart: (details) {
        controller.stop();
        isFrontStart = isFront;
      },
      onHorizontalDragUpdate: (details) {
        setState(
          () {
            dragPosition -= details.delta.dx;
            dragPosition %= 360;

            setImageSide();
          },
        );
      },
      onHorizontalDragEnd: (details) {
        final velocity = details.velocity.pixelsPerSecond.dx.abs();
        final double end = isFront ? (dragPosition > 180 ? 360 : 0) : 180;

        if (velocity >= 100) {
          setState(() {
            isFront = !isFrontStart;
          });
        }

        animation =
            Tween<double>(begin: dragPosition, end: end).animate(controller);

        controller.forward(from: 0);
      },
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(angle),
        alignment: FractionalOffset.center,
        child: isFront
            ? CreditCard(
                color: widget.cardColor,
                vertical: true,
              )
            : Transform(
                transform: Matrix4.identity()..rotateY(pi), //rotateX(pi)
                alignment: FractionalOffset.center,
                child: CreditCardBack(
                  color: widget.cardColor,
                  width: 350,
                  height: 600,
                  vertical: true,
                ),
              ),
      ),
    );
  }

  void setImageSide() {
    if (dragPosition <= 90 || dragPosition >= 270) {
      setState(() {
        isFront = true;
      });
    } else {
      setState(() {
        isFront = false;
      });
    }
  }
}
