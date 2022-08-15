import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

import '../theme/colors.dart';

class PercentWidget extends StatelessWidget {
  const PercentWidget({Key? key, required this.value}) : super(key: key);
  
  final double value;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 30,
      lineWidth: 4,
      percent: value,
      animation: true,
      animationDuration: 1500,
      center: Text(
        '${(value * 100)}%',
        style:
            Theme.of(context).textTheme.bodyText1!.copyWith(color: kDarkGrey),
      ),
      progressColor: kPurple,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
