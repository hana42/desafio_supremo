import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../../../shared/theme/colors.dart';

class AnimatedSavingsContainer extends StatelessWidget {
  const AnimatedSavingsContainer(
      {Key? key, required this.amount, required this.visibility})
      : super(key: key);
  final int amount;
  final bool visibility;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: Matrix4.translationValues(0, visibility ? 0 : -10, 0),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: visibility ? 1.0 : 0.0,
                child: Text(
                  Utils().formatCurrency(amount),
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: Matrix4.translationValues(0, visibility ? -10 : 0, 0),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: visibility ? 0.0 : 1.0,
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 4,
                  decoration: BoxDecoration(
                    color: kPurple,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
