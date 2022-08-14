import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  const GlassMorphism({
    Key? key,
    required this.child,
    required this.color,
    required this.width,
    required this.height,
  }) : super(key: key);

  final Widget child;
  final Color color;
  final double start = 0.9;
  final double end = 0.7;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.3, sigmaY: 3),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(start),
                color.withOpacity(end),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            border: Border.all(color: color.withOpacity(0.4)),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: child,
        ),
      ),
    );
  }
}
