import 'package:flutter/material.dart';

import '../../../../core/theme/constants.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          RichText(
            text: TextSpan(
              text: 'Hello, ',
              style: Theme.of(context).textTheme.bodyText2,
              children: [
                TextSpan(
                  text: userName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '!',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
          const Icon(
            Icons.menu,
            size: 32,
          )
        ],
      ),
    );
  }
}
