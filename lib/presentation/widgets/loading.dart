import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:desafio_supremo/core/theme/colors.dart';

class PageLoading extends StatelessWidget {
  const PageLoading({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      enabled: true,
      loop: 1,
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [kLightGrey, kDarkGrey],
        tileMode: TileMode.mirror,
      ),
      child: child,
    );
  }
}
