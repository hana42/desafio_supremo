import 'package:flutter/material.dart';

import 'package:desafio_supremo/core/theme/colors.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(color: kPurple),
      ),
    );
  }
}
