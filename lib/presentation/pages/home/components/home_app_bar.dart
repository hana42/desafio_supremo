import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/theme/constants.dart';

class HomeAppBar extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
                  text: _auth.currentUser!.displayName,
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
