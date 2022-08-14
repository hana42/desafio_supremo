import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/constants.dart';
import 'percent_indicator.dart';

class UserGoalsCard extends StatelessWidget {
  const UserGoalsCard({
    Key? key,
    required this.title,
    this.subtitle,
    required this.goal,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final double goal;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kLightGrey,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2))),
      shadowColor: kDarkGrey.withOpacity(0.4),
      elevation: 4,
      borderOnForeground: true,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: kDefaultPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/piggybank.svg',
              width: 30,
              color: kPurple,
            ),
            const SizedBox(width: 25),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, maxLines: 1),
                  Text(
                    subtitle ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
            PercentIndicator(value: goal),
          ],
        ),
      ),
    );
  }
}
