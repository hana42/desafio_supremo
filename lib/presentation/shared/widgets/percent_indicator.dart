import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

import '../theme/colors.dart';

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({Key? key, required this.value}) : super(key: key);
  final double value;

  @override
  Widget build(BuildContext context) {
    double percent = (1345 / 100 * value).truncateToDouble();
    if (percent > 1) {
      percent = 1;
    }
    return CircularPercentIndicator(
      radius: 30,
      lineWidth: 4,
      percent: percent,
      animation: true,
      animationDuration: 1500,
      center: Text(
        '${(percent * 100).toInt()}%',
        style:
            Theme.of(context).textTheme.bodyText1!.copyWith(color: kDarkGrey),
      ),
      progressColor: kPurple,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
